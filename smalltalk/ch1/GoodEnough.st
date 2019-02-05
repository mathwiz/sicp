'From Pharo5.0 of 16 April 2015 [Latest update: #50770] on 5 February 2019 at 12:48:58.352198 pm'!
Object subclass: #GoodEnough
	instanceVariableNames: 'goal tolerance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICPUtil'!

!GoodEnough methodsFor: 'as yet unclassified' stamp: 'Yohan 7/28/2018 15:17'!
check: x withFunction: f
	^ ((f value:x) - goal) abs < tolerance! !

!GoodEnough methodsFor: 'as yet unclassified' stamp: 'Yohan 7/28/2018 14:17'!
goal
	"comment stating purpose of message"

	| temporary variable names |
	^goal! !

!GoodEnough methodsFor: 'as yet unclassified' stamp: 'Yohan 7/28/2018 14:17'!
tolerance
^ tolerance ! !

!GoodEnough methodsFor: 'as yet unclassified' stamp: 'Yohan 7/28/2018 14:49'!
init: x
	"comment stating purpose of message"

	goal := x.
	tolerance := 0.001! !
