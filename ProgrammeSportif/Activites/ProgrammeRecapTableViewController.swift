//
//  ProgrammeRecapTableViewController.swift
//  ProgrammeSportif
//
//  Created by if26-grp1 on 11/01/2018.
//  Copyright © 2018 MougneMarcellin. All rights reserved.
//

import UIKit

class ProgrammeRecapTableViewController: UITableViewController {
    
    var programmeWIP : Programme?
    var connectionProgrammes : ProgrammePersistence!
    var connectionActivites : ActivitePersistence!

    override func viewDidLoad() {
        super.viewDidLoad()
        connectionProgrammes = ProgrammePersistence()
        connectionActivites = ActivitePersistence()

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

    @IBAction func valider(_ sender: Any) {
        
        connectionProgrammes.insertProgramme(titre: (programmeWIP?.getTitre())!, type: (programmeWIP?.getType())!)
        for activite in (programmeWIP?.getListeActivite())! {
            if(activite is ActiviteTemps){
                var activiteTemps : ActiviteTemps = activite as! ActiviteTemps
                connectionActivites.insertActivite(programme_id: activite.getProgrammeId(), titre: activite.getTitre(), typeActivite: "ActiviteTemps", temps: activiteTemps.getTemps(), serie: nil, repetition: nil)
            }
            else if(activite is ActiviteRepetition){
                var activiteRepetion : ActiviteRepetition = activite as! ActiviteRepetition
                connectionActivites.insertActivite(programme_id: activite.getProgrammeId(), titre: activite.getTitre(), typeActivite: "ActiviteRepetition", temps: nil, serie: activiteRepetion.getSerie(), repetition: activiteRepetion.getRepetition())
            }
        }
        
        let alert = UIAlertController(title:"Programme inséré", message:"\((programmeWIP?.getTitre())!) et ses \((programmeWIP?.getListeActivite().count)!) activité(s) ont été sauvegardées", preferredStyle: .alert)
        let action = UIAlertAction(title:"OK", style: .default) { (_) in
            self.performSegue(withIdentifier: "unwindToViewController1", sender: self)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (programmeWIP?.getListeActivite().count)!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "activitesTemp", for: indexPath)
        cell.textLabel?.text = "\((programmeWIP?.getListeActivite()[indexPath.row].getTitre())!)"
    
        if(programmeWIP?.getListeActivite()[indexPath.row] is ActiviteTemps){
            var activiteTemps : ActiviteTemps = programmeWIP?.getListeActivite()[indexPath.row] as! ActiviteTemps
            cell.detailTextLabel?.text = "Temps : pratiquer \(activiteTemps.getTemps()) secondes"
        }
        else if(programmeWIP?.getListeActivite()[indexPath.row] is ActiviteRepetition){
            var activiteRepetion : ActiviteRepetition = programmeWIP?.getListeActivite()[indexPath.row] as! ActiviteRepetition
            cell.detailTextLabel?.text = "Répétition : effectuer \(activiteRepetion.getSerie()) série(s) de \(activiteRepetion.getRepetition()) répétition(s)"
        }
        
        return cell
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
            // Delete the row from the data source
            
            var listActivites = programmeWIP?.getListeActivite()
            listActivites?.remove(at: indexPath.row)
            programmeWIP?.setListeActivite(listeActivite: listActivites!)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
