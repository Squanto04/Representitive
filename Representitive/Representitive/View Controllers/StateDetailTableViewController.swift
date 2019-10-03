//
//  StateDetailTableViewController.swift
//  Representitive
//
//  Created by Jordan Lamb on 10/2/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {

    var representatives: [Representative] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var state: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        self.title = state
        if let state = state {
            RepresentativeController.searchRepresentatives(forState: state) { (reps) in
                self.representatives = reps
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
        setUpAlertController()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "repCell", for: indexPath) as? DetailTableViewCell
            else { return UITableViewCell() }
        cell.representative = representatives[indexPath.row]
        
        return cell
    }
    
    
    // MARK: - Alert Controller
    
    func setUpAlertController() {
        let alert = UIAlertController(title: "Name", message: "Party\n District\n Website\n Phone", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}
