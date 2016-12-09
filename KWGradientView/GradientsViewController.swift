//
//  GradientsViewController.swift
//  KWGradientView
//
//  Created by Pavan Kotesh on 09/12/16.
//  Copyright © 2016 KeepWorks. All rights reserved.
//

import UIKit

class GradientsViewController: UIViewController {

  // MARK: - Constants
  let gradientColors = [
    [UIColor.red, UIColor.green, UIColor.blue],
    [UIColor.green, UIColor.blue, UIColor.red],
    [UIColor.blue, UIColor.red, UIColor.green]
  ]
  
  // MARK: - IBOutlets
  @IBOutlet weak var horizontalGradientView: KWGradientView!
  @IBOutlet weak var diagonalGradientView: KWGradientView!
  @IBOutlet weak var verticalGradientView: KWGradientView!

  // MARK: - Variables
  var horizontalGradientLayer: CAGradientLayer!
  var diagonalGradientLayer: CAGradientLayer!
  var verticalGradientLayer: CAGradientLayer!
  var horizontalIndex = 0
  var diagonalIndex = 0
  var verticalIndex = 0
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()

    configureGradients()
  }

  // MARK: - IBActions
  @IBAction func updateHorizontalGradient(_ sender: Any) {
    horizontalIndex += 1
    if horizontalIndex > 2 {
      horizontalIndex = 0
    }
    
    horizontalGradientView.animateGradient(horizontalGradientLayer, to: gradientColors[horizontalIndex])
  }

  @IBAction func updateDiagonalGradient(_ sender: Any) {
    diagonalIndex += 1
    if diagonalIndex > 2 {
      diagonalIndex = 0
    }

    diagonalGradientView.animateGradient(diagonalGradientLayer, to: gradientColors[diagonalIndex])
  }

  @IBAction func updateVerticalGradient(_ sender: Any) {
    verticalIndex += 1
    if verticalIndex > 2 {
      verticalIndex = 0
    }
    
    verticalGradientView.animateGradient(verticalGradientLayer, to: gradientColors[verticalIndex])
  }

  // MARK: - Private Methods
  private func configureGradients() {
    let gradientColors = [UIColor.red, UIColor.green, UIColor.blue]
    horizontalGradientLayer = horizontalGradientView.addGradientLayerAlongXAxis(colors: gradientColors)
    diagonalGradientLayer = diagonalGradientView.addDiagonalGradient(colors: gradientColors)
    verticalGradientLayer = verticalGradientView.addGradientLayerAlongYAxis(colors: gradientColors)
  }
}

