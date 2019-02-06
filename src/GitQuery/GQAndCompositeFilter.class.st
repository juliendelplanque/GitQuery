Class {
	#name : #GQAndCompositeFilter,
	#superclass : #GQCompositeFilter,
	#category : #'GitQuery-Filters'
}

{ #category : #selecting }
GQAndCompositeFilter >> shouldSelect: aGQCommit [
	^ (self leftFilter shouldSelect: aGQCommit)
		and: [ self rightFilter shouldSelect: aGQCommit ]
]
