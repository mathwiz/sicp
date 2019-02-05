'From Pharo5.0 of 16 April 2015 [Latest update: #50770] on 5 February 2019 at 12:46:48.808548 pm'!
Object subclass: #QuickSort
	instanceVariableNames: 'list'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICPUtil'!

!QuickSort methodsFor: 'as yet unclassified' stamp: 'Yohan 7/28/2018 16:23'!
elems
	^list! !

!QuickSort methodsFor: 'as yet unclassified' stamp: 'Yohan 7/28/2018 16:27'!
sort
	"found at https://medium.com/concerning-pharo/lambda-calculus-in-pharo-a4a571869594"

	| quicksort sorted |
	quicksort := nil.
	quicksort := [ :data | 
	data size <= 1
		ifTrue: [ data ]
		ifFalse: [ | pivot rest left right |
			pivot := data first.
			rest := data allButFirst.
			left := rest select: [ :each | each <= pivot ].
			right := rest select: [ :each | each > pivot ].
			(quicksort value: left) , {pivot} , (quicksort value: right) ] ].
	sorted := quicksort value: list.
	^ sorted! !

!QuickSort methodsFor: 'as yet unclassified' stamp: 'Yohan 7/28/2018 16:25'!
elems: xs
	list := xs! !
