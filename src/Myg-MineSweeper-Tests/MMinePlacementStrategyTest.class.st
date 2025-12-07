Class {
	#name : 'MMinePlacementStrategyTest',
	#superclass : 'TestCase',
	#category : 'Myg-MineSweeper-Tests',
	#package : 'Myg-MineSweeper-Tests'
}

{ #category : 'tests' }
MMinePlacementStrategyTest >> testRandomStrategy [

	| s m |
	
	s := MRandomMinePlacement new.
	m := s generateMinesForGridWidth: 10 height: 10 numberMines: 5.
	self assert: m size equals: 5.
]
