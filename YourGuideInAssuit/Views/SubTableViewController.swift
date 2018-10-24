//
//  SubTableViewController.swift
//  YourGuideInAssuit
//
//  Created by Mostafa AbdEl Fatah on 10/24/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import UIKit

class SubTableViewController: UITableViewController {

    var subType:String!
    var placesData:[Place.PlaceData] = []
    var selectedIndexPath:IndexPath!
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    func loadData(){
        if let path = Bundle.main.path(forResource: subType, ofType: "json"){
            do {
                let contents = try String(contentsOfFile: path).data(using: .utf8)
                let place:Place = try! JSONDecoder().decode(Place.self, from: contents! )
                self.placesData = place.data
            } catch {
                // contents could not be loaded
            }
            
        }
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.placesData.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subCell", for: indexPath) as! TableViewCell
        // Configure the cell...
        cell.placeName.text = self.placesData[indexPath.row].Name
        cell.placeAddress.text = self.placesData[indexPath.row].Address
        
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
        if let destination = segue.destination as? DetailsViewController {
            destination.placeInfo = self.placesData[self.selectedIndexPath.row]
            destination.navigationItem.title = self.navigationItem.title
        }
    }
    

}









