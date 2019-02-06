Class {
	#name : #GitQuery,
	#superclass : #Object,
	#instVars : [
		'iteratorClass',
		'filter'
	],
	#category : #GitQuery
}

{ #category : #'instance creation' }
GitQuery class >> latestFirst [
	^ self new
		iteratorClass: GQLatestToFirstRepositoryIterator;
		yourself
]

{ #category : #configuration }
GitQuery >> authorNamed: aString [
	"Only select commits authored by an author named aString.
	 Makes no sense to be called multiple times."
	filter := filter and: [ :commit | commit author name = aString ]
]

{ #category : #configuration }
GitQuery >> commitsSatisfying: aBlock [
	"Select condition for commits."
	filter := aBlock asGQFilter
]

{ #category : #configuration }
GitQuery >> committerNamed: aString [
	"Only select commits committed by a committer named aString.
	 Makes no sense to be called multiple times."
	filter := filter and: [ :commit | commit committer name = aString ]
]

{ #category : #initialization }
GitQuery >> initialize [
	super initialize.
	filter := GQNullFilter new
]

{ #category : #accessing }
GitQuery >> iteratorClass [
	^ iteratorClass
]

{ #category : #accessing }
GitQuery >> iteratorClass: anObject [
	iteratorClass := anObject
]

{ #category : #running }
GitQuery >> runOn: aFileReference [
	"Runs the query on the git repository located in aFileReference."
	| iterator results|
	iterator := self iteratorClass location: aFileReference.
	
	iterator initializeIteration.
	
	results := OrderedCollection new.
	[ iterator atEnd ] whileFalse: [ 
		iterator next in: [ :commit |
			(filter shouldSelect: commit)
				ifTrue:[ results add: commit ] ] ].
	
	iterator finishIteration.
	
	^ results
]

{ #category : #configuration }
GitQuery >> select: aBlock [
	"Select condition for commits."
	filter := aBlock asGQFilter
]
