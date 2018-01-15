//
//  ViewController.swift
//  ProgrammeSportif
//
//  Created by if26-grp1 on 12/12/2017.
//  Copyright © 2017 MougneMarcellin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var connectionProgrammes : ProgrammePersistence!
    var connectionActivites : ActivitePersistence!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        connectionProgrammes = ProgrammePersistence()
        connectionActivites = ActivitePersistence()
        
       // connectionProgrammes.deleteTable()
      //  connectionActivites.deleteTable()

        connectionProgrammes.createTable()
        connectionActivites.createTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

