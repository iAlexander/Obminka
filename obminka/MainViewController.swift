//
//  MainViewController.swift
//  obminka
//
//  Created by Alexander Iashchuk on 6/6/16.
//  Copyright © 2016 Alexander Iashchuk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainProgressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        goToFirstView()
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    func goToFirstView() {
        performSegue(withIdentifier: "firstSegue", sender: nil)
    }
    
//    @IBAction func unwindToMainView(segue: UIStoryboardSegue) {
//    }
    
}
