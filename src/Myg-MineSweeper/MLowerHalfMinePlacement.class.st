Class {
	#name : 'MLowerHalfMinePlacement',
	#superclass : 'MMinePlacementStrategy',
	#category : 'Myg-MineSweeper',
	#package : 'Myg-MineSweeper'
}

{ #category : 'as yet unclassified' }
MLowerHalfMinePlacement >> generateMinesForGridWidth: gridWidth height: gridHeight numberMines: mineCount [

	| allCoordinates lowerCoordinates half |
	half := (gridHeight / 2) floor.

	allCoordinates := (1 to: gridWidth) flatCollect: [ :x |
		                  (1 to: gridHeight) collect: [ :y | x @ y ] ].

	lowerCoordinates := allCoordinates select: [ :position |
		                    position y > half ].

	mineCount > lowerCoordinates size ifTrue: [
			^ MRandomMinePlacement new
				  generateMinesForGridWidth: gridWidth
				  height: gridHeight
				  numberMines: mineCount ].

	^ (lowerCoordinates shuffled first: mineCount) asSet
]
