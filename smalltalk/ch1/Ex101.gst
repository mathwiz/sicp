10 printNl !
(5 + 3 + 4) printNl !
(9 - 1) printNl !
(6 / 2) printNl !
(2 * 4 + (4 - 6)) printNl !
| a b |
a := 3 .
b := (a + 1) .
(a + b + (a * b)) printNl .
(a = b) printNl .
((b > a) & (b < (a * b)) ifTrue: [b] ifFalse: [a]) printNl .
(a = 4 ifTrue: [6] ifFalse: [ b = 4 ifTrue: [6 + 7 + a] ifFalse: [25] ]) printNl .
(2 + (b > a ifTrue: [b] ifFalse: [a])) printNl .
((a > b ifTrue: [a] ifFalse: [ a < b ifTrue: [b] ifFalse: [-1] ]) * (a + 1)) printNl !
