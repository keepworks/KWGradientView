//
//  KWGradientView.swift
//  KWGradientView
//
//  Created by Pavan Kotesh on 7/1/16.
//  Copyright © 2016 KeepWorks. All rights reserved.
//

import UIKit

open class KWGradientView: UIView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		
		// The Main Stuff
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		// You don't need to implement this
	}

  // MARK: - Open Methods
	open func addGradientLayerAlongXAxis(colors: [UIColor]) -> CAGradientLayer {
		let gradientColors = colors.map { (color) -> CGColor in
			return color.cgColor
		}

		let gradient = CAGradientLayer()
		gradient.frame = bounds
		gradient.colors = gradientColors
		
		gradient.startPoint = CGPoint(x: 0.0, y: 0)
		gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
		
		layer.insertSublayer(gradient, at: 0)
		
		return gradient
	}

  open func addGradientLayerAlongYAxis(colors: [UIColor]) -> CAGradientLayer {
		let gradientColors = colors.map { (color) -> CGColor in
			return color.cgColor
		}

    let gradient = CAGradientLayer()
    gradient.frame = bounds
    gradient.colors = gradientColors

    gradient.startPoint = CGPoint(x: 0.0, y: 0)
    gradient.endPoint = CGPoint(x: 0.0, y: 1.0)

    layer.insertSublayer(gradient, at: 0)
    
    return gradient
  }

  open func addDiagonalGradient(colors: [UIColor]) -> CAGradientLayer {
		let gradientColors = colors.map { (color) -> CGColor in
			return color.cgColor
		}
		
    let gradient = CAGradientLayer()
    gradient.frame = bounds
    gradient.colors = gradientColors

    gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

    layer.addSublayer(gradient)
    
    return gradient
  }
	
  open func updateDiagonalGradient(_ layer: CAGradientLayer, colors: [UIColor]) {
		let gradientColors = colors.map { (color) -> CGColor in
			return color.cgColor
		}

    UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
      CATransaction.begin()
      CATransaction.setAnimationDuration(1.0)
      
      layer.colors = gradientColors
      
      CATransaction.commit()
    }, completion: nil)
  }
}
