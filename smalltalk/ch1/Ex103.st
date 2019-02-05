'From Pharo5.0 of 16 April 2015 [Latest update: #50770] on 26 July 2018 at 4:01:54.54968 pm'!
Object subclass: #Ex103
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICP'!

!Ex103 methodsFor: 'as yet unclassified' stamp: 'Yohan 7/26/2018 15:53'!
sumOfSquaresOfX: x AndY: y AndZ: z
	"comment stating purpose of message"

	| val |
	val := x * x + (y * y) + (z * z).
	^ val! !

!Ex103 methodsFor: 'as yet unclassified' stamp: 'Yohan 7/26/2018 15:55'!
square: x
	"comment stating purpose of message"

	^ x * x! !

!Ex103 methodsFor: 'as yet unclassified' stamp: 'Yohan 7/26/2018 16:01'!
largerSquareOfX: x AndY: y AndZ: z
	"show the sum of the squares of larger 2 numbers"

	| ans |
	ans := x <= y & (x <= z)
		ifTrue: [ y * y + (z * z) ]
		ifFalse: [ y <= x & (y <= z)
				ifTrue: [ x * x + (z * z) ]
				ifFalse: [ x * x + (y * y) ] ].
	^ ans! !
