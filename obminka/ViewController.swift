//
//  ViewController.swift
//  obminka
//
//  Created by Alexander Iashchuk on 6/6/16.
//  Copyright © 2016 Alexander Iashchuk. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

        var artworkRecordID = CKRecordID(recordName: UIDevice.currentDevice().identifierForVendor!.UUIDString)
        var artworkRecord = CKRecord(recordType: "Artwork", recordID: artworkRecordID)
        artworkRecordID = CKRecordID(recordName: "Rates")
        artworkRecord = CKRecord(recordType: "EUR", recordID: artworkRecordID)
        artworkRecord["user"] = "Alexander"
        artworkRecord["Title"] = "Sir"
        var myContainer = CKContainer.defaultContainer()
        var publicDatabase = myContainer.publicCloudDatabase
        var privateDatabase = myContainer.privateCloudDatabase
        
        publicDatabase.saveRecord(artworkRecord) { (artworkRecord, error) in
            if (error == nil) {
                NSLog("1publicDatabase: Successfully saved record!")
            } else {
                NSLog("1publicDatabase: ERROR!")
            }
        }
        
        privateDatabase.saveRecord(artworkRecord) { (artworkRecord, error) in
            if (error == nil) {
                NSLog("2privateDatabase: Successfully saved record!")
            } else {
                NSLog("2privateDatabase: ERROR!")
            }
        }
        
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
    
}