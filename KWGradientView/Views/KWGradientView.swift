//
//  KWGradientView.swift
//  KWGradientView
//
//  Created by Pavan Kotesh on 7/1/16.
//  Copyright © 2016 KeepWorks. All rights reserved.
//

import UIKit

@IBDesignable open class KWGradientView: UIView {

  // MARK: - Enumeration
  enum GradientStyle: Int {
    case horizontal = 0
    case diagonal = 1
    case vertical = 2
  }

  // MARK: - IBInspectables
  @IBInspectable open var gradientStyle: Int = 0 {
    didSet {
      if let selectedGradientStyle = GradientStyle(rawValue: (abs(gradientStyle) % 3)) {
        currentGradientStyle = selectedGradientStyle
      }
    }
  }

  @IBInspectable open var gradientColor1: UIColor = UIColor.red {
    didSet {
      updateGradient()
    }
  }

  @IBInspectable open var gradientColor2: UIColor = UIColor.blue {
    didSet {
      updateGradient()
    }
  }

  @IBInspectable open var gradientColor3: UIColor = UIColor.green {
    didSet {
      updateGradient()
    }
  }

  // MARK: - Variables
  var currentGradientStyle: GradientStyle = .horizontal {
    didSet {
      updateGradient()
    }
  }

  // MARK: - Open Methods
  open func addGradientLayerAlongXAxis(colors: [UIColor]) -> CAGradientLayer {
    let gradient = gradientFrom(colors: colors)

    gradient.startPoint = CGPoint(x: 0.0, y: 0)
    gradient.endPoint = CGPoint(x: 1.0, y: 0.0)

    layer.sublayers?.removeAll()
    layer.addSublayer(gradient)

    return gradient
  }

  open func addGradientLayerAlongYAxis(colors: [UIColor]) -> CAGradientLayer {
    let gradient = gradientFrom(colors: colors)

    gradient.startPoint = CGPoint(x: 0.0, y: 0)
    gradient.endPoint = CGPoint(x: 0.0, y: 1.0)

    layer.sublayers?.removeAll()
    layer.addSublayer(gradient)

    return gradient
  }

  open func addDiagonalGradient(colors: [UIColor]) -> CAGradientLayer {
    let gradient = gradientFrom(colors: colors)

    gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

    layer.sublayers?.removeAll()
    layer.addSublayer(gradient)

    return gradient
  }

  open func animateGradient(_ layer: CAGradientLayer, to colors: [UIColor]) {
    UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
      CATransaction.begin()
      CATransaction.setAnimationDuration(1.0)

      layer.colors = colors.map { (color) -> CGColor in
        return color.cgColor
      }

      CATransaction.commit()
    }, completion: nil)
  }

  // MARK: - Private Methods
  private func updateGradient() {
    switch currentGradientStyle {
    case .horizontal:
      _ = addGradientLayerAlongXAxis(colors: [gradientColor1, gradientColor2, gradientColor3])
    case .diagonal:
      _ = addDiagonalGradient(colors: [gradientColor1, gradientColor2, gradientColor3])
    case .vertical:
      _ = addGradientLayerAlongYAxis(colors: [gradientColor1, gradientColor2, gradientColor3])
    }
  }

  private func gradientFrom(colors: [UIColor]) -> CAGradientLayer {
    let gradientColors = colors.map { (color) -> CGColor in
      return color.cgColor
    }

    let gradient = CAGradientLayer()
    gradient.frame = bounds
    gradient.colors = gradientColors

    return gradient
  }
}
