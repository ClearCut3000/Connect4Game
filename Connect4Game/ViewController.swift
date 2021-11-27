//
//  ViewController.swift
//  Connect4Game
//
//  Created by Николай Никитин on 27.11.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

  //MARK: - Outlets
  @IBOutlet weak var turnImage: UIImageView!
  @IBOutlet weak var collectionView: UICollectionView!

  // MARK: - Properties
  var redScore = 0
  var yellowScore = 0

  //MARK: - ViewControlle LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    resetBoard()
    setCellWidthHeight()
  }

  // MARK: - CollectionView Methods
  func setCellWidthHeight(){
    let width = collectionView.frame.size.width / 9
    let height = collectionView.frame.size.height / 6
    let flowLayout = collectionView.collectionViewLayout as!  UICollectionViewFlowLayout
    flowLayout.itemSize = CGSize(width: width, height: height)
  }

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return board.count
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return board[section].count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "idCell", for: indexPath) as! BoardCell
    let boardItem = getBoardItem(indexPath)
    cell.image.tintColor = boardItem.tileColor()
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let column = indexPath.item
    if var boardItem = getLowestEmptyBoardItem(column){
      if let cell = collectionView.cellForItem(at: boardItem.indexPath ) as? BoardCell {
        cell.image.tintColor = currentTurnColor()
        boardItem.tile = currentTurnTile()
        updateBoardWithBoardItem(boardItem)
        if victoryAchieved(){
          if yellowTurn() {
            yellowScore += 1
          }
          if redTurn() {
            redScore += 1
          }
          resultAlert(currentTurnVictoryMessage())
        }

        if boardIsFull() {
          resultAlert("Draw")
        }
        toggleTurn(turnImage)
      }
    }
  }

  func resultAlert(_ title: String){
    let message = "\nRed: " + String(redScore) + "\n\n Yellow: " +  String(yellowScore)
    let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: {
      [self] (_) in
      resetBoard()
      self.resetCells()
    }))
    self.present(ac, animated: true)
  }

  func resetCells(){
    for cell in collectionView.visibleCells as! [BoardCell]{
      cell.image.tintColor = .white
    }
  }
}

