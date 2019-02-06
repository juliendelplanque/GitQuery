Extension { #name : #GQCommit }

{ #category : #'*GitQuery-GTInspector-Extensions' }
GQCommit >> gtInspectorModificationsIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite fastTable
		title: 'Modifications';
		display: [ self modifications ];
		beMultiple;
		wantsAutomaticRefresh: true;
		column: 'File' evaluated: [ :value :idex | value printString ] width: 500 ;
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result]]]
]

{ #category : #'*GitQuery-GTInspector-Extensions' }
GQCommit >> gtInspectorPropertiesIn: composite [
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
