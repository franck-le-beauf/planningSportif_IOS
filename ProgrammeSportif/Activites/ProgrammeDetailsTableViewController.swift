//
//  ProgrammeDetailsTableViewController.swift
//  ProgrammeSportif
//
//  Created by if26-grp1 on 11/01/2018.
//  Copyright © 2018 MougneMarcellin. All rights reserved.
//

import UIKit

class ProgrammeDetailsTableViewController: UITableViewController {
    
    var programme : Programme?
    var activites : [Activite]!
    var activitepPersistence : ActivitePersistence!
    
    var i : Int = 0
    
    var tableauActions : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = (programme?.getTitre())!
        activitepPersistence = ActivitePersistence()
        activites = activitepPersistence.getActivites(programme_id: (programme?.getId())!)
        breakdownActivites()
        
        print(tableauActions)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return activites.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgrammeDetailsTable", for: indexPath)
        cell.textLabel?.text = "\(tableauActions[i])"
        i = i + 1
        return cell
    }
    

    
    
    func breakdownActivites (){
        for activite in activites {
            if(activite is ActiviteTemps){
  
                var activiteTemps : ActiviteTemps = activite as! ActiviteTemps
                var temp = "Pendant \(activiteTemps.getTemps()) secondes"
                tableauActions.append(temp)
            }
            else if(activite is ActiviteRepetition){
                var activiteRepetion : ActiviteRepetition = activite as! ActiviteRepetition
                tableauActions.append("Faire \(activiteRepetion.getSerie()) séries de \(activiteRepetion.getRepetition()) répétitions")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(activites[section].getTitre())"
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
