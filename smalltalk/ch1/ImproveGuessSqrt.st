'From Pharo5.0 of 16 April 2015 [Latest update: #50770] on 5 February 2019 at 12:49:05.996198 pm'!
Object subclass: #ImproveGuessSqrt
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICPUtil'!

!ImproveGuessSqrt methodsFor: 'as yet unclassified' stamp: 'Yohan 7/28/2018 13:54'!
improve: guess To: t
	"improve a single number guess"
	^ (guess + (t / guess)) / 2.0! !
