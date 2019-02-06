Class {
	#name : #GQCommit,
	#superclass : #Object,
	#instVars : [
		'lGitCommit'
	],
	#category : #GitQuery
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
	"TODO"
	^ self shouldBeImplemented
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
	^ self shouldBeImplemented
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
