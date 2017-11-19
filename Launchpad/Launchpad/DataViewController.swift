//
//  DataViewController.swift
//  Launchpad
//
//  Created by Benjamin Hilborn on 2017-11-18.
//  Copyright © 2017 Launchpad Inc. All rights reserved.
//

import UIKit


struct element {
    
    var name: String
    var longitude: Double
    var latitude: Double
}

var EmployeesMax:Int = 0
var SquareFootage:Int = 0
var RentDollars:Int = 0
var RentEquity:Int = 0

var RecreationFacilitiesTable: [element] = []
var BusStopsTable: [element] = []
var CalgaryBusinessLicensesMapTable: [element] = []
var SecondarySuitsTable: [element] = []
var LRTTable: [element] = []
var FoodServiceTable: [element] = []

struct element2 {
    var name: String
    var longitude: Double
    var latitude: Double
    var Square_Feet: Double
    var Price_Month: Double
    var Bathrooms: Int
}

var RentFasterTable: [element2] = []

class DataViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""
    
    @IBOutlet weak var EmployeeNumFeeback: UILabel!
    
    @IBOutlet weak var CustomSquareFootage: UITextField!

    @IBOutlet weak var Dollars: UITextField!
    
    @IBOutlet weak var Equity: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("loaded")

        loadRecreationFacilitiesTable()
        loadBusStopsTable()
        loadCalgaryBusinessLicensesMap()
        loadSecondarySuits()
        loadLRT()
        loadFoodService()
        
        loadRentFaster()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func EmployeeNum(_ sender: UISegmentedControl) {
        //print(sender.selectedSegmentIndex)
        if (sender.selectedSegmentIndex == 0){
            EmployeeNumFeeback.text = "Our best guess says you might need about 500 square feet. How does that sound?"
            EmployeesMax = 5
            SquareFootage = 500
        }
        else if (sender.selectedSegmentIndex == 1){
            EmployeeNumFeeback.text = "Our best guess says you might need about 1000 square feet. How does that sound?"
            EmployeesMax = 10
            SquareFootage = 1000
        }
        else if (sender.selectedSegmentIndex == 2){
            EmployeeNumFeeback.text = "Our best guess says you might need about 1500 square feet. How does that sound?"
            EmployeesMax = 15
            SquareFootage = 1500
        }
    }
    
    @IBAction func ChangeSquareFootage(_ sender: UIButton) {
        SquareFootage = (CustomSquareFootage.text as! NSString).integerValue
    }
    
    @IBAction func Tap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    
    func loadRecreationFacilitiesTable(){
        let file = "Recreation_Facilities"
        let filepath = Bundle.main.path(forResource: file, ofType: "csv")
        
        var Element = element(name: "", longitude: 0.0, latitude: 0.0)
        do
        {
            let File_contents = try String(contentsOfFile: filepath!)
            //print(Recreation_Facilities_contents)
            let lines = File_contents.components(separatedBy: "\n")
            for line in lines[1...lines.count-2] {
                let words = line.components(separatedBy: ",")
                if words.count > 2 {
                    Element.name = words[0]
                    Element.longitude = (words[words.count-4] as NSString).doubleValue
                    Element.latitude = (words[words.count-3] as NSString).doubleValue
                    RecreationFacilitiesTable.append(Element)
                }
            }
            //print(Recreation_FacilitiesTable[0])
        }
        catch
        {
            // contents could not be loaded
        }
    }
    
    func loadBusStopsTable(){
        let file = "stops"
        let filepath = Bundle.main.path(forResource: file, ofType: "csv")
        
        var Element = element(name: "", longitude: 0.0, latitude: 0.0)
        do
        {
            let File_contents = try String(contentsOfFile: filepath!)
            //print(Recreation_Facilities_contents)
            let lines = File_contents.components(separatedBy: "\n")
            for line in lines[1...lines.count-2] {
                let words = line.components(separatedBy: ",")
                if words.count > 2 {
                    Element.name = words[0]
                    Element.longitude = (words[words.count-4] as NSString).doubleValue
                    Element.latitude = (words[words.count-5] as NSString).doubleValue
                    BusStopsTable.append(Element)
                }
            }
            //print(BusStopsTable[0])
        }
        catch
        {
            // contents could not be loaded
        }
    }
    
    func loadCalgaryBusinessLicensesMap(){
        let file = "Calgary_Business_Licenses_Map"
        let filepath = Bundle.main.path(forResource: file, ofType: "csv")
        
        var Element = element(name: "", longitude: 0.0, latitude: 0.0)
        do
        {
            let File_contents = try String(contentsOfFile: filepath!)
            //print(Recreation_Facilities_contents)
            let lines = File_contents.components(separatedBy: "\n")
            for line in lines[1...lines.count-2] {
                let words = line.components(separatedBy: ",")
                if words.count > 2 {
                    Element.name = words[0]
                    Element.longitude = (words[words.count-5] as NSString).doubleValue
                    Element.latitude = (words[words.count-4] as NSString).doubleValue
                    CalgaryBusinessLicensesMapTable.append(Element)
                }
            }
            //print(CalgaryBusinessLicensesMapTable[0])
        }
        catch
        {
            // contents could not be loaded
        }
    }
    
    func loadSecondarySuits(){
        let file = "Secondary Suites-Table 1"
        let filepath = Bundle.main.path(forResource: file, ofType: "csv")
        
        var Element = element(name: "", longitude: 0.0, latitude: 0.0)
        do
        {
            let File_contents = try String(contentsOfFile: filepath!)
            //print(Recreation_Facilities_contents)
            let lines = File_contents.components(separatedBy: "\n")
            for line in lines[1...lines.count-2] {
                let words = line.components(separatedBy: ",")
                if words.count > 2 {
                    Element.name = words[1]
                    Element.longitude = (words[9] as NSString).doubleValue
                    Element.latitude = (words[10] as NSString).doubleValue
                    SecondarySuitsTable.append(Element)
                }
            }
            //print(SecondarySuitsTable[0])
        }
        catch
        {
            // contents could not be loaded
        }
    }
    
    func loadLRT(){
        let file = "LRT-Table 1"
        let filepath = Bundle.main.path(forResource: file, ofType: "csv")
        
        var Element = element(name: "", longitude: 0.0, latitude: 0.0)
        do
        {
            let File_contents = try String(contentsOfFile: filepath!)
            //print(Recreation_Facilities_contents)
            let lines = File_contents.components(separatedBy: "\n")
            for line in lines[1...lines.count-2] {
                let words = line.components(separatedBy: ",")
                if words.count > 2 {
                    Element.name = words[0]
                    Element.longitude = (words[words.count-2] as NSString).doubleValue
                    Element.latitude = (words[words.count-1] as NSString).doubleValue
                    LRTTable.append(Element)
                }
            }
            //print(LRTTable[0])
        }
        catch
        {
            // contents could not be loaded
        }
    }
    
    func loadFoodService(){
        let file = "Food Services-Table 1"
        let filepath = Bundle.main.path(forResource: file, ofType: "csv")
        
        var Element = element(name: "", longitude: 0.0, latitude: 0.0)
        do
        {
            let File_contents = try String(contentsOfFile: filepath!)
            //print(Recreation_Facilities_contents)
            let lines = File_contents.components(separatedBy: "\n")
            for line in lines[1...lines.count-2] {
                let words = line.components(separatedBy: ",")
                if words.count > 2 {
                    Element.name = words[0]
                    Element.longitude = (words[words.count-7] as NSString).doubleValue
                    Element.latitude = (words[words.count-6] as NSString).doubleValue
                    FoodServiceTable.append(Element)
                }
            }
            print(FoodServiceTable[0])
        }
        catch
        {
            // contents could not be loaded
        }
    }

    func loadRentFaster(){
        let file = "RentFaster Entries-Table 1"
        let filepath = Bundle.main.path(forResource: file, ofType: "csv")
        
        var Element2 = element2(name: "", longitude: 0.0, latitude: 0.0, Square_Feet: 0.0, Price_Month: 0.0, Bathrooms: 0)

        do
        {
            let File_contents = try String(contentsOfFile: filepath!)
            //print(Recreation_Facilities_contents)
            let lines = File_contents.components(separatedBy: "\n")
            for line in lines[1...lines.count-2] {
                let words = line.components(separatedBy: ",")
                if words.count > 2 {
                    Element2.name = words[2]
                    Element2.longitude = (words[1] as NSString).doubleValue
                    Element2.latitude = (words[0] as NSString).doubleValue
                    Element2.Square_Feet = (words[3] as NSString).doubleValue
                    Element2.Price_Month = (words[4] as NSString).doubleValue
                    Element2.Bathrooms = (words[5] as NSString).integerValue
                    RentFasterTable.append(Element2)
                }
            }
            //print(RentFasterTable[0])
        }
        catch
        {
            // contents could not be loaded
        }
    }
    
    @IBAction func SubmitRent(_ sender: UIButton) {
        //RentDollars = Int(Dollars.text)
        //RentEquity = Int(Equity.text)
    }
    

}

