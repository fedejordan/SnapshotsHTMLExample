//
//  ItemsViewController.swift
//  SnapshotsHTMLExample
//
//  Created by OLX - Federico on 22/10/2018.
//  Copyright © 2018 Federico Jordan. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private var items: [String] = ["🍏 Green Apple", "🍎 Red Apple", "🍐 Pear", "🍊 Tangerine", "🍋 Lemon", "🍌 Banana", "🍉 Watermelon", "🍇 Grapes", "🍓 Strawberry", "🍈 Melon", "🍑 Peach", "🍍 Pineapple", "🥥 Coconut", "🥝 Kiwi Fruit"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK:- Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let itemDetailViewController = segue.destination as? ItemDetailViewController,
            let item = sender as? String {
           itemDetailViewController.item = item
        }
    }
}

// MARK:- UITableViewDataSource
extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell") as? ItemTableViewCell else {
            return UITableViewCell()
        }
        
        cell.label.text = items[indexPath.row]
        
        return cell
    }

}

// MARK:- UITableViewDelegate
extension ItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        performSegue(withIdentifier: "ItemDetailSegue", sender: item)
    }
}

