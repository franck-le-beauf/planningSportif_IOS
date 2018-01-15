//
//  NouvelleActiviteTemps.swift
//  ProgrammeSportif
//
//  Created by if26-grp1 on 20/12/2017.
//  Copyright © 2017 MougneMarcellin. All rights reserved.
//

import UIKit

class AddActiviteTemps: UIViewController, UITabBarDelegate {

    @IBOutlet weak var temps: UITextField!
    @IBOutlet weak var titre: UITextField!
    
    var programmeWIP : Programme?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func creerNouvelleActivite(_ sender: UIButton) {
        if(titre.text == "" || temps.text == "" )
        {
            let alert = UIAlertController(title:"Erreur", message:"Veuillez saisir l'ensemble des champs", preferredStyle: .alert)
            let action = UIAlertAction(title:"OK", style: .default) { (_) in }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return
        }
        
        let tempsVal = Int(temps.text!)
        
        if(tempsVal == nil || tempsVal! < 0 )
        {
            let alert = UIAlertController(title:"Erreur", message:"Veuillez saisir une valeur numérique valide pour le champ temps", preferredStyle: .alert)
            let action = UIAlertAction(title:"OK", style: .default) { (_) in }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return
        }
        
        
        let newActivite : ActiviteTemps = ActiviteTemps(id: 1, programme_id: (programmeWIP?.getId())!, titre: titre.text!, temps: tempsVal!)
        
        programmeWIP?.ajouterActivite(activite: newActivite)
        /*ajout.insertActivite(programme_id: newActivite.programme_id, titre: newActivite.getTitre(), typeActivite: "ActiviteTemps", temps: newActivite.getTemps(), serie: nil, repetition: nil)*/
        
        let alert = UIAlertController(title:"Activité insérée", message:nil, preferredStyle: .alert)
        let action = UIAlertAction(title:"Valider", style: .default) { (_) in }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        temps.text = ""
        titre.text = ""
    }
    

}
