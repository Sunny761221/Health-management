//
//  ManVC.swift
//  Health-management
//
//  Created by ios135 on 2017/5/31.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class ManVC: UIViewController,UITextFieldDelegate {

    var heiInt:Int = 0
    var weiInt:Int = 0
    var ageInt:Int = 0
    
    
    @IBOutlet weak var segSex: UISegmentedControl!
    @IBOutlet weak var segSport: UISegmentedControl!
    
    @IBOutlet weak var heightTF: UITextField!
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    
    
    @IBOutlet weak var BMILab: UILabel!
    @IBOutlet weak var BMRLab: UILabel!
    @IBOutlet weak var StandWeiLab: UILabel!
    

    @IBAction func Calculation(_ sender: Any) {

        if let hei=Int(heightTF.text!){
          if let wei=Int(weightTF.text!){
            if let ageSt=Int(ageTF.text!){
              heiInt=hei
              weiInt=wei
              ageInt=ageSt
              let BMITotalSt=Tool.countBMI(height: hei, weight: wei, age: ageSt)
                BMILab.text=BMITotalSt
              if segSex.selectedSegmentIndex == 0 {
                let SWManCal=Tool.ManCalSW(height: hei)
                StandWeiLab.text=SWManCal
                ManCalBMR()
              }else{
                let SWWomanCal=Tool.WomanCalSW(height: hei)
                StandWeiLab.text=SWWomanCal
                WomanCalBMR()
              }
            }else{
              enterAction()
              heiInt=0
            }
          }else{
            enterAction()
            weiInt=0
          }
        }else{
          enterAction()
          ageInt=0
        }
        

    }
    

    func ManCalBMR(){

        var BMRTotal:Double = 66.0+(13.7*Double(weiInt))+(5.0*Double(heiInt))-(6.8*Double(ageInt))

        if segSport.selectedSegmentIndex == 0{
           BMRTotal *= 1.2
        }else if segSport.selectedSegmentIndex == 1{
           BMRTotal *= 1.375
        }else if segSport.selectedSegmentIndex == 2{
            BMRTotal *= 1.55
        }else{
            BMRTotal *= 1.725
        }
        
        let BMRTotalStr:String = NSString(format:"%.2f",BMRTotal) as String
        BMRLab.text = BMRTotalStr
}
    
    func WomanCalBMR(){
        var BMRTotal:Double = 655.0+(9.6*Double(weiInt))+(1.9*Double(heiInt))-(4.7*Double(ageInt))
        if segSport.selectedSegmentIndex == 0{
            BMRTotal *= 1.2
        }else if segSport.selectedSegmentIndex == 1{
            BMRTotal *= 1.375
        }else if segSport.selectedSegmentIndex == 2{
            BMRTotal *= 1.55
        }else{
            BMRTotal *= 1.725
        }
        let BMRTotalSt:String = NSString(format:"%.2f",BMRTotal) as String
        BMRLab.text = BMRTotalSt
}

    func enterAction(){
        var alertMeassage = ""
        let title = "提示訊息"
        
        let heightM = heightTF.text
        let weightM = weightTF.text
        let ageM = ageTF.text
        
        if (heightM?.isEmpty)! && (weightM?.isEmpty)! && (ageM?.isEmpty)!{
            alertMeassage="身高,體重,年齡輸入有誤"
        }else if (heightM?.isEmpty)! && (weightM?.isEmpty)!{
            alertMeassage="身高,體重輸入有誤"
        }else if (weightM?.isEmpty)! && (ageM?.isEmpty)!{
            alertMeassage="體重,年齡輸入有誤"
        }else if (heightM?.isEmpty)! && (ageM?.isEmpty)!{
            alertMeassage="身高,年齡輸入有誤"
        }else if (heightM?.isEmpty)!{
            alertMeassage="身高輸入有誤"
        }else if (weightM?.isEmpty)!{
            alertMeassage="體重輸入有誤"
        }else{
            alertMeassage="年齡輸入有誤"
        }
        
        let alertController = UIAlertController(title: title, message: alertMeassage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(
            title: "確認",
            style: .default,
            handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
}
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.heightTF.delegate=self
        self.weightTF.delegate=self
        self.ageTF.delegate=self

        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
