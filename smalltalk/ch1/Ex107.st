'From Pharo7.0alpha of 17 July 2018 [Build information: Pharo-7.0+alpha.build.1127.sha.fdaba77638da242e77d7b1f6657b55d770d85d35 (64 Bit)] on 29 July 2018 at 12:42:00.357588 pm'!
Ex106 subclass: #Ex107
	instanceVariableNames: 'factor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICP'!

!Ex107 methodsFor: 'actions' stamp: 'Yohan 7/29/2018 12:40'!
sqrt: num
	| average improve is_good_enough sqrt_iter |
	average := [ :a :b | (a + b) / 2.0 ].
	improve := [ :guess :t | average value: guess value: t / guess ].
	is_good_enough := [ :guess :t | (guess * guess - t) abs < (guess / factor) ].
	sqrt_iter := [ :guess :t | 
	(is_good_enough value: guess value: t)
		ifTrue: [guess]
		ifFalse: [(sqrt_iter value: (improve value: guess value: t) value: t)] ].
	^ sqrt_iter value: 1.0 value: num
! !


!Ex107 methodsFor: 'initialization-release' stamp: 'Yohan 7/29/2018 12:13'!
init: num
factor := num! !


!Ex107 methodsFor: 'as yet unclassified' stamp: 'Yohan 7/29/2018 12:29'!
sqrtAlt: num
	^ self sqrtIter: 1.0 to: num ! !
