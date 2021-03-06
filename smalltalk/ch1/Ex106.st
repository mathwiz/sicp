'From Pharo5.0 of 16 April 2015 [Latest update: #50770] on 28 July 2018 at 5:04:51.717387 pm'!
Object subclass: #Ex106
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICP'!

!Ex106 methodsFor: 'as yet unclassified' stamp: 'Yohan 7/28/2018 17:02'!
sqrt: x
	| average improve is_good_enough sqrt_iter |
	average := [ :a :b | (a + b) / 2.0 ].
	improve := [ :guess :t | average value: guess value: t / guess ].
	is_good_enough := [ :guess :t | (guess * guess - t) abs < 0.001 ].
	sqrt_iter := [ :guess :t | 
	(is_good_enough value: guess value: t)
		ifTrue: [guess]
		ifFalse: [(sqrt_iter value: (improve value: guess value: t) value: t)] ].
	^ sqrt_iter value: 1.0 value: x! !

!Ex106 methodsFor: 'as yet unclassified' stamp: 'Yohan 7/28/2018 17:00'!
sqrtIter: guess to: t
	"comment stating purpose of message"

	| iter good improvement |
	iter := nil.
	iter := [ :nextGuess | 
	good := (GoodEnough new init: t) check: nextGuess withFunction: [ :x | x * x ].
	improvement := ImproveGuessSqrt new improve: nextGuess To: t.
	good
		ifTrue: [ nextGuess ]
		ifFalse: [ iter value: improvement ] ].
	^ iter value: guess! !

!Ex106 methodsFor: 'as yet unclassified' stamp: 'Yohan 7/28/2018 17:04'!
sqrtAlt: x
	^ self sqrtIter: 1.0 to: x ! !
