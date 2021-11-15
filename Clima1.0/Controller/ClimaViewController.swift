//
//  ViewController.swift
//  Clima1.0
//
//  Created by Mero on 2021-10-28.
//
// UITextFieldDelegate allow the class to get access the text field
import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - OUTLET
    //Containers View
    @IBOutlet weak var topContainerV: UIView!
    @IBOutlet weak var middleContainerV: UIView!
    @IBOutlet weak var bottomContainerV: UIView!
    @IBOutlet weak var TopCurrentTemperature: UIView!
    //testing Background Layer video
    private var playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    @IBOutlet weak var VideoLayer: UIImageView!
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
        //Day
        @IBOutlet weak var Day0: UILabel!
        @IBOutlet weak var Day1: UILabel!
        @IBOutlet weak var Day2: UILabel!
        @IBOutlet weak var Day3: UILabel!
        @IBOutlet weak var Day4: UILabel!
        @IBOutlet weak var Day5: UILabel!
        @IBOutlet weak var Day6: UILabel!
        @IBOutlet weak var Day7: UILabel!
        @IBOutlet weak var Day8: UILabel!
        @IBOutlet weak var Day9: UILabel!
        //Icon
        @IBOutlet weak var DayIcon0: UIImageView!
        @IBOutlet weak var DayIcon1: UIImageView!
        @IBOutlet weak var DayIcon2: UIImageView!
        @IBOutlet weak var DayIcon3: UIImageView!
        @IBOutlet weak var DayIcon4: UIImageView!
        @IBOutlet weak var DayIcon5: UIImageView!
        @IBOutlet weak var DayIcon6: UIImageView!
        @IBOutlet weak var DayIcon7: UIImageView!
        @IBOutlet weak var DayIcon8: UIImageView!
        @IBOutlet weak var DayIcon9: UIImageView!
        //High Temp
        @IBOutlet weak var DayHighTemp0: UILabel!
        @IBOutlet weak var DayHighTemp1: UILabel!
        @IBOutlet weak var DayHighTemp2: UILabel!
        @IBOutlet weak var DayHighTemp3: UILabel!
        @IBOutlet weak var DayHighTemp4: UILabel!
        @IBOutlet weak var DayHighTemp5: UILabel!
        @IBOutlet weak var DayHighTemp6: UILabel!
        @IBOutlet weak var DayHighTemp7: UILabel!
        @IBOutlet weak var DayHighTemp8: UILabel!
        @IBOutlet weak var TempHighTemp9: UILabel!
        //Low Temp
        @IBOutlet weak var DayLowTemp0: UILabel!
        @IBOutlet weak var DayLowTemp1: UILabel!
        @IBOutlet weak var DayLowTemp2: UILabel!
        @IBOutlet weak var DayLowTemp3: UILabel!
        @IBOutlet weak var DayLowTemp4: UILabel!
        @IBOutlet weak var DayLowTemp5: UILabel!
        @IBOutlet weak var DayLowTemp6: UILabel!
        @IBOutlet weak var DayLowTemp7: UILabel!
        @IBOutlet weak var DayLowTemp8: UILabel!
        @IBOutlet weak var DayLowTemp9: UILabel!
    //SearchBar
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var SearchContainer: UIView!

    //MARK: - code
    
    var TheWeatherManager = WeatherManager() //getting info from the model to the URL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    //to unregister these function
    deinit {
        //stop listening to the keyboard showning and hiding event
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - ACTION
    
    //setup
    func initialSetup() {
        //listen to the keyboard event
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        //hiding the keyboard if any place around the commponent is clicked
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hidekeyboard)))
        // making the text field access the delegate proparty to set it to current class
        searchBar.delegate = self
        //Containers round edges
        topContainerV.layer.cornerRadius = 21
        middleContainerV.layer.cornerRadius = 21
        bottomContainerV.layer.cornerRadius = 21
        SearchContainer.layer.cornerRadius = 18
        TopCurrentTemperature.layer.cornerRadius = 100
        //this to allow the edges to cut
        topContainerV.layer.masksToBounds = true
        middleContainerV.layer.masksToBounds = true
        bottomContainerV.layer.masksToBounds = true
        TopCurrentTemperature.layer.masksToBounds = true
        SearchContainer.layer.masksToBounds = true
        //placeholder coloer
        searchBar.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        //underlining weather massage
        CurrentWeathMassage.attributedText = NSAttributedString(
            string: "Partly cloudy condition expected around 5AM.",
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
        FutureForcaset.attributedText = NSAttributedString(
            string: "10-Day FORECAST",
            attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
        playVideo()
    }

    //frozen video player
    func playVideo() {
        //load Player
        guard let path = Bundle.main.path(forResource: "Sunset", ofType: "mp4") else {return}
        let player = AVQueuePlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        let fileUrl = Bundle.main.url(forResource: "Sunset", withExtension: "mp4")!
        let playerItem = AVPlayerItem(url: fileUrl)
        //setup player
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.VideoLayer.layer.addSublayer(playerLayer)
        //Looping
        playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
        player.play()
    }

    //private fun to hide the keyboard
    @objc func hidekeyboard() {
//        print("is it working ")
        self.view.endEditing(true)
        searchBar.endEditing(true)
    }
    //checking if the keyboard will show
    @objc func keyboardWillShow (notification: NSNotification){
        if let keyboardFrame : NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?
        NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            self.view.frame.origin.y = -keyboardHeight + 11 // 11 is the height of bottom container
        } else {return }
    }
    //checking if the keyboard will hide
    @objc func keyboardWillHide () {
        self.view.frame.origin.y = 0
    }
    //method to return the text inside the textfild because we created the delegate and assgined to self
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //have access to what inside the text field
//        print(searchBar.text!)
        //close the keyboard once it is done type
        searchBar.endEditing(true)
        return true
    }
    //no for validation checking if the user typed anything in the text field
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        if searchBar.text != "" {
//            searchBar.placeholder = "Search"
//            return true
//        } else {
//            //returning a massage to the user to add something in the field
//            searchBar.placeholder = "Please add a location"
//            return false // this will make the text field not stop editing
//        }
//    }
    // return the text field to be empty after it is done editing
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //before clearning the text field saving the location
        if let city = searchBar.text {
            //passing down the name of the city that we are looking for and it should be a string
            TheWeatherManager.featchWeather(cityname: city)
            TheWeatherManager.featchGeoCode(cityname: city)
        }
        searchBar.text=""
    }

}

