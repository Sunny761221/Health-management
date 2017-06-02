//
//  ManVC.swift
//  Health-management
//
//  Created by ios135 on 2017/5/31.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class ManVC: UIViewController {

    
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var age: UITextField!
    
    @IBOutlet weak var BMI: UILabel!
    @IBOutlet weak var BMR: UILabel!

    @IBAction func Calculation(_ sender: Any) {
        let hei:String = height.text!
        let heiInt:Int = Int(hei)!
//        let heiStr:String = String(heiInt)
        
        let wei:String = weight.text!
        let weiInt:Int = Int(wei)!
//        let weiStr:String = String(weiInt)
        
//        let age1:String = age.text!
//        let ageInt:Int = Int(age1)!
//        let ageStr:String = String(ageInt)
        
        let total:Double = (Double(weiInt)/Double(heiInt*heiInt))*10000.0
        let totalStr:String = NSString(format:"%.2f",total) as String
        BMI.text = totalStr
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
