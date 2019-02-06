Class {
	#name : #GQRepositoryIterator,
	#superclass : #Object,
	#instVars : [
		'lGitRepository'
	],
	#category : #'GitQuery-Core'
}

{ #category : #accessing }
GQRepositoryIterator class >> location: aFileReference [
	^ self new
		lGitRepository: (LGitRepository on: aFileReference);
		yourself
]

{ #category : #accessing }
GQRepositoryIterator >> atEnd [
	^ self subclassResponsibility
]

{ #category : #private }
GQRepositoryIterator >> finishIteration [
	"Hook called to do actions after iterations finished."
	self subclassResponsibility
]

{ #category : #private }
GQRepositoryIterator >> initializeIteration [
	"Hook called to do initializations before starting the iterations."
	self subclassResponsibility
]

{ #category : #private }
GQRepositoryIterator >> lGitRepository: anObject [
	lGitRepository := anObject
]

{ #category : #iterating }
GQRepositoryIterator >> next [
	"Returns the next GQCommit to be explored."
	^ self subclassResponsibility
]
