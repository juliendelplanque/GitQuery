Class {
	#name : #GQNullFilter,
	#superclass : #GQFilter,
	#category : #GitQuery
}

{ #category : #combining }
GQNullFilter >> and: anObject [
	^ anObject asGQFilter
]

{ #category : #combining }
GQNullFilter >> or: anObject [
	^ anObject asGQFilter
]

{ #category : #selecting }
GQNullFilter >> shouldSelect: aGQCommit [
	"Null filter, filters nothing."
	^ true
]
