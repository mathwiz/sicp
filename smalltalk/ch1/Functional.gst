Object subclass: Function [
| params useSymbols |

value [ 
    self error: 'value not implemented'
]

value: aBlock [
    ^ aBlock value: (params at:1)
]

at: pos [
    ^ params at: pos ifAbsent: [ nil ]
]

get: symbol [
    ^ useSymbols
        ifTrue:  [ (params at:1) at:symbol ifAbsent:[ nil ] ]
        ifFalse: [ nil ] 
]

Function class>>newWithParam: anObject [
    ^ self new
        setArrayParams: (Array with: anObject);
        yourself
]

Function class>>newFromDict: aDict [
    ^ self new
        setDictionaryParams: aDict;
        yourself
]

Function class>>newFromArray: anArray [
    ^ self new
        setArrayParams: anArray;
        yourself
]

Function>>setDictionaryParams: aDict [
    useSymbols := true.
    params := Dictionary new.
    params at: 1 put: aDict.
    ^ self
]

Function>>setArrayParams: anArray [
    useSymbols := false.
    params := Dictionary new.
    (1 to: anArray size) do: 
        [ :each |
            params at: each put: (anArray at: each) ].
    ^ self
]

] 


Function subclass: BiFunction [
value: aBlock [
    ^ aBlock value: (params at: 1) value: (params at: 2)
]
] 


Function subclass: TriFunction [
value: aBlock [
    ^ aBlock value: (params at: 1) value: (params at: 2) value: (params at: 3)
]
] 


BiFunction subclass: Max [
value [
    ^ (params at:1) < (params at:2)
        ifTrue: [ params at:2 ]
        ifFalse: [ params at:1 ]
]
] 


BiFunction subclass: Min [
value [
    ^ (params at:1) > (params at:2)
        ifTrue: [ params at:2 ]
        ifFalse: [ params at:1 ]
]
] 
