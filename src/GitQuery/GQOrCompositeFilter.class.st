Class {
	#name : #GQOrCompositeFilter,
	#superclass : #GQCompositeFilter,
	#category : #GitQuery
}

{ #category : #selecting }
GQOrCompositeFilter >> shouldSelect: aGQCommit [
	^ (self leftFilter shouldSelect: aGQCommit)
		or: [ self rightFilter shouldSelect: aGQCommit ]
]
