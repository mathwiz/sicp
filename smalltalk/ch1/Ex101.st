'From Pharo5.0 of 16 April 2015 [Latest update: #50770] on 25 July 2018 at 1:17:30.816728 pm'!
Object subclass: #Ex101
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SICP'!

!Ex101 methodsFor: 'as yet unclassified' stamp: 'Yohan 7/25/2018 13:15'!
doIt
	"Ex101 new doIt"

	| a b |
	Transcript
		cr;
		show: '10 = ' , 10 asString.
	Transcript
		cr;
		show: '5 + 3 + 4 = ' , (5 + 3 + 4) asString.
	Transcript
		cr;
		show: '9 - 1 = ' , (9 - 1) asString.
	Transcript
		cr;
		show: '6 / 2 = ' , (6 / 2) asString.
	Transcript
		cr;
		show: '(2 * 4) + (4 - 6) = ' , (2 * 4 + (4 - 6)) asString.
	a := 3.
	b := a + 1.
	Transcript
		cr;
		show: 'a = ' , a asString.
	Transcript
		cr;
		show: 'b = ' , b asString.
	Transcript
		cr;
		show: 'a + b + (a * b) = ' , (a + b + (a * b)) asString.
	Transcript
		cr;
		show: 'a == b = ' , (a == b) asString.
	Transcript
		cr;
		show:
			'b > a & (b < (a * b)) ifTrue: [b] ifFalse: [a] = '
				,
					(b > a & (b < (a * b))
						ifTrue: [ b ]
						ifFalse: [ a ]) asString.
	Transcript
		cr;
		show:
			'a == 4 ifTrue: [ 6 ] ifFalse: [ b == 4 ifTrue: [ 6 + 7 + a ] ifFalse: [ 25 ] ] = '
				,
					(a == 4
						ifTrue: [ 6 ]
						ifFalse: [ b == 4
								ifTrue: [ 6 + 7 + a ]
								ifFalse: [ 25 ] ]) asString.
	Transcript
		cr;
		show:
			'2 + (b > a	ifTrue: [ b ] ifFalse: [ a ]) = '
				,
					(2
						+
							(b > a
								ifTrue: [ b ]
								ifFalse: [ a ])) asString.
	Transcript
		cr;
		show:
			'(a > b ifTrue: [ a ] ifFalse: [ a < b ifTrue: [ b ] ifFalse: [ -1 ] ]) * (a + 1) = '
				,
					((a > b
						ifTrue: [ a ]
						ifFalse: [ a < b
								ifTrue: [ b ]
								ifFalse: [ -1 ] ]) * (a + 1)) asString! !
