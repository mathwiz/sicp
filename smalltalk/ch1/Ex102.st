'From Pharo5.0 of 16 April 2015 [Latest update: #50770] on 25 July 2018 at 1:51:57.137153 pm'!
Object subclass: #Ex102
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICP'!

!Ex102 methodsFor: 'as yet unclassified' stamp: 'Yohan 7/25/2018 13:42'!
makeNumber
	Transcript
		cr;
		show: (5 + 4 + (2 - (3 - (6 + (4 / 5))))) / (3 * (6 - 2) * (2 - 7))! !
