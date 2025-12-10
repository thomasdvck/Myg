Class {
	#name : 'MReplayMinePlacement',
	#superclass : 'MMinePlacementStrategy',
	#instVars : [
		'minesToReplay'
	],
	#category : 'Myg-MineSweeper',
	#package : 'Myg-MineSweeper'
}

{ #category : 'as yet unclassified' }
MReplayMinePlacement >> generateMinesForGridWidth: gridWidth height: gridHeight numberMines: mineCount [
	
	^ minesToReplay
]

{ #category : 'accessing' }
MReplayMinePlacement >> isSave [ 
	^ false
]

{ #category : 'accessing' }
MReplayMinePlacement >> minesToReplay: aCollection [
	minesToReplay := aCollection
	

]
