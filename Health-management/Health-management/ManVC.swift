//
//  ManVC.swift
//  Health-management
//
//  Created by ios135 on 2017/5/31.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

enum EnterError:Error {
    case notHeight
    case notWeight
    case notAge
}
class ManVC: UIViewController {

    var heiInt = 0
    var weiInt:Int = 0
    var ageInt:Int = 0
    
    
    @IBOutlet weak var SegCon: UISegmentedControl!
    @IBOutlet weak var SportCon: UISegmentedControl!
    
    @IBOutlet weak var heightTF: UITextField!
    @IBOutlet weak var weightTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    
//    lbl
//    btn
    
    
    @IBOutlet weak var BMILab: UILabel!
    @IBOutlet weak var BMRLab: UILabel!
    @IBOutlet weak var StandWeiLab: UILabel!
    

    @IBAction func Calculation(_ sender: Any) {
<<<<<<< HEAD
        if let hei=Int(heightTF.text!){
          if let wei=Int(weightTF.text!){
            if let ageSt=Int(ageTF.text!){
              heiInt=hei
              weiInt=wei
              ageInt=ageSt
              BMICal()
              if SegCon.selectedSegmentIndex == 0 {
                ManCalBMRAndSW()
              }else{
                WomanCalBMRAndSW()
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
        
        
//        if let hei=Int(heightTF.text!){
//            heiInt=hei
//            BMICal()
//        }else{
//            enterAction()
//            heiInt=0
//        }
//        
//        if let wei=Int(weightTF.text!){
//           weiInt=wei
//           BMICal()
//        }else{
//           enterAction()
//           weiInt=0
//        }
//        
//        if let ageSt=Int(ageTF.text!){
//           ageInt=ageSt
//           BMICal()
//        }else{
//           enterAction()
//           ageInt=0
//        }
        

        
        
//        var hei:String = heightTF.text!
//        heiInt = Int(hei)!
        
//        let wei:String = weightTF.text!
//        weiInt = Int(wei)!
        
//        let ageSt:String = ageTF.text!
//        ageInt = Int(ageSt)!
        
//        BMICal()
        
//        if SegCon.selectedSegmentIndex == 0 {
//           ManCalBMRAndSW()
//        }else{
//           WomanCalBMRAndSW()
//        }
=======
        let hei:String = heightTF.text!
//        heiInt = Int(hei)!
        let aa = Int(hei)
        
        
        
        
        let wei:String = weightTF.text!
//        weiInt = Int(wei)!
        
        let ageSt:String = ageTF.text!
//        ageInt = Int(ageSt)!
        
        
        if self.getDataFromUserInput(hei: hei, wei: wei, ageSt: ageSt){
        
            
            let BMIStr=Tool.countBMI(height: <#T##Int#>, weight: <#T##Int#>, age: <#T##Int#>)
            self.BMILab.text=BMIStr
            
            
            BMICal()
            
            if SegCon.selectedSegmentIndex == 0 {
                ManCalBMRAndSW()
            }else{
                WomanCalBMRAndSW()
            }
        }
        
        
>>>>>>> f2e1fed3ead9346a6afe6664a972fd788f59e2ab

    }
    
    func getDataFromUserInput(hei:String,wei:String,ageSt:String)->Bool{
        var msg="";
        if let localHeight = Int(hei){
            self.heiInt=localHeight
        }else{
            msg+="can't get height! "
        }
        if let localWei = Int(wei){
            self.weiInt=localWei
        }else{
            msg+="can't get weight! "
        }
        if let localAgeSt = Int(ageSt){
            self.ageInt=localAgeSt
        }else{
            msg+="can't get age! "
        }
        print(msg)
        
        if msg==""{
            return true
        }else{
            return false
        }
        
    }
    
    
    
    
    func BMICal(){
        let BMITotal:Double = (Double(weiInt)/Double(heiInt*heiInt))*10000.0
        let BMITotalStr:String = NSString(format:"%.2f",BMITotal) as String
        BMILab.text = BMITotalStr
    }
    
    
    func ManCalBMRAndSW(){
        var BMRTotal:Double = 66.0+(13.7*Double(weiInt))+(5.0*Double(heiInt))-(6.8*Double(ageInt))
        if SportCon.selectedSegmentIndex == 0{
           BMRTotal *= 1.2
        }else if SportCon.selectedSegmentIndex == 1{
           BMRTotal *= 1.375
        }else if SportCon.selectedSegmentIndex == 2{
            BMRTotal *= 1.55
        }else{
            BMRTotal *= 1.725
        }
        
        let BMRTotalStr:String = NSString(format:"%.2f",BMRTotal) as String
        BMRLab.text = BMRTotalStr
    
        let SWTotal:Double = 62.0+(Double(heiInt)-170.0)*0.6
        let SWTotalStr:String = NSString(format:"%.2f",SWTotal) as String
        StandWeiLab.text = SWTotalStr
    }
    
    func WomanCalBMRAndSW(){
        var BMRTotal:Double = 655.0+(9.6*Double(weiInt))+(1.9*Double(heiInt))-(4.7*Double(ageInt))
        if SportCon.selectedSegmentIndex == 0{
            BMRTotal *= 1.2
        }else if SportCon.selectedSegmentIndex == 1{
            BMRTotal *= 1.375
        }else if SportCon.selectedSegmentIndex == 2{
            BMRTotal *= 1.55
        }else{
            BMRTotal *= 1.725
        }
        let BMRTotalStr:String = NSString(format:"%.2f",BMRTotal) as String
        BMRLab.text = BMRTotalStr
    
        let SWTotal:Double = 52.0+(Double(heiInt)-158.0)*0.5
        let SWTotalStr:String = NSString(format:"%.2f",SWTotal) as String
        StandWeiLab.text = SWTotalStr
    }

//    func checkEnterData(height:String?, weight:String?, age:String?) throws -> String {
        

        
        
//        guard height != "" else {
//            throw EnterError.notHeight
//        }
//        guard weight != "" else{
//            throw EnterError.notWeight
//        }
//        guard age != "" else{
//            throw EnterError.notAge
//        }
//        return "輸入成功"
//    }
    
    func enterAction(){
        var alertMeassage = ""
        var title = "提示訊息"
        
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
        
       
        
//        do{
//           alertMeassage = try checkEnterData(height: heightM, weight: weightM, age: ageM)
//        }
//        catch EnterError.notHeight{
//           alertMeassage="請重新輸入"
//           title="身高輸入有誤"
//        }
//        catch EnterError.notWeight{
//            alertMeassage="請重新輸入"
//            title="體重輸入有誤"
//        }
//        catch EnterError.notAge{
//            alertMeassage="請重新輸入"
//            title="年齡輸入有誤"
//        }
//        catch{
//            alertMeassage="請重新輸入"
//            title="輸入有誤"
//        }

        
        

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
