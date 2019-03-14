'From Pharo5.0 of 16 April 2015 [Latest update: #50770] on 14 March 2019 at 10:47:52.663747 am'!
Object subclass: #Ex116
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICP-Chapter1'!

!Ex116 methodsFor: 'as yet unclassified' stamp: 'Yohan 3/14/2019 10:45'!
raise: aBase to: anExponent
	"do exponentiation in logarithmic time using squaring"

	| isEven iter |
	isEven := [ :x | (x rem: 2) = 0 ].
	iter := [ :b :p :a | 
	p = 0
		ifTrue: [ a ]
		ifFalse: [ (isEven value: p)
				ifTrue: [ iter value: b * b value: p / 2 value: a ]
				ifFalse: [ iter value: b value: (p - 1) value: (a*b) ] ] ].
	^ iter value: aBase value: anExponent value: 1! !
