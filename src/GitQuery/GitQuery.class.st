Class {
	#name : #GitQuery,
	#superclass : #Object,
	#instVars : [
		'iteratorClass'
	],
	#category : #GitQuery
}

{ #category : #'instance creation' }
GitQuery class >> latestFirst [
	^ self new
		iteratorClass: GQLatestToFirstRepositoryIterator;
		yourself
]

{ #category : #accessing }
GitQuery >> iteratorClass [
	^ iteratorClass
]

{ #category : #accessing }
GitQuery >> iteratorClass: anObject [
	iteratorClass := anObject
]

{ #category : #accessing }
GitQuery >> runOn: aFileReference [
	"Runs the query on the git repository located in aFileReference."
	| iterator results|
	iterator := self iteratorClass location: aFileReference.
	
	iterator initializeIteration.
	
	results := OrderedCollection new.
	[ iterator atEnd ] whileFalse: [ 
		results add: iterator next ].
	
	iterator finishIteration.
	
	^ results
]
