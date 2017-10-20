//
//  DetailViewController.swift
//  RESTDemo
//
//  Created by John Cottrell on 10/2/17.
//  Copyright © 2017 John Cottrell. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receivedData: Person!
    @IBOutlet weak var headerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLabel.text = receivedData.firstName
        
    }
}
