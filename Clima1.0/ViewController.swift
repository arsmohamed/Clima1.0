//
//  ViewController.swift
//  Clima1.0
//
//  Created by Mero on 2021-10-28.
//

import UIKit

class ViewController: UIViewController {
    
    //SearchBar
    @IBOutlet weak var searchBar: UITextField!
    //Containers View
    @IBOutlet weak var topContainerV: UIView!
    @IBOutlet weak var middleContainerV: UIView!
    @IBOutlet weak var bottomContainerV: UIView!
    //Location
    @IBOutlet weak var Location: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Containers round edges
        topContainerV.layer.cornerRadius = 21
        middleContainerV.layer.cornerRadius = 21
        bottomContainerV.layer.cornerRadius = 21
        //this to allow the edges to cut
        topContainerV.layer.masksToBounds = true
        middleContainerV.layer.masksToBounds = true
        bottomContainerV.layer.masksToBounds = true
        //placeholder coloer
        searchBar.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
    }


}

