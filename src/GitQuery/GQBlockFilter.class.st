Class {
	#name : #GQBlockFilter,
	#superclass : #GQFilter,
	#instVars : [
		'block'
	],
	#category : #GitQuery
}

{ #category : #accessing }
GQBlockFilter >> block [
	^ block
]

{ #category : #accessing }
GQBlockFilter >> block: anObject [
	block := anObject
]

{ #category : #selecting }
GQBlockFilter >> shouldSelect: aGQCommit [
	^ self block value: aGQCommit
]
