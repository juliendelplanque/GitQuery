Extension { #name : #BlockClosure }

{ #category : #'*GitQuery' }
BlockClosure >> asGQFilter [
	^ GQBlockFilter new
		block: self;
		yourself
]
