//
//  ViewController.swift
//  Clima1.0
//
//  Created by Mero on 2021-10-28.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - OUTLET
    //Containers View
    @IBOutlet weak var topContainerV: UIView!
    @IBOutlet weak var middleContainerV: UIView!
    @IBOutlet weak var bottomContainerV: UIView!
    @IBOutlet weak var TopCurrentTemperature: UIView!
    
    //Top
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var CurrentTempIcon: UIImageView!
    @IBOutlet weak var CurrentWeatherFeelLike: UILabel!
    @IBOutlet weak var CurrentTempVal: UILabel!
    @IBOutlet weak var CurrentHighVal: UILabel!
    @IBOutlet weak var CurrentLowVal: UILabel!
    //Middle
    @IBOutlet weak var CurrentWeathMassage: UILabel!
        //Time
        @IBOutlet weak var CurrentTime0: UILabel!
        @IBOutlet weak var CurrentTime1: UILabel!
        @IBOutlet weak var CurrentTime2: UILabel!
        @IBOutlet weak var CurrentTime3: UILabel!
        @IBOutlet weak var CurrentTime4: UILabel!
        @IBOutlet weak var CurrentTime5: UILabel!
        @IBOutlet weak var CurrentTime6: UILabel!
        @IBOutlet weak var CurrentTime7: UILabel!
        @IBOutlet weak var CurrentTime8: UILabel!
        @IBOutlet weak var CurrentTime9: UILabel!
        //Icon
        @IBOutlet weak var CurrentIcon0: UIImageView!
        @IBOutlet weak var CurrentIcon1: UIImageView!
        @IBOutlet weak var CurrentIcon2: UIImageView!
        @IBOutlet weak var CurrentIcon3: UIImageView!
        @IBOutlet weak var CurrentIcon4: UIImageView!
        @IBOutlet weak var CurrentIcon5: UIImageView!
        @IBOutlet weak var CurrentIcon6: UIImageView!
        @IBOutlet weak var CurrentIcon7: UIImageView!
        @IBOutlet weak var CurrentIcon8: UIImageView!
        @IBOutlet weak var CurrentIcon9: UIImageView!
        //Temp
        @IBOutlet weak var CurrentTemp0: UILabel!
        @IBOutlet weak var CurrentTemp1: UILabel!
        @IBOutlet weak var CurrentTemp2: UILabel!
        @IBOutlet weak var CurrentTemp3: UILabel!
        @IBOutlet weak var CurrentTemp4: UILabel!
        @IBOutlet weak var CurrentTemp5: UILabel!
        @IBOutlet weak var CurrentTemp6: UILabel!
        @IBOutlet weak var CurrentTemp7: UILabel!
        @IBOutlet weak var CurrentTemp8: UILabel!
        @IBOutlet weak var CurrentTemp9: UILabel!
    //Bottom
    @IBOutlet weak var FutureForcaset: UILabel!

    //SearchBar
    @IBOutlet weak var searchBar: UITextField!

    //MARK: - ACTION
        
    
    //MARK: - code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Containers round edges
        topContainerV.layer.cornerRadius = 21
        middleContainerV.layer.cornerRadius = 21
        bottomContainerV.layer.cornerRadius = 21
        TopCurrentTemperature.layer.cornerRadius = 100
        //this to allow the edges to cut
        topContainerV.layer.masksToBounds = true
        middleContainerV.layer.masksToBounds = true
        bottomContainerV.layer.masksToBounds = true
        TopCurrentTemperature.layer.masksToBounds = true
        //placeholder coloer
        searchBar.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        //underlining weather massage
        CurrentWeathMassage.attributedText = NSAttributedString(
            string: "Partly cloudy condition expected around 5AM. Partly cloudy condition expected around 5AM. ",
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
        FutureForcaset.attributedText = NSAttributedString(
            string: "10-Day FORECAST",
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
    }


}

