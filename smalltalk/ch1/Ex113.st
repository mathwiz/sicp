'From Pharo5.0 of 16 April 2015 [Latest update: #50770] on 5 February 2019 at 11:58:13.654684 am'!
Object subclass: #Ex113
	instanceVariableNames: 'n'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICP-Chapter1'!

!Ex113 methodsFor: 'as yet unclassified' stamp: 'Yohan 2/5/2019 11:46'!
setN: anInteger
	"the Nth Fibonacci number"

	n := anInteger. 
	^ self! !

!Ex113 methodsFor: 'as yet unclassified' stamp: 'Yohan 2/5/2019 11:56'!
eval
	"calculate the value"

	| retval psi phi sqrt5 |
	sqrt5 := 5 sqrt.
	psi := ((1 + sqrt5) / 2) raisedTo: n.
	phi := ((1 - sqrt5) / 2) raisedTo: n.
	retval := (psi - phi) / sqrt5.
	^ retval rounded! !
