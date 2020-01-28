Object subclass: Ex114 [

biggestDenom: kinds_of_coins [
kinds_of_coins == 1
ifTrue: [ ^ 1 ]
ifFalse: [ kinds_of_coins == 2
	ifTrue: [ ^ 5 ]
	ifFalse: [ kinds_of_coins == 3
		ifTrue: [ ^ 10 ]
		ifFalse: [ kinds_of_coins == 4
			ifTrue: [ ^ 25 ]
			ifFalse: [ kinds_of_coins == 5 
				ifTrue: [ ^ 50 ] ] ] ] ] ]

count: amount forKinds: n [
	"count change for n kinds of coins"
	^ amount == 0
		ifTrue: [ 1 ]
		ifFalse: [ amount < 0
			ifTrue: [ 0 ]
			ifFalse: [ n == 0
				ifTrue: [ 0 ]
				ifFalse: [ (self count: amount forKinds: n - 1)
                                           + (self count: amount - (self biggestDenom: n) 
                                                   forKinds: n) ] ] ] ]

countChange: amount [
	"count the ways change can be made"
	^ self count: amount forKinds: 5 ] ]

| test |

test := Ex114 new.

(test countChange: 1 ) printNl.
(test countChange: 2 ) printNl.
(test countChange: 11 ) printNl.
(test countChange: 100 ) printNl.
