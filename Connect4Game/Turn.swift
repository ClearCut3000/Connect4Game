//
//  Turn.swift
//  Connect4Game
//
//  Created by Николай Никитин on 27.11.2021.
//

import Foundation
import UIKit

enum Turn {
  case Red
  case Yellow
}

var currentTurn = Turn.Yellow

func toggleTurn(_ turnImage: UIImageView){
  if yellowTurn(){
    currentTurn = Turn.Red
    turnImage.tintColor = .red
  } else {
    currentTurn = Turn.Yellow
    turnImage.tintColor = .yellow
  }
}

func yellowTurn() -> Bool {
  return currentTurn == Turn.Yellow
}

func redTurn() -> Bool {
  return currentTurn == Turn.Red
}

func currentTurnTile() -> Tile {
  return yellowTurn() ? Tile.Yellow : Tile.Red
}

func currentTurnColor() -> UIColor {
  return yellowTurn() ? .yellow : .red
}

func currentTurnVictoryMessage() -> String {
  return yellowTurn() ? "Yellow Wins!" : "Red Wins!"
}
