//
//  StateListTableViewController.swift
//  Representitive
//
//  Created by Jordan Lamb on 10/2/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return States.all.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statesCell", for: indexPath)
        let states = States.all[indexPath.row]
        cell.textLabel?.text = states
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStateDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            guard let destinationVC = segue.destination as? StateDetailTableViewController else { return }
            let objectToSend = States.all[indexPath.row]
            destinationVC.state = objectToSend
        }
    }
    

}
