//
//  NouvelleActivite.swift
//  ProgrammeSportif
//
//  Created by if26-grp1 on 19/12/2017.
//  Copyright © 2017 MougneMarcellin. All rights reserved.
//

import UIKit

class AddActiviteTemps: UIViewController {

    @IBOutlet weak var titre: UITextField!
    @IBOutlet weak var repet: UILabel!
    @IBOutlet weak var serie: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispos e of any resources that can be recreated.
    }
    
   
    @IBAction func ajouterNouvelleActivite(_ sender: Any) {
        let ajout : ActivitePersistence
        
         ajout = ActivitePersistence()
        
        ajout.insertActivite(programme_id: 1, titre: titre.text!, typeActivite: "ActiviteRepetition", temps: nil, serie: Int(serie.text!), repetition: Int(repet.text!))
        
        let alert = UIAlertController(title:"Activité Inséré", message:nil, preferredStyle: .alert)
   /*     alert.addTextField {(tf) in tf.placeholder = "Name"}
        alert.addTextField {(tf) in tf.placeholder = "ifEmail"}*/
        let action = UIAlertAction(title:"Valider", style: .default) { (_) in
           /* guard
                let name = alert.textFields?.first?.text,
                let email = alert.textFields?.last?.text
                else {return}
            print(name)
            print (email)*/
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
                
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
