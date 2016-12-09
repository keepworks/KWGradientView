//
//  ViewController.swift
//  KWGradientView
//
//  Created by Pavan Kotesh on 09/12/16.
//  Copyright © 2016 KeepWorks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var gradientView: KWGradientView!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		_ = gradientView.addDiagonalGradient(colors: [UIColor.red, UIColor.gray, UIColor.green])
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

