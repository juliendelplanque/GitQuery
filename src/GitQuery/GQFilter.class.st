Class {
	#name : #GQFilter,
	#superclass : #Object,
	#category : #'GitQuery-Filters'
}

{ #category : #combining }
GQFilter >> and: anObject [
	^ GQAndCompositeFilter new
		leftFilter: self;
		rightFilter: anObject asGQFilter;
		yourself
]

{ #category : #converting }
GQFilter >> asGQFilter [
	^ self
]

{ #category : #combining }
GQFilter >> or: anObject [
	^ GQOrCompositeFilter new
		leftFilter: self;
		rightFilter: anObject asGQFilter;
		yourself
]

{ #category : #selecting }
GQFilter >> shouldSelect: aGQCommit [
	"This method returns true if a GQCommit should be selected for results set.
	 Else returns false."
	^ self subclassResponsibility
]
