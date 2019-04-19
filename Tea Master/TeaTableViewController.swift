//
//  TeaTableViewController.swift
//  Tea Master
//
//  Created by Luis Flores on 4/10/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import UIKit

class TeaTableViewController: UITableViewController {
    var teas = [Tea]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleTeas()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return teas.count
    }
    
    private func loadSampleTeas() {
        guard let tea1 = Tea(brand: "Whittard", name: "Tippy Assam", type: .black, isPublic: false, rating: 4.5) else {
            fatalError("Unable to initialize tea1")
        }
        
        guard let tea2 = Tea(brand: "Fortnum & Mason", name: "Jubilee", type: .black, isPublic: false, rating: 3.5) else {
            fatalError("Unable to initialize tea2")
        }
        
        guard let tea3 = Tea(brand: "Whittard", name: "Cherry Blossom", type: .green, isPublic: false, rating: 3.0) else {
            fatalError("Unable to initialize tea3")
        }
        
        teas += [tea1, tea2, tea3]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TeaTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TeaTableViewCell else {
            fatalError("The dequeued cell is not an instance of TeaTableViewCell")
        }

        let tea = teas[indexPath.row]
        cell.brandLabel.text = tea.brand
        cell.nameLabel.text = tea.name
        cell.rating.rating = tea.rating

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation
    */

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender);
        switch(segue.identifier ?? "") {
        case "ShowDetail":
            guard let teaDetailViewController = segue.destination as? TeaViewController else {
                fatalError("Unexpected destination")
            }
            
            guard let selectedTeaCell = sender as? TeaTableViewCell else {
                fatalError("Unexpected sender")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedTeaCell) else {
                fatalError("The selected cell is not being displayed by the table ")
            }
            
            let selectedTea = teas[indexPath.row]
            teaDetailViewController.tea = selectedTea
        case "AddTea":
            print("Segue to new tea view")
        default:
            fatalError("Unexpected segue identifier")
        }
    }
 

}
