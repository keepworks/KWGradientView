//
//  KWGradientView.swift
//  KWGradientView
//
//  Created by Pavan Kotesh on 7/1/16.
//  Copyright © 2016 KeepWorks. All rights reserved.
//

import UIKit

open class KWGradientView: UIView {

  // MARK: - Open Methods
  open func addGradientLayerAlongXAxis(colors: [UIColor]) -> CAGradientLayer {
    let gradient = gradientFrom(colors: colors)

    gradient.startPoint = CGPoint(x: 0.0, y: 0)
    gradient.endPoint = CGPoint(x: 1.0, y: 0.0)

    layer.insertSublayer(gradient, at: 0)

    return gradient
  }

  open func addGradientLayerAlongYAxis(colors: [UIColor]) -> CAGradientLayer {
    let gradient = gradientFrom(colors: colors)

    gradient.startPoint = CGPoint(x: 0.0, y: 0)
    gradient.endPoint = CGPoint(x: 0.0, y: 1.0)

    layer.insertSublayer(gradient, at: 0)

    return gradient
  }

  open func addDiagonalGradient(colors: [UIColor]) -> CAGradientLayer {
    let gradient = gradientFrom(colors: colors)

    gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

    layer.addSublayer(gradient)

    return gradient
  }

  open func animateGradient(_ layer: CAGradientLayer, to colors: [UIColor]) {
    UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
      CATransaction.begin()
      CATransaction.setAnimationDuration(1.0)

      layer.colors = colors.map { (color) -> CGColor in
        return color.cgColor
      }

      CATransaction.commit()
    }, completion: nil)
  }

  // MARK: - Private Methods
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
