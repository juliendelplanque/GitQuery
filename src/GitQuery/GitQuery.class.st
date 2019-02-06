Class {
	#name : #GitQuery,
	#superclass : #Object,
	#instVars : [
		'iteratorClass',
		'filter'
	],
	#category : #'GitQuery-Core'
}

{ #category : #'instance creation' }
GitQuery class >> latestFirst [
	^ self new
		iteratorClass: GQLatestToFirstRepositoryIterator;
		yourself
]

{ #category : #configuration }
GitQuery >> authorHasOneOfTheseNames: aCollectionOfString [
	"Only select commits authored by an author having one of the names in aCollectionOfString.
	 Makes no sense to be called multiple times."
	filter := filter and: [ :commit | aCollectionOfString includes: commit author name ]
]

{ #category : #configuration }
GitQuery >> authorNamed: aString [
	self authorHasOneOfTheseNames: { aString }
]

{ #category : #configuration }
GitQuery >> commitsSatisfying: aBlock [
	"Select condition for commits."
	filter := aBlock asGQFilter
]

{ #category : #configuration }
GitQuery >> committerHasOneOfTheseNames: aCollectionOfString [
	"Only select commits committed by a committer having one of the names in aCollectionOfString.
	 Makes no sense to be called multiple times."
	filter := filter and: [ :commit | aCollectionOfString includes: commit committer name ]
]

{ #category : #configuration }
GitQuery >> committerNamed: aString [
	self committerHasOneOfTheseNames: { aString }
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

{ #category : #configuration }
GitQuery >> modificationsConcernFilePath: aString [
	self modificationsConcernOneOfTheseFilePaths: { aString }
]

{ #category : #configuration }
GitQuery >> modificationsConcernOneOfTheseFilePaths: aCollectionOfString [
	"Only select commits having a modification concerning one of the file paths in aCollectionOfString.
	 Makes no sense to be called multiple times."
	filter := filter and: [ :commit | 
		(aCollectionOfString intersection: (commit modifications collect: #filePath)) isNotEmpty ]
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
