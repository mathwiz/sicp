'From Pharo5.0 of 16 April 2015 [Latest update: #50770] on 19 August 2018 at 10:38:21.883272 am'!
Object subclass: #Ex112
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICP-Chapter1'!

!Ex112 methodsFor: 'calculating' stamp: 'Yohan 8/19/2018 10:36'!
pascalRow: r element: n
	"produce the nth element of row r in Pascal's triangle"

	| endElem |
	endElem := n == 1
		ifTrue: [ true ]
		ifFalse: [ r == n ].
	^ endElem
		ifTrue: [ 1 ]
		ifFalse: [ (self pascalRow: r - 1 element: n - 1) + (self pascalRow: r - 1 element: n) ]! !
