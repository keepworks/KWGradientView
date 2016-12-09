//
//  GradientsViewController.swift
//  KWGradientView
//
//  Created by Pavan Kotesh on 09/12/16.
//  Copyright © 2016 KeepWorks. All rights reserved.
//

import UIKit

class GradientsViewController: UIViewController {

  // MARK: - IBOutlets
  @IBOutlet weak var horizontalGradientView: KWGradientView!
  @IBOutlet weak var diagonalGradientView: KWGradientView!
  @IBOutlet weak var verticalGradientView: KWGradientView!

  // MARK: - Variables
  var diagonalGradientLayer: CAGradientLayer!
  var currentIndex = 0

  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()

    configureGradients()
  }

  // MARK: - IBActions
  @IBAction func updateDiagonalGradient(_ sender: Any) {
    let gradientColors = [
      [UIColor.red, UIColor.green, UIColor.blue],
      [UIColor.green, UIColor.blue, UIColor.red],
      [UIColor.blue, UIColor.red, UIColor.green]
    ]

    currentIndex += 1
    if currentIndex > 2 {
      currentIndex = 0
    }

    diagonalGradientView.updateDiagonalGradient(diagonalGradientLayer, colors: gradientColors[currentIndex])
  }

  // MARK: - Private Methods
  private func configureGradients() {
    let gradientColors = [UIColor.red, UIColor.green, UIColor.blue]
    _ = horizontalGradientView.addGradientLayerAlongXAxis(colors: gradientColors)
    diagonalGradientLayer = diagonalGradientView.addDiagonalGradient(colors: gradientColors)
    _ = verticalGradientView.addGradientLayerAlongYAxis(colors: gradientColors)
  }
}

