//
//  SegmentedTableViewController.swift
//  MyApp2
//
//  Created by 보경 on 2023/08/10.
//

import UIKit

class SegmentedTableViewController: UITableViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var firstData: [String] = ["Apple", "Banana", "Cherry"]
    var secondData: [String] = ["Dog", "Elephant", "Fox"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add segmented control to navigation bar
        self.navigationItem.titleView = segmentedControl
        
        // Add target to segmented control
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }

    @objc func segmentChanged() {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return segmentedControl.selectedSegmentIndex == 0 ? firstData.count : secondData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let data = segmentedControl.selectedSegmentIndex == 0 ? firstData : secondData
        cell.textLabel?.text = data[indexPath.row]

        return cell
    }
}

