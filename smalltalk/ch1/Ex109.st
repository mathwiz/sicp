'From Pharo7.0alpha of 17 July 2018 [Build information: Pharo-7.0+alpha.build.1127.sha.fdaba77638da242e77d7b1f6657b55d770d85d35 (64 Bit)] on 3 August 2018 at 11:20:43.606564 am'!
Object subclass: #Ex109
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICP-Chapter1'!

!Ex109 methodsFor: 'calculating' stamp: 'Yohan 8/3/2018 11:14'!
plusR: a and: b
	"recursive plus"
	^ a==0 ifTrue: [ b ] ifFalse: [ self inc: (self plusR: (self dec: a) and: b) ]! !

!Ex109 methodsFor: 'calculating' stamp: 'Yohan 8/3/2018 11:18'!
plusIt: a and: b
	"iterative plus"
	^ a==0 ifTrue: [ b ] ifFalse: [ self plusIt: (self dec: a) and: (self inc: b) ]! !

!Ex109 methodsFor: 'calculating' stamp: 'Yohan 8/3/2018 11:07'!
inc: x
	^ x + 1! !

!Ex109 methodsFor: 'calculating' stamp: 'Yohan 8/3/2018 11:08'!
dec: x
	^ x - 1! !
