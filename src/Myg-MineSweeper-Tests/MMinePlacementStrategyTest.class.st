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
MMinePlacementStrategyTest >> testOddColumnStrategyNoMineAtEvenColumn [

	| s m |
	
	s := MColumnsOddMinePlacement new.
	
	m := s generateMinesForGridWidth: 10 height: 10  numberMines: 50.
	
	m do:[:position | self assert: position x odd. ]
	
]

{ #category : 'tests' }
MMinePlacementStrategyTest >> testRandomStrategy [

	| s m |
	
	s := MRandomMinePlacement new.
	m := s generateMinesForGridWidth: 10 height: 10 numberMines: 5.
	self assert: m size equals: 5.
]

{ #category : 'tests' }
MMinePlacementStrategyTest >> testReplayStrategy [
	| strategy mines board |
	
	mines := { 1@1 . 2@1 . 5@5 } asSet. 
	
	strategy := MReplayMinePlacement new.
	strategy minesToReplay: mines.
	
	board := MBoard width: 5 height: 5 mineCount: 3 strategy: strategy.
	
	self assert: (board boxAt: 1 at: 1) isMineBox.
	self assert: (board boxAt: 2 at: 1) isMineBox.
	self assert: (board boxAt: 5 at: 5) isMineBox.
]

{ #category : 'tests' }
MMinePlacementStrategyTest >> testReplayStrategyMineList [

	| strategy mines result |
	mines := {
		         (1 @ 1).
		         (5 @ 5).
		         (3 @ 2).
					(4 @ 2).
					(1 @ 3) } asSet.

	strategy := MReplayMinePlacement new.
	strategy minesToReplay: mines.

	result := strategy
		          generateMinesForGridWidth: 10
		          height: 10
		          numberMines: 5.

	self assert: result size equals:5
]
