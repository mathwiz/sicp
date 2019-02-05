'From Pharo7.0alpha of 17 July 2018 [Build information: Pharo-7.0+alpha.build.1127.sha.fdaba77638da242e77d7b1f6657b55d770d85d35 (64 Bit)] on 30 July 2018 at 8:09:49.711935 am'!
Object subclass: #Ex104
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICP'!

!Ex104 methodsFor: 'as yet unclassified' stamp: 'Yohan 7/30/2018 08:08'!
plusOfA: a absB: b
	"a + | b |"

	^ (b > 0 ifTrue: [[ :y | a + y ]] ifFalse: [[ :y | a - y ]]) value: b
! !
