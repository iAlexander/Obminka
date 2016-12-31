//
//  MainViewController.swift
//  obminka
//
//  Created by Alexander Iashchuk on 6/6/16.
//  Copyright © 2015 Alexander Iashchuk (iAlexander), https://iashchuk.com
//
//  This application is released under the MIT license. All rights reserved.
//

import UIKit
import DigitsKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    
    var currentUser = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func didTapRegisterButton(_ sender: UIButton) {
        let config = DGTAuthenticationConfiguration(accountFields: .defaultOptionMask)!
        config.title = "ОБМІНКА"
        config.phoneNumber = "+380"
        config.appearance = self.makeTheme()
        Digits.sharedInstance().authenticate(with: self, configuration: config, completion: { (session, error) in
            if (session != nil) {
            
            self.currentUser = session!.userID
            self.registerButton.setTitle("Your id: " + self.currentUser, for: UIControlState.normal)
            
            let message = "Phone number: \(session!.phoneNumber)"
            let alertController = UIAlertController(title: "You are logged in!", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: .none))
            alertController.addAction(UIAlertAction(title: "Reset", style: .default, handler: { alertAction in
            Digits.sharedInstance().logOut()
                self.registerButton.setTitle("Register", for: UIControlState.normal)
            alertController.dismiss(animated: true, completion: nil)
            }))
            self.present(alertController, animated: true, completion: .none)
            } else {
            NSLog("Authentication error: %@", error!.localizedDescription)
            }
            })
    }
    
    func makeTheme() -> DGTAppearance {
        let theme = DGTAppearance();
        theme.logoImage = UIImage(named: "logo")
        theme.accentColor = #colorLiteral(red: 0.9333333333, green: 0.9294117647, blue: 0.8666666667, alpha: 1)
        theme.backgroundColor = #colorLiteral(red: 0.3176237941, green: 0.5614936352, blue: 0.2197784483, alpha: 1)
        return theme;
    }
    
    func goToFirstView() {
        performSegue(withIdentifier: "firstSegue", sender: nil)
    }
    
//    @IBAction func unwindToMainView(segue: UIStoryboardSegue) {
//    }
    
}
