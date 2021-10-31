//
//  ViewController.swift
//  Clima1.0
//
//  Created by Mero on 2021-10-28.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - OUTLET
        //SearchBar
        @IBOutlet weak var searchBar: UITextField!
        //Containers View
        @IBOutlet weak var topContainerV: UIView!
        @IBOutlet weak var middleContainerV: UIView!
        @IBOutlet weak var bottomContainerV: UIView!
        //Location
        @IBOutlet weak var Location: UILabel!
        //current temperature TOP
        @IBOutlet weak var currentTV: UILabel!
        @IBOutlet weak var currentT: UILabel!
        //Weather current feal like TOP
        @IBOutlet weak var currentWFL: UILabel!
        //High and low current temperature TOP
        @IBOutlet weak var highTV: UILabel!
        @IBOutlet weak var lowTV: UILabel!
        //Weather massage Middle
        @IBOutlet weak var weatherMassage: UILabel!
    
    
    //MARK: - ACTION
    
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
        //underlining weather massage
        weatherMassage.attributedText = NSAttributedString(
            string: "Partly cloudy condition expected around 5AM.",
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
    }


}

