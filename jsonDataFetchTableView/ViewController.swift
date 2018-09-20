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
}

class ViewController: UIViewController {

    var arrData = [myJsonStruct]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

    }

    func getData(){
        
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                if error == nil {
                    self.arrData = try JSONDecoder().decode([myJsonStruct].self, from: data!)
                    
                    for mainArr in self.arrData{
                    
                        print(mainArr.name,":",mainArr.capital,":",mainArr.region)
                        
                    }
                        
                }
            }catch{
                    
                    print("Error in ghetting JSON Data")
                }
                
                
            }.resume()
        }
    }
    



