'From Pharo7.0alpha of 17 July 2018 [Build information: Pharo-7.0+alpha.build.1127.sha.fdaba77638da242e77d7b1f6657b55d770d85d35 (64 Bit)] on 31 July 2018 at 10:03:22.048564 pm'!
Object subclass: #Ex108
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICP-Chapter1'!

!Ex108 methodsFor: 'actions' stamp: 'Yohan 7/31/2018 16:52'!
cbrt: aNumber
	"calculate cube root"

	^ self class CbrtIter: 1.0 to: aNumber! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Ex108 class
	instanceVariableNames: ''!

!Ex108 class methodsFor: 'private' stamp: 'Yohan 7/31/2018 16:12'!
Improve: guess To: target
	"make guess go closer to target"

	^ (target / (guess * guess) + (2 * guess)) / 3.0! !

!Ex108 class methodsFor: 'private' stamp: 'Yohan 7/31/2018 22:01'!
CbrtIter: guess to: target
	| good improvement |
	good := self GoodEnough: guess to: target withFunction: [:x|x*x*x].
	improvement := self Improve: guess To: target.
	^ good
		ifTrue: [ guess ]
		ifFalse: [ self CbrtIter: improvement to: target ]
! !

!Ex108 class methodsFor: 'private' stamp: 'Yohan 7/31/2018 17:14'!
GoodEnough: x to: goal withFunction: f
	"comment stating purpose of message"

	^ ((f value:x) - goal) abs < (x / 100000.0)! !

!Ex108 class methodsFor: 'private' stamp: 'Yohan 7/31/2018 14:18'!
Cube: aNumber
	^ aNumber * aNumber * aNumber ! !
