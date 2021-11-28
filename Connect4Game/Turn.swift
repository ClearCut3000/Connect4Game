//
//  Turn.swift
//  Connect4Game
//
//  Created by Николай Никитин on 27.11.2021.
//

import Foundation
import UIKit

//MARK: - Properties
enum Turn {
  case Red
  case Yellow
}

var currentTurn = Turn.Yellow

//MARK: - Methods


/// Change turn  image
func toggleTurn(_ turnImage: UIImageView){
  if yellowTurn(){
    currentTurn = Turn.Red
    turnImage.tintColor = .red
  } else {
    currentTurn = Turn.Yellow
    turnImage.tintColor = .yellow
  }
}


/// Check is current turn is yellow
func yellowTurn() -> Bool {
  return currentTurn == Turn.Yellow
}

/// Check is current turn is red
func redTurn() -> Bool {
  return currentTurn == Turn.Red
}


/// Check what king of tile (red or yellow) is current turn tile
func currentTurnTile() -> Tile {
  return yellowTurn() ? Tile.Yellow : Tile.Red
}

/// Return current turn main color
func currentTurnColor() -> UIColor {
  return yellowTurn() ? .yellow : .red
}

/// Returns message of whos victory is now
func currentTurnVictoryMessage() -> String {
  return yellowTurn() ? "Yellow Wins!" : "Red Wins!"
}
