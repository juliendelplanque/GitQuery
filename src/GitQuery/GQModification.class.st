Class {
	#name : #GQModification,
	#superclass : #Object,
	#instVars : [
		'filePath',
		'commitDiffWasMadeWith'
	],
	#category : #'GitQuery-Core'
}

{ #category : #'instance creation' }
GQModification class >> filePath: aString commitDiffWasMadeWith: aGQCommit [
	^ self new
		filePath: aString;
		commitDiffWasMadeWith: aGQCommit;
		yourself
]

{ #category : #accessing }
GQModification >> commitDiffWasMadeWith [
	^ commitDiffWasMadeWith
]

{ #category : #accessing }
GQModification >> commitDiffWasMadeWith: anObject [
	commitDiffWasMadeWith := anObject
]

{ #category : #accessing }
GQModification >> filePath [
	^ filePath
]

{ #category : #accessing }
GQModification >> filePath: anObject [
	filePath := anObject
]

{ #category : #printing }
GQModification >> printOn: aStream [
	self filePath printOn: aStream
]
