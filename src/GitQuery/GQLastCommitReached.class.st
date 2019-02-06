"
I am the error raised when the last commit has been raised by an #iterator.
"
Class {
	#name : #GQLastCommitReached,
	#superclass : #Error,
	#instVars : [
		'iterator'
	],
	#category : #GitQuery
}

{ #category : #signalling }
GQLastCommitReached class >> signalIterator: aGQRepositoryIterator [
	self new
		iterator: aGQRepositoryIterator;
		signal
]

{ #category : #accessing }
GQLastCommitReached >> iterator [
	^ iterator
]

{ #category : #accessing }
GQLastCommitReached >> iterator: anObject [
	iterator := anObject
]
