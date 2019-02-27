'From Pharo5.0 of 16 April 2015 [Latest update: #50770] on 27 February 2019 at 6:42:42.66471 pm'!
Object subclass: #Ex114
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICP-Chapter1'!

!Ex114 methodsFor: 'as yet unclassified' stamp: 'Yohan 2/27/2019 18:07'!
biggestDenom: kinds_of_coins

kinds_of_coins == 1
	ifTrue: [ ^ 1 ]
	ifFalse: [ kinds_of_coins == 2
					ifTrue: [ ^ 5 ]
					ifFalse: [ kinds_of_coins == 3
									ifTrue: [ ^ 10 ]
									ifFalse: [ kinds_of_coins == 4
													ifTrue: [ ^ 25 ]
													ifFalse: [ kinds_of_coins == 5 
																	ifTrue: [ ^ 50 ] ] ] ] ]

! !

!Ex114 methodsFor: 'as yet unclassified' stamp: 'Yohan 2/27/2019 18:40'!
count: amount forKinds: n
	"count change for n kinds of coins"

	^ amount == 0
		ifTrue: [ 1 ]
		ifFalse: [ amount < 0
				ifTrue: [ 0 ]
				ifFalse: [ n == 0
						ifTrue: [ 0 ]
						ifFalse: [ (self count: amount forKinds: n - 1)
								+ (self count: amount - (self biggestDenom: n) forKinds: n) ] ] ]! !

!Ex114 methodsFor: 'as yet unclassified' stamp: 'Yohan 2/27/2019 18:41'!
countChange: amount
	"count the ways change can be made"

	^ self count: amount forKinds: 5! !
