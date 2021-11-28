//
//  BoardItem.swift
//  Connect4Game
//
//  Created by Николай Никитин on 27.11.2021.
//

import Foundation
import UIKit

/// Just a tile enum
enum Tile{
  case Red
  case Yellow
  case Empty
}

/// Main model of board item
struct BoardItem {
  var indexPath: IndexPath!
  var tile: Tile!
  
  /// Returns ture of yellow tile
  func yellowTile() -> Bool {
    return tile == Tile.Yellow
  }
  
  /// Returns ture of red tile
  func redTile() -> Bool {
    return tile == Tile.Red
  }
  
  /// Check if its emty tile
  func emptyTile() -> Bool {
    return tile == Tile.Empty
  }
  
  /// Returns color of any tile
  func tileColor() -> UIColor{
    if redTile() {
      return .red
    }
    if yellowTile() {
      return .yellow
    }
    return .white
  }
}
