Class {
	#name : 'MRandomMinePlacement',
	#superclass : 'MMinePlacementStrategy',
	#category : 'Myg-MineSweeper',
	#package : 'Myg-MineSweeper'
}

{ #category : 'as yet unclassified' }
MRandomMinePlacement >> generateMinesForGridWidth: gridWidth height: gridHeight numberMines: mineCount [
	
	| allCoordinates |
	
	allCoordinates := (1 to: gridWidth) flatCollect: [ :x |
		(1 to: gridHeight) collect: [ :y | x @ y ] ].
	^ (allCoordinates shuffled first: mineCount) asSet 
]
