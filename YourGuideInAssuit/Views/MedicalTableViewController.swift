//
//  MedicalTableViewController.swift
//  YourGuideInAssuit
//
//  Created by Mostafa AbdEl Fatah on 10/24/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import UIKit

class MedicalTableViewController: UITableViewController {

    
    var medicalData:[Any] = []
    var medicalType:String!
    var selectedIndexPath:IndexPath!
    
    
    override func viewDidLoad() {
        if self.medicalType == JSONKeysNames.CLINICS {
            self.navigationItem.title = "العيادات"
        }else{
            self.navigationItem.title = "المستشفيات"
        }
        loadData()
    }
    func loadData(){
        if self.medicalType == JSONKeysNames.CLINICS {
            if let path = Bundle.main.path(forResource: "departments", ofType: "json"){
                do {
                    let contents = try String(contentsOfFile: path).data(using: .utf8)
                    let department:Department = try! JSONDecoder().decode(Department.self, from: contents! )
                    self.medicalData = department.data
                } catch {
                    // contents could not be loaded
                }
                
            }
        }else {
            self.medicalData = [ "المستشفيات الحكومية" , "المستشفيات الخاصة" ]
        }
    }
    
   
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.medicalData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medicalCell", for: indexPath)

        // Configure the cell...
        if self.medicalType == JSONKeysNames.CLINICS {
            let department = self.medicalData[indexPath.row] as! Department.DepartmentData
            cell.textLabel?.text = department.Name
        }else{
            if let text = self.medicalData[indexPath.row] as? String{
                cell.textLabel?.text = text
            }else {
                cell.textLabel?.text = "nil"
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        self.selectedIndexPath = indexPath
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? SubTableViewController {
            if self.medicalType == JSONKeysNames.CLINICS{
                let index = self.selectedIndexPath.row + 1
                destination.subType = "clinics/\(JSONKeysNames.CLINICS)\(index)"
                destination.navigationItem.title = (self.medicalData[self.selectedIndexPath.row] as! Department.DepartmentData ).Name
            }else{
                
                if self.selectedIndexPath.row == 0 {
                    destination.subType = JSONKeysNames.HOSPITALS
                    destination.navigationItem.title = self.medicalData[0] as? String
                }else{
                    destination.subType = JSONKeysNames.S_HOSPITALS
                    destination.navigationItem.title = self.medicalData[1] as? String
                }
            }
            
        }
        ////
    }

}








