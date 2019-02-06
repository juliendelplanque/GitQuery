Class {
	#name : #GQOrCompositeFilter,
	#superclass : #GQCompositeFilter,
	#category : #'GitQuery-Filters'
}

{ #category : #selecting }
GQOrCompositeFilter >> shouldSelect: aGQCommit [
	^ (self leftFilter shouldSelect: aGQCommit)
		or: [ self rightFilter shouldSelect: aGQCommit ]
]
