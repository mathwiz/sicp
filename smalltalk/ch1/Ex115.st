'From Pharo5.0 of 16 April 2015 [Latest update: #50770] on 12 March 2019 at 1:32:33.952076 pm'!
Object subclass: #Ex115
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICP-Chapter1'!

!Ex115 methodsFor: 'as yet unclassified' stamp: 'Yohan 3/12/2019 13:27'!
cube: x
	^ x * x * x! !

!Ex115 methodsFor: 'as yet unclassified' stamp: 'Yohan 3/12/2019 13:31'!
sine: angle
	"approximate sine function"

	^ angle abs < 0.01
		ifTrue: [ angle ]
		ifFalse: [ self p: (self sine: (angle / 3.0)) ]! !

!Ex115 methodsFor: 'as yet unclassified' stamp: 'Yohan 3/12/2019 13:30'!
p: x
	"helpter"

	^ 3 * x - (4 * (self cube: x))! !
