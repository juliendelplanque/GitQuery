Class {
	#name : #GQLatestToFirstRepositoryIterator,
	#superclass : #GQRepositoryIterator,
	#instVars : [
		'commitsQueue',
		'shasVisited'
	],
	#category : #GitQuery
}

{ #category : #accessing }
GQLatestToFirstRepositoryIterator >> atEnd [
	^ commitsQueue isEmpty
]

{ #category : #private }
GQLatestToFirstRepositoryIterator >> dequeue [
	^ commitsQueue removeLast
]

{ #category : #private }
GQLatestToFirstRepositoryIterator >> enqueue: aLGitCommit [
	(shasVisited includes: aLGitCommit id asInteger)
		ifTrue: [ ^ self ].
		
	shasVisited add: aLGitCommit id asInteger.
	commitsQueue addFirst: aLGitCommit.
]

{ #category : #initialization }
GQLatestToFirstRepositoryIterator >> initialize [
	super initialize.
	commitsQueue := LinkedList new.
	shasVisited := Set new
]

{ #category : #private }
GQLatestToFirstRepositoryIterator >> initializeIteration [
	| commitShas |
	lGitRepository open.
	commitShas := Set new.
	lGitRepository allBranchesDo: [ :ref |
		commitShas add: ref resolve targetId hexString ].
	
	commitShas do: [ :sha | commitsQueue add: (lGitRepository revparse: sha) ]
]

{ #category : #iterating }
GQLatestToFirstRepositoryIterator >> next [
	| toReturn |
	commitsQueue
		ifEmpty: [ GQLastCommitReached signalIterator: self ].
		
	toReturn := self dequeue.
	toReturn parents do: [ :commit |
		self enqueue: commit ].
	^ toReturn asGQCommit
]
