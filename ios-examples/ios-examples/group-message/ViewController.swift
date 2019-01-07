//
//  ViewController.swift
//  ios-examples
//
//  Created by Victor Baleeiro on 07/01/19.
//  Copyright © 2019 Victor Baleeiro. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    fileprivate let cellId = "id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        //cell.textLabel?.text = "a long string to test message...a long string to test message...a long string to test messagea long string to test message...a long string to test message...a long string to test message...a long string to test message...a long string to test message...a long string to test message...a long string to test message...a long string to test message..."
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

