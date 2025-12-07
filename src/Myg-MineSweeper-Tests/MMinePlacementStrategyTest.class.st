Class {
	#name : 'MMinePlacementStrategyTest',
	#superclass : 'TestCase',
	#category : 'Myg-MineSweeper-Tests',
	#package : 'Myg-MineSweeper-Tests'
}

{ #category : 'tests' }
MMinePlacementStrategyTest >> testLowerHalfStrategyNoMineAtTop [

	| s m width height half |
	height := 10.
	half := height / 2.

	s := MLowerHalfMinePlacement new.
	m := s generateMinesForGridWidth: 10 height: 10 numberMines: 50.
	m do: [ :position | self assert: position y > half ]
]

{ #category : 'tests' }
MMinePlacementStrategyTest >> testRandomStrategy [

	| s m |
	
	s := MRandomMinePlacement new.
	m := s generateMinesForGridWidth: 10 height: 10 numberMines: 5.
	self assert: m size equals: 5.
]
