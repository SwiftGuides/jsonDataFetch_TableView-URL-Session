//
//  secondViewController.swift
//  jsonDataFetchTableView
//
//  Created by MacMini on 9/20/18.
//  Copyright © 2018 com.thisislit. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    
    // @IBoutlets
    
    @IBOutlet weak var regionLabel: UILabel!
    
    @IBOutlet weak var subRegionLabel: UILabel!
    
    @IBOutlet weak var populationLabel: UILabel!
    
    @IBOutlet weak var alpha3CodeLabel: UILabel!
    
    
    var strRegion = ""
    var strSubRegion = ""
    var strPopulation = ""
    var strAlpha3Code = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    //Passing the Label.text in String Value because the data can not be fetched directly into the label
        
        regionLabel.text = strRegion
        subRegionLabel.text = strSubRegion
        populationLabel.text = strPopulation
        alpha3CodeLabel.text = strAlpha3Code
        
    }



}
