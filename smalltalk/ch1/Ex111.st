'From Pharo5.0 of 16 April 2015 [Latest update: #50770] on 15 August 2018 at 1:40:41.550062 pm'!
Object subclass: #Ex111
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICP-Chapter1'!

!Ex111 methodsFor: 'calculating' stamp: 'Yohan 8/15/2018 13:39'!
iterative: n
	| helper single |
	single := [ :a :b :c | a + (2 * b) + (3 * c) ].
	helper := [ :a :b :c :x | 
	x == 3
		ifTrue: [ single value: a value: b value: c ]
		ifFalse: [ helper
				value: (single value: a value: b value: c)
				value: a
				value: b
				value: x - 1 ] ].
	^ n < 3
		ifTrue: [ n ]
		ifFalse: [ helper
				value: 2
				value: 1
				value: 0
				value: n ]! !

!Ex111 methodsFor: 'calculating' stamp: 'Yohan 8/15/2018 13:04'!
recursive: n
	^ n < 3
		ifTrue: [ n ]
		ifFalse:
			[ (self recursive: n - 1) + (2 * (self recursive: n - 2)) + (3 * (self recursive: n - 3)) ]! !
