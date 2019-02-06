Class {
	#name : #GQCompositeFilter,
	#superclass : #GQFilter,
	#instVars : [
		'leftFilter',
		'rightFilter'
	],
	#category : #'GitQuery-Filters'
}

{ #category : #accessing }
GQCompositeFilter >> leftFilter [
	^ leftFilter
]

{ #category : #accessing }
GQCompositeFilter >> leftFilter: anObject [
	leftFilter := anObject
]

{ #category : #accessing }
GQCompositeFilter >> rightFilter [
	^ rightFilter
]

{ #category : #accessing }
GQCompositeFilter >> rightFilter: anObject [
	rightFilter := anObject
]
