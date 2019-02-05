'From Pharo5.0 of 16 April 2015 [Latest update: #50770] on 27 July 2018 at 2:00:31.759213 pm'!
Object subclass: #Ex105
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICP'!

!Ex105 methodsFor: 'as yet unclassified' stamp: 'Yohan 7/27/2018 13:59'!
testIt
	"This will hang if calling the commented out code"

	| p |
	p := [ p value ].
	"true ifTrue: 0 ifFalse: p value"
	^ 'Read the comments'! !
