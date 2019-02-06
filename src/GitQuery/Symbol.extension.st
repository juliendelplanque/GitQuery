Extension { #name : #Symbol }

{ #category : #'*GitQuery' }
Symbol >> asGQFilter [
	^ GQBlockFilter new
		block: self;
		yourself
]
