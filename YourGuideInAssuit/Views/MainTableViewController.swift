//
//  MainTableViewController.swift
//  YourGuideInAssuit
//
//  Created by Mostafa AbdEl Fatah on 10/24/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    let mainSections = [ "العيادات", "المستشفيات", "الصيدليات", "المعامل الطبية", "الفنادق", "المطاعم", "السماسره" ]
    
   
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "دليلك في اسيوط"
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mainSections.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = mainSections[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 || indexPath.row == 1 {
            let mainStoryboard = UIStoryboard(name: "Main", bundle:Bundle.main)
            let vc  = mainStoryboard.instantiateViewController(withIdentifier: "medicalBranch") as! MedicalTableViewController
            vc.medicalType = JSONKeysNames.SUB_BRANCH[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }else {
            let mainStoryboard = UIStoryboard(name: "Main", bundle:Bundle.main)
            let vc  = mainStoryboard.instantiateViewController(withIdentifier: "subBranch") as! SubTableViewController
            vc.subType = JSONKeysNames.SUB_BRANCH[indexPath.row]
            vc.navigationItem.title = self.mainSections[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}











