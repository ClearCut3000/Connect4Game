//
//  Board.swift
//  Connect4Game
//
//  Created by Николай Никитин on 27.11.2021.
//

import Foundation
import UIKit

var board = [[BoardItem]]()

func resetBoard(){
  board.removeAll()
  for row in 0...5 {
    var rowArray = [BoardItem]()
    for column in 0...6 {
      let indexPath = IndexPath.init(item: column, section: row)
      let boardItem = BoardItem(indexPath: indexPath, tile: Tile.Empty)
      rowArray.append(boardItem)
    }
    board.append(rowArray)
  }
}

func getBoardItem(_ indexPath: IndexPath) -> BoardItem {
  return board [indexPath.section][indexPath.item]
}

func getLowestEmptyBoardItem(_ column: Int) -> BoardItem? {
  for row in (0...5).reversed() {
    let boardItem = board[row][column]
    if boardItem.emptyTile(){
      return boardItem
    }
  }
  return nil
}

func updateBoardWithBoardItem(_ boardItem: BoardItem){
  if let indexPath = boardItem.indexPath {
    board[indexPath.section][indexPath.item] = boardItem
  }
}

func boardIsFull() -> Bool {
  for row in  board {
    for column in row {
      if column.emptyTile() {
        return false
      }
    }
  }
  return true
}

func victoryAchieved() -> Bool {
  return horizontalVictory() || verticalVictory() || diagonalVictory()
}

func diagonalVictory() -> Bool {
  for column in 0...board.count {
    if checkDiagonalColumn(column, true, true) {
      return true
    }
    if checkDiagonalColumn(column, true, false) {
      return true
    }
    if checkDiagonalColumn(column, false, true) {
      return true
    }
    if checkDiagonalColumn(column, false, false) {
      return true
    }
  }
  return false
}

func checkDiagonalColumn(_ columnToCheck: Int, _ moveUp: Bool, _ reverseRows: Bool) -> Bool {
  var movingColumn = columnToCheck
  var consecutive = 0
  if reverseRows {
    for row in  board.reversed(){
      if movingColumn < row.count && movingColumn >= 0 {
        if row[movingColumn].tile == currentTurnTile(){
          consecutive += 1
          if consecutive >= 4 {
            return true
          }
        } else {
          consecutive = 0
        }
        movingColumn = moveUp ? movingColumn + 1 : movingColumn - 1
      }
    }
  } else {
    for row in  board{
      if movingColumn < row.count && movingColumn >= 0 {
        if row[movingColumn].tile == currentTurnTile(){
          consecutive += 1
          if consecutive >= 4 {
            return true
          }
        } else {
          consecutive = 0
        }
        movingColumn = moveUp ? movingColumn + 1 : movingColumn - 1
      }
    }
  }
  return false
}

func verticalVictory() -> Bool {
  for column in 0...board.count {
    if checkVerticalColumn(column){
      return true
    }
  }
  return false
}

func checkVerticalColumn(_ columnToCheck: Int) -> Bool {
  var consecutive = 0
  for row in board {
    if row[columnToCheck].tile == currentTurnTile() {
      consecutive += 1
      if consecutive >= 4 {
        return true
      }
    } else {
      consecutive = 0
    }
  }
  return false
}

func horizontalVictory() -> Bool {
  for row in board {
    var consecutive = 0
    for column in row {
      if column.tile == currentTurnTile() {
        consecutive += 1
        if consecutive >= 4 {
          return true
        }
      } else {
        consecutive = 0
      }
    }
  }
  return false
}
