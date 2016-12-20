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
    
    var currentUser = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let authButton = DGTAuthenticateButton(authenticationCompletion: { (session, error) in
            if (session != nil) {
                
                // TODO: associate the session userID with your user model
                
                self.currentUser = session!.userID
                
                let message = "Phone number: \(session!.phoneNumber)"
                let alertController = UIAlertController(title: "You are logged in!", message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: .none))
                alertController.addAction(UIAlertAction(title: "Reset", style: .default, handler: { alertAction in
                    Digits.sharedInstance().logOut()
                    alertController.dismiss(animated: true, completion: nil)
                }))
                self.present(alertController, animated: true, completion: .none)
            } else {
                NSLog("Authentication error: %@", error!.localizedDescription)
            }
        })
        authButton?.digitsAppearance = self.makeTheme()
        authButton?.center = self.view.center
        self.view.addSubview(authButton!)
        
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
    
    func makeTheme() -> DGTAppearance {
        let theme = DGTAppearance();
//        theme.bodyFont = UIFont(name: "Noteworthy-Light", size: 16);
//        theme.labelFont = UIFont(name: "Noteworthy-Bold", size: 17);
//        theme.accentColor = UIColor(red: (255.0/255.0), green: (172/255.0), blue: (238/255.0), alpha: 1);
//        theme.backgroundColor = UIColor(red: (240.0/255.0), green: (255/255.0), blue: (250/255.0), alpha: 1);
        theme.accentColor = #colorLiteral(red: 0.9333333333, green: 0.9294117647, blue: 0.8666666667, alpha: 1)
        theme.backgroundColor = #colorLiteral(red: 0.3176237941, green: 0.5614936352, blue: 0.2197784483, alpha: 1)
        // TODO: set a UIImage as a logo with theme.logoImage
        return theme;
    }
    
    func goToFirstView() {
        performSegue(withIdentifier: "firstSegue", sender: nil)
    }
    
//    @IBAction func unwindToMainView(segue: UIStoryboardSegue) {
//    }
    
}
