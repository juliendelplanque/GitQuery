Class {
	#name : #GQCommit,
	#superclass : #Object,
	#instVars : [
		'lGitCommit'
	],
	#category : #'GitQuery-Core'
}

{ #category : #'instance creation' }
GQCommit class >> fromLGitCommit: aLGitCommit [
	^ self new
		lGitCommit: aLGitCommit;
		yourself
]

{ #category : #accessing }
GQCommit >> author [
	"Returns the author of the commit."
	^ lGitCommit author asGQDeveloper
]

{ #category : #accessing }
GQCommit >> authoredDateAndTime [
	""
	^ lGitCommit author dateAndTime
]

{ #category : #accessing }
GQCommit >> branches [
	"Returns the branches to which this commit belongs to.
	 Belonging to a branch is defined as having one of its parents allowing to reach the branch."
	| branches |
	branches := OrderedCollection new.
	lGitCommit repository allBranchesDo: [ :branch |
		(branch resolve object isDescendantOf: lGitCommit)
			ifTrue: [ branches add: branch name ] ].
	^ branches
]

{ #category : #accessing }
GQCommit >> committedDateAndTime [
	""
	^ lGitCommit committer dateAndTime
]

{ #category : #accessing }
GQCommit >> committer [
	"Returns the committer of the commit."
	^ lGitCommit committer asGQDeveloper
]

{ #category : #testing }
GQCommit >> isInMainBranch [
	^ self shouldBeImplemented
]

{ #category : #testing }
GQCommit >> isMerge [
	^ lGitCommit isMerge
]

{ #category : #private }
GQCommit >> lGitCommit: anObject [
	lGitCommit := anObject
]

{ #category : #accessing }
GQCommit >> message [
	"Returns the commit message."
	^ lGitCommit message
]

{ #category : #accessing }
GQCommit >> modifications [
	"Returns a list of modification modeling files modified by the commit."
	| modifications |
	modifications := OrderedCollection new.
	lGitCommit parents do: [ :parent |
		(lGitCommit tree diffTo: parent tree) files
			ifNotEmpty: [ :files |
				modifications addAll: (files collect: [ :file | 
					GQModification filePath: file commitDiffWasMadeWith: parent asGQCommit ]) ] ].
		
	^ modifications
]

{ #category : #accessing }
GQCommit >> parentsSha [
	"Returns the shas of the parent commits."
	^ lGitCommit parents collect: [ :lGitParentCommit |
		lGitParentCommit asGQCommit sha ]
]

{ #category : #accessing }
GQCommit >> sha [
	"Returns the SHA of the commit."
	^ lGitCommit id hexString
]

{ #category : #accessing }
GQCommit >> tags [
	| allTags tagsToCommits |
	allTags := lGitCommit repository tags.
	tagsToCommits := allTags collect: [ :tagString | tagString -> (lGitCommit repository revparse: tagString) ].
	^ tagsToCommits
		select: [ :assoc | assoc value id = lGitCommit id ]
		thenCollect: #key
]
