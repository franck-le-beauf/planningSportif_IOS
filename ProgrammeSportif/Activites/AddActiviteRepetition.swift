//
//  NouvelleActivite.swift
//  ProgrammeSportif
//
//  Created by if26-grp1 on 19/12/2017.
//  Copyright © 2017 MougneMarcellin. All rights reserved.
//

import UIKit

class AddActiviteRepetition: UIViewController, UITabBarDelegate {

    @IBOutlet weak var serie: UITextField!
    @IBOutlet weak var repet: UITextField!
    @IBOutlet weak var titre: UITextField!
    
    
    var programmeWIP : Programme?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispos e of any resources that can be recreated.
    }
    
    
    @IBAction func ajouterNouvelleActivite(_ sender: UIButton) {

        if(serie.text == "" || repet.text == "" || titre.text == "")
        {
            let alert = UIAlertController(title:"Erreur", message:"Veuillez saisir l'ensemble des champs", preferredStyle: .alert)
            let action = UIAlertAction(title:"OK", style: .default) { (_) in }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return
        }
        
        let serieVal = Int(serie.text!)
        let repetVal = Int(repet.text!)
        
        if(serieVal == nil || repetVal == nil || serieVal! < 0 || repetVal! < 0)
        {
            let alert = UIAlertController(title:"Erreur", message:"Veuillez saisir une valeur numérique valide pour les champs répétition et série", preferredStyle: .alert)
            let action = UIAlertAction(title:"OK", style: .default) { (_) in }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return
        }
        
        let activiteBD : ActivitePersistence = ActivitePersistence()
        
        let activiteId = activiteBD.getActivitesCount()! + 1
        let newActivite : ActiviteRepetition = ActiviteRepetition(id: activiteId, programme_id: (programmeWIP?.getId())!, titre: titre.text!, repetition: repetVal!, serie: serieVal!)
        
        programmeWIP?.ajouterActivite(activite: newActivite)
        
        /*ajout.insertActivite(programme_id: 1, titre: titre.text!, typeActivite: "ActiviteRepetition", temps: nil, serie: Int(serie.text!), repetition: Int(repet.text!))*/
        
        let alert = UIAlertController(title:"Activité insérée", message:nil, preferredStyle: .alert)
        let action = UIAlertAction(title:"Valider", style: .default) { (_) in }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        titre.text = ""
        serie.text = ""
        repet.text = ""
        
    }
    
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        //This method will be called when user changes tab.
        print("repetition")
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
