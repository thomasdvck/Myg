Class {
	#name : 'MColumnsOddMinePlacement',
	#superclass : 'MMinePlacementStrategy',
	#category : 'Myg-MineSweeper',
	#package : 'Myg-MineSweeper'
}

{ #category : 'as yet unclassified' }
MColumnsOddMinePlacement >> generateMinesForGridWidth: gridWidth height: gridHeight numberMines: mineCount [

	| allCoordinates oddCoordinates |
	allCoordinates := (1 to: gridWidth) flatCollect: [ :x |
		                  (1 to: gridHeight) collect: [ :y | x @ y ] ].

	oddCoordinates := allCoordinates select: [ :position |
		                  position x odd ].

	mineCount > oddCoordinates size ifTrue: [
			^ MRandomMinePlacement new
				  generateMinesForGridWidth: gridWidth
				  height: gridHeight
				  numberMines: mineCount ].
			
	^ (oddCoordinates shuffled first: mineCount) asSet
]
