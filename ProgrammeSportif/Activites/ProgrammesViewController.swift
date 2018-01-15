//
//  TestTableViewController.swift
//  ProgrammeSportif
//
//  Created by if26-grp1 on 15/12/2017.
//  Copyright © 2017 MougneMarcellin. All rights reserved.
//

import UIKit

class ProgrammesViewController: UITableViewController {
    
    var programmesList : Array<Programme>!
    var connectionProgrammes : ProgrammePersistence!
    var connectionActivites : ActivitePersistence!

    override func viewDidLoad() {
        super.viewDidLoad()
        connectionProgrammes = ProgrammePersistence()
        connectionActivites = ActivitePersistence()
        programmesList = connectionProgrammes.getProgrammes()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return programmesList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "programmeListe", for: indexPath)
        cell.textLabel?.text = "\(programmesList[indexPath.row].getTitre())"
        cell.detailTextLabel?.text = "\(programmesList[indexPath.row].getType())  \(programmesList[indexPath.row].getDateCreation())"
        return cell
    }
    
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        print("You selected cell #\(indexPath.row)!")
        
        // Get Cell Label
      //  let indexPath = tableView.indexPathForSelectedRow!
      //  let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as UITableViewCell
        
        //valueToPass = currentCell.textLabel.text
       // performSegueWithIdentifier("yourSegueIdentifer", sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            programmesList.remove(at: indexPath.row)
            connectionProgrammes.deleteProgramme(id: indexPath.row)
            connectionActivites.deleteActivite(programme_id: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "programmeDetailsSegue") {
            var selectedRowIndex = self.tableView.indexPathForSelectedRow?.row
            
            let vc = segue.destination as! ProgrammeDetailsTableViewController
            vc.programme = programmesList[selectedRowIndex!]
        }
    }
 

}
