Class {
	#name : #GQAndCompositeFilter,
	#superclass : #GQCompositeFilter,
	#category : #GitQuery
}

{ #category : #selecting }
GQAndCompositeFilter >> shouldSelect: aGQCommit [
	^ (self leftFilter shouldSelect: aGQCommit)
		and: [ self rightFilter shouldSelect: aGQCommit ]
]
