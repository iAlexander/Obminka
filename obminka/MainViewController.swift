//
//  MainViewController.swift
//  obminka
//
//  Created by Alexander Iashchuk on 6/6/16.
//  Copyright © 2016 Alexander Iashchuk. All rights reserved.
//

import UIKit
import DigitsKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainProgressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let authButton = DGTAuthenticateButton(authenticationCompletion: { (session, error) in
            if (session != nil) {
                // TODO: associate the session userID with your user model
                let message = "Phone number: \(session!.phoneNumber)"
                let alertController = UIAlertController(title: "You are logged in!", message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: .none))
                self.present(alertController, animated: true, completion: .none)
            } else {
                NSLog("Authentication error: %@", error!.localizedDescription)
            }
        })
        authButton?.center = self.view.center
        self.view.addSubview(authButton!)

        
//        let authButton = DGTAuthenticateButton(authenticationCompletion: { (session: DGTSession?, error: NSError?) in
//            if (session != nil) {
//                // TODO: associate the session userID with your user model
//                let message = "Phone number: \(session!.phoneNumber)"
//                let alertController = UIAlertController(title: "You are logged in!", message: message, preferredStyle: .Alert)
//                alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: .None))
//                self.presentViewController(alertController, animated: true, completion: .None)
//            } else {
//                NSLog("Authentication error: %@", error!.localizedDescription)
//            }
//        })
//        authButton.center = self.view.center
//        self.view.addSubview(authButton)
    }

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
