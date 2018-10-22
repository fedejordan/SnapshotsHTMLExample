//
//  ItemDetailViewController.swift
//  SnapshotsHTMLExample
//
//  Created by OLX - Federico on 22/10/2018.
//  Copyright © 2018 Federico Jordan. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!
    var item: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "You've selected \(item)!"
    }
    

    // MARK:- Actions
    @IBAction private func didSelectDone(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
