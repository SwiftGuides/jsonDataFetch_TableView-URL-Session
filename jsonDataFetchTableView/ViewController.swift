//
//  ViewController.swift
//  jsonDataFetchTableView
//
//  Created by MacMini on 9/20/18.
//  Copyright © 2018 com.thisislit. All rights reserved.
//

import UIKit

// Made the Struct so that we dont have to mention these keys everywhere in the code
struct myJsonStruct:Decodable{
    let name:String
    let capital:String
    let region:String
    let subregion:String
    let alpha3Code:String
    let population:Int
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var myTableView: UITableView!
    
    // assigning struct as array
    var arrData = [myJsonStruct]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

    }

    func getData(){
        
        // Fetching data from JSONHandler
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                if error == nil {
                    self.arrData = try JSONDecoder().decode([myJsonStruct].self, from: data!)
                    
                    for mainArr in self.arrData{
                    
                      print(mainArr.name,":",mainArr.capital,":",mainArr.region)
                       
                        DispatchQueue.main.async {
                            self.myTableView.reloadData()
                        }
                    }
                        
                }
            }catch{
                    
                    print("Error in getting JSON Data")
                }
                
                
            }.resume()
        }
    // array count in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrData.count
    }
    // cell data in rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.nameLabel.text = "Country : \(arrData[indexPath.row].name)"
        cell.capitalLabel.text = "Capital : \(arrData[indexPath.row].capital)"
        return cell
        
    }
    //for action by tapping on the cells
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataDetails = self.storyboard?.instantiateViewController(withIdentifier: "secondView") as! secondViewController
        
        dataDetails.strRegion = "Region : \(arrData[indexPath.row].region)"
        dataDetails.strSubRegion = "SubRegion : \(arrData[indexPath.row].subregion)"
        dataDetails.strPopulation = "Population : \(arrData[indexPath.row].population)"
        dataDetails.strAlpha3Code = "Aplha3Code : \(arrData[indexPath.row].alpha3Code)"
        
        self.navigationController?.pushViewController(dataDetails, animated: true)
        
        
    }
    
    }
    



