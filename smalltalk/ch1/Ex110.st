'From Pharo7.0alpha of 17 July 2018 [Build information: Pharo-7.0+alpha.build.1127.sha.fdaba77638da242e77d7b1f6657b55d770d85d35 (64 Bit)] on 4 August 2018 at 1:54:50.847564 pm'!
Object subclass: #Ex110
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICP-Chapter1'!

!Ex110 methodsFor: 'calculating' stamp: 'Yohan 8/4/2018 13:39'!
ackOfX: x Y: y
	"Ackermann's function"

	y == 0 
		ifTrue: [ ^ 0 ]
		ifFalse: [ x == 0
						ifTrue: [ ^ 2 * y ]
						ifFalse: 	[ y == 1
										ifTrue: [ ^ 2 ]
										ifFalse: [ ^ self ackOfX: x - 1 Y: (self ackOfX: x Y: y - 1 ) ] ] ]! !

!Ex110 methodsFor: 'calculating' stamp: 'Yohan 8/4/2018 13:07'!
h: n
	^ self ackOfX: 2 Y: n! !

!Ex110 methodsFor: 'calculating' stamp: 'Yohan 8/4/2018 13:08'!
k: n
	^ 5 * n * n! !

!Ex110 methodsFor: 'calculating' stamp: 'Yohan 8/4/2018 13:07'!
f: n
	^ self ackOfX: 0 Y: n! !

!Ex110 methodsFor: 'calculating' stamp: 'Yohan 8/4/2018 13:07'!
g: n
	^ self ackOfX: 1 Y: n! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Ex110 class
	instanceVariableNames: ''!

!Ex110 class methodsFor: 'examples' stamp: 'Yohan 8/4/2018 13:53'!
showSampleCalcs
	"samples"

	Transcript cr; show: (Ex110  new ackOfX: 3 Y: 3).
	Transcript cr; show: (Ex110  new f: 4).
	Transcript cr; show: (Ex110  new g: 4).	
	Transcript cr; show: (Ex110  new h: 4).	
	Transcript cr; show: (Ex110  new k: 4).
	! !
