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
        var artworkRecordID = CKRecordID(recordName: "110")
        var artworkRecord = CKRecord(recordType: "Artwork", recordID: artworkRecordID)
        artworkRecord["title" ] = "MacKerricher State Park"
        artworkRecord["artist"] = "Mei Chen"
        artworkRecord["address"] = "Fort Bragg, CA"
        
//        CKContainer *myContainer = [CKContainer defaultContainer];
        var myContainer = CKContainer.defaultContainer()
        
//        CKDatabase *publicDatabase = [myContainer publicCloudDatabase];
        var publicDatabase = myContainer.publicCloudDatabase
        
//        CKDatabase *privateDatabase = [myContainer privateCloudDatabase];
        var privateDatabase = myContainer.privateCloudDatabase
        
        
//        [publicDatabase saveRecord:artworkRecord completionHandler:^(CKRecord *artworkRecord, NSError *error){
//            if (!error) {
//            // Insert successfully saved record code
//            }
//            else {
//            // Insert error handling
//            }
//            }];
        publicDatabase.saveRecord(artworkRecord) { (artworkRecord, error) in
            if (error == nil) {
                print("Successfully saved record!")
            } else {
                print("ERROR!")
            }
        }
        
        privateDatabase.saveRecord(artworkRecord) { (artworkRecord, error) in
            if (error == nil) {
                print("Successfully saved record!")
            } else {
                print("ERROR!")
            }
        }
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
    
}