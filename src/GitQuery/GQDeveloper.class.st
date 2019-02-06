Class {
	#name : #GQDeveloper,
	#superclass : #Object,
	#instVars : [
		'name',
		'email'
	],
	#category : #'GitQuery-Core'
}

{ #category : #'instance creation' }
GQDeveloper class >> fromLGitSignature: aLGitSignature [
	^ self name: aLGitSignature name email: aLGitSignature email
]

{ #category : #'instance creation' }
GQDeveloper class >> name: aString email: anotherString [
	^ self new
		name: aString;
		email: anotherString;
		yourself
]

{ #category : #accessing }
GQDeveloper >> email [
	^ email
]

{ #category : #accessing }
GQDeveloper >> email: anObject [
	email := anObject
]

{ #category : #accessing }
GQDeveloper >> name [
	^ name
]

{ #category : #accessing }
GQDeveloper >> name: anObject [
	name := anObject
]

{ #category : #printing }
GQDeveloper >> printOn: aStream [
	self name printOn: aStream.
	aStream
		nextPutAll: ' : '.
	self email printOn: aStream
]
