//
//  ActivitesTabBarController.swift
//  ProgrammeSportif
//
//  Created by if26-grp1 on 10/01/2018.
//  Copyright © 2018 MougneMarcellin. All rights reserved.
//

import UIKit

class ActivitesTabBarController: UITabBarController {
    
    var programmeWIP : Programme?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = programmeWIP?.getTitre()
        
        var addActiviteTempsController = self.viewControllers?[0] as! AddActiviteTemps // or whatever tab index you're trying to access
        addActiviteTempsController.programmeWIP = self.programmeWIP
        
        var addActiviteRepetitionController = self.viewControllers?[1] as! AddActiviteRepetition // or whatever tab index you're trying to access
        addActiviteRepetitionController.programmeWIP = self.programmeWIP
        
        var ProgrammeRecapTableViewControllerSegue = self.viewControllers?[2] as! ProgrammeRecapTableViewController // or whatever tab index you're trying to access
        ProgrammeRecapTableViewControllerSegue.programmeWIP = self.programmeWIP
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
