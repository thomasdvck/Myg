Class {
	#name : 'MMinePlacementStrategy',
	#superclass : 'Object',
	#category : 'Myg-MineSweeper',
	#package : 'Myg-MineSweeper'
}

{ #category : 'as yet unclassified' }
MMinePlacementStrategy >> generateMinesForGridWidth: gridWith height: gridHeight numberMines: mineCount [

	^ self subclassResponsibility 
]
