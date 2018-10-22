//
//  SnapshotsHTMLExampleTests.swift
//  SnapshotsHTMLExampleTests
//
//  Created by OLX - Federico on 22/10/2018.
//  Copyright © 2018 Federico Jordan. All rights reserved.
//

@testable import SnapshotsHTMLExample
import XCTest
import FBSnapshotTestCase

class SnapshotsHTMLExampleTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        UIApplication.shared.keyWindow?.rootViewController = UIViewController()
        UIView.setAnimationsEnabled(false)
        agnosticOptions = FBSnapshotTestCaseAgnosticOption.screenSize
        recordMode = false
    }
    
    func testItemsSnapshot() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let itemsViewController = storyboard.instantiateViewController(withIdentifier: "ItemsViewController")
        FBSnapshotVerifyView(itemsViewController.view)
    }
    
    func testItemDetailSnapshot() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let itemDetailViewController = storyboard.instantiateViewController(withIdentifier: "ItemDetailViewController") as! ItemDetailViewController
        itemDetailViewController.item = "🍏 Green Apple"
        FBSnapshotVerifyView(itemDetailViewController.view)
    }
}
