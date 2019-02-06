Extension { #name : #GQCommit }

{ #category : #'*GitQuery-GTInspector-Extensions' }
GQCommit >> gtInspectorIntegerIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite table
		title: 'Properties';
		display: [ | associations |
			associations :=	{
					'sha' -> self sha.
					'author' -> self author.
					'authored date' -> self authoredDateAndTime.
					'committer' -> self committer.
					'committed date' -> self committedDateAndTime.
					'message' -> self message }.
			associations ];
		column: 'Property' evaluated: #key;
		column: 'Value' evaluated: [ :each | each value printString ];
		send: #value
]
