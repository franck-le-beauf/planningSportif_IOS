//
//  SelectionTypeProgrammeViewController.swift
//  ProgrammeSportif
//
//  Created by if26-grp1 on 09/01/2018.
//  Copyright © 2018 MougneMarcellin. All rights reserved.
//

import UIKit

class CreerProgrammeViewController: UIViewController {

    @IBAction func selectVolley(_ sender: UIButton) {
        selected(button: sender)

    }
    @IBAction func selectFoot(_ sender: UIButton) {
        selected(button: sender)

    }
    @IBAction func selectNatation(_ sender: UIButton) {
        selected(button: sender)

    }
    @IBAction func selectEquitation(_ sender: UIButton) {
        selected(button: sender)

    }
    @IBAction func selectCourse(_ sender: UIButton) {
        selected(button: sender)

    }
    @IBAction func selectMusculation(_ sender: UIButton) {
        selected(button: sender)

    }
    @IBAction func selectCyclisme(_ sender: UIButton) {
        selected(button: sender)

    }
    @IBAction func selectBasket(_ sender: UIButton) {
        selected(button: sender)

    }
    @IBOutlet weak var btnVolley: UIButton!
    @IBOutlet weak var btnFoot: UIButton!
    @IBOutlet weak var btnNatation: UIButton!
    @IBOutlet weak var btnEquitation: UIButton!
    @IBOutlet weak var btnCourse: UIButton!
    @IBOutlet weak var btnMusculation: UIButton!
    @IBOutlet weak var btnCyclisme: UIButton!
    @IBOutlet weak var btnBasket: UIButton!
    @IBOutlet weak var titreProgrammeEdit: UITextField!
    var nouveauProgramme : Programme!
    var typesButton : [UIButton : TypeProgramme] = [:]
    var typeProgrammeSelected : TypeProgramme!
    
    let programmeBD : ProgrammePersistence = ProgrammePersistence()
    var programmeId : Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typesButton = [btnVolley! : TypeProgramme.VOLLEYBALL, btnFoot! : TypeProgramme.FOOTBALL, btnNatation! : TypeProgramme.NATATION, btnEquitation! : TypeProgramme.EQUITATION, btnCourse! : TypeProgramme.COURSE, btnMusculation! : TypeProgramme.MUSCULATION, btnCyclisme! : TypeProgramme.CYCLISME, btnBasket! : TypeProgramme.BASKETBALL]


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func annuler(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func validerProgramme(_ sender: Any) {
    }
    
    func selected(button : UIButton){
        unselectAll()
        typeProgrammeSelected = typesButton[button]
        button.layer.isHidden = false
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: -1, height: 1)
        button.layer.shadowRadius = 2
        
        button.layer.shadowPath = UIBezierPath(rect: btnVolley.bounds).cgPath
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = true ? UIScreen.main.scale : 1
    }
    
    func unselectAll() {
        for button in typesButton.keys {
            button.layer.shadowOpacity = 0
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        programmeId = programmeBD.getProgrammes().count
        programmeId += 1
        
        if(typeProgrammeSelected == nil || titreProgrammeEdit.text == "")
        {
            let alert = UIAlertController(title:"Erreur", message:"Veuillez sélectionner un type et saisir un titre pour votre programme", preferredStyle: .alert)
            let action = UIAlertAction(title:"OK", style: .default) { (_) in }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return
        }
        
        var programme = Programme(id: programmeId, titre: titreProgrammeEdit.text!, type: typeProgrammeSelected, dateCreation: NSDate())
        
        if (segue.identifier == "activitesSegue") {
            let vc = segue.destination as! ActivitesTabBarController
            vc.programmeWIP = programme
        }
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
