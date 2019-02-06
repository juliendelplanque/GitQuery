Extension { #name : #LGitSignature }

{ #category : #'*GitQuery' }
LGitSignature >> asGQDeveloper [
	^ GQDeveloper fromLGitSignature: self
]
