"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them.

Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : 'MineSweeper',
	#superclass : 'Object',
	#category : 'Myg-MineSweeper-Model',
	#package : 'Myg-MineSweeper',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
MineSweeper class >> menuBar [

	| bar |
	bar := ToMenuBar new
		       hMatchParent;
		       vFitContent.
	bar
		background: Color veryVeryLightGray;
		border: (BlBorder paint: Color veryDarkGray).
	^ bar
]

{ #category : 'as yet unclassified' }
MineSweeper class >> menuHelp [

	| menu |
	menu := ToMenu new.
	menu labelText: 'Help'.
	menu iconImage: (Smalltalk ui icons iconNamed: #glamorousHelp).
	menu clickAction: [
		| container lab space |
		lab := ToLabel text: 'How to play:
		 
The Minesweeper is a famous game where you need to clear a field without touching any bomb.

- You can click on a cell to uncover it and reveal the number of bombs around this cell.
- Right-click on a cell to flag it and avoid clicking on it, right-click again to unflag.
- When you flagged as many neighbouring cells as bombs around a cell, you can click on this cell to uncover all unflagged neighbouring cells.
			
The game ends when you have cleared all safe cells.
			
Have fun !'.
		lab beMultiLine.
		lab hMatchParent.
		container := BlElement new
			             background: Color lightBlue;
			             padding: (BlInsets all: 15);
			             layout: BlLinearLayout vertical;
			             constraintsDo: [ :c |
				             c horizontal fitContent.
				             c vertical fitContent ].
		container addChild: lab.
		space := BlSpace new.
		space root
			layout: BlFrameLayout new;
			addChild: container;
			constraintsDo: [ :c |
				c horizontal fitContent.
				c vertical fitContent ].
		space pulse.
		space extent: container extent.
		space show ].
	^ menu
]

{ #category : 'as yet unclassified' }
MineSweeper class >> menuPlay [

	| menu |
	menu := ToMenu new.
	menu labelText: 'Play'.
	menu iconImage: (Smalltalk ui icons iconNamed: #solidMenu).

	"--- Preset 1 : Small (5x5) ---"
	menu addItem: (ToMenuItem new
			 labelText: 'Small (5x5)';
			 clickAction: [
					 MBoardElement
						 openWidth: 5
						 height: 5
						 mines: 5
						 magnifier: 2 "Gros zoom (x2)" ];
			 yourself).

	"--- Preset 2 : Medium (10x10) ---"
	menu addItem: (ToMenuItem new
			 labelText: 'Medium (10x10)';
			 clickAction: [
					 MBoardElement
						 openWidth: 10
						 height: 10
						 mines: 20
						 magnifier: 1 "Zoom normal (x1)" ];
			 yourself).

	"--- Preset 3 : Large (20x20) ---"
	menu addItem: (ToMenuItem new
			 labelText: 'Large (20x20)';
			 clickAction: [
					 MBoardElement
						 openWidth: 20
						 height: 20
						 mines: 60
						 magnifier: 0.5 "Dézoomé (x0.5) pour afficher la grande grille" ];
			 yourself).
			
	menu addItem: (ToMenuItem new
		labelText: 'Replay last Game';
		iconImage: (Smalltalk ui icons iconNamed: #smallRedo);
		clickAction: [ self playSameBoard ];
		yourself).
	^ menu
]

{ #category : 'instance creation' }
MineSweeper class >> open [

	<script>
	| space playMenu helpMenu bar title |
	playMenu := self menuPlay.
	helpMenu := self menuHelp.
	bar := self menuBar.
	title := self title.

	bar addItem: playMenu.
	bar addItem: helpMenu.
	space := BlSpace new.


	space root addChild: title.
	space root addChild: bar.
	space extent: 300 @ 300.
	space show
]

{ #category : 'as yet unclassified' }
MineSweeper class >> playSameBoard [

	| strategy board |
	MBoard lastMines ifNil: [
			self inform: 'impossible de rejouer : aucune dernière partie'.
			^ self ].
		
	strategy := MReplayMinePlacement new.
	strategy minesToReplay: MBoard lastMines.
	
	board := MBoard 
		width: MBoard lastWidth 
		height: MBoard lastHeight 
		mineCount: MBoard lastCount 
		strategy: strategy .
		
	MBoardElement 
		openWithModel: board 
		withMagnifier: 2
		
	
]

{ #category : 'accessing' }
MineSweeper class >> title [ 
	|title|
	title := BlElement new background: Color lightBlue.
	title constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	title layout: BlFrameLayout new.
	title addChild: ((BlTextElement new text:
			  (('Minesweeper' asRopedText fontName: 'Phosphate') fontSize: 50))
			 constraintsDo: [ :c |
				 c frame horizontal alignCenter.
				 c frame vertical alignCenter ]).
	^ title 
]

{ #category : 'see class side' }
MineSweeper >> seeClassSide [ 
]
