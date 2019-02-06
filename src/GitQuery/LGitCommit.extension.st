Extension { #name : #LGitCommit }

{ #category : #'*GitQuery' }
LGitCommit >> asGQCommit [
	^ GQCommit fromLGitCommit: self
]
