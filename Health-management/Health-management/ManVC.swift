//
//  ManVC.swift
//  Health-management
//
//  Created by ios135 on 2017/5/31.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class ManVC: UIViewController {

    
    @IBOutlet weak var heightTF: UITextField!
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    
    @IBOutlet weak var BMILab: UILabel!
    @IBOutlet weak var BMRLab: UILabel!
    @IBOutlet weak var StandWeiLab: UILabel!
    
    @IBAction func Calculation(_ sender: Any) {
        let hei:String = heightTF.text!
        let heiInt:Int = Int(hei)!
//        let heiStr:String = String(heiInt)
        
        let wei:String = weightTF.text!
        let weiInt:Int = Int(wei)!
//        let weiStr:String = String(weiInt)
        
        let ageSt:String = ageTF.text!
        let ageInt:Int = Int(ageSt)!
//        let ageStr:String = String(ageInt)
        
        let BMITotal:Double = (Double(weiInt)/Double(heiInt*heiInt))*10000.0
        let BMITotalStr:String = NSString(format:"%.2f",BMITotal) as String
        BMILab.text = BMITotalStr
        
        let BMRTotal:Double = 66.0+(13.7*Double(weiInt))+(5.0*Double(heiInt))-(6.8*Double(ageInt))
        let BMRTotalStr:String = NSString(format:"%.2f",BMRTotal) as String
        BMRLab.text = BMRTotalStr
        
        let SWTotal:Double = 62.0+(Double(heiInt)-170.0)*0.6
        let SWTotalStr:String = NSString(format:"%.2f",SWTotal) as String
        StandWeiLab.text = SWTotalStr
        
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
