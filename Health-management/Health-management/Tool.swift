//
//  Tool.swift
//  Health-management
//
//  Created by ios on 2017/6/9.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class Tool: NSObject {
    
    
    class func countBMI(height:Int,weight:Int,age:Int)->String{
        let BMITotal:Double = (Double(weight)/Double(height*height))*10000.0
        let BMITotalStr:String = NSString(format:"%.2f",BMITotal) as String
        return BMITotalStr
    }
    
    class func ManCalSW(height:Int)->String{
        let SWTotal:Double = 62.0+(Double(height)-170.0)*0.6
        let SWTotalStr:String = NSString(format:"%.2f",SWTotal) as String
        return SWTotalStr
    }

    class func WomanCalSW(height:Int)->String{
        let SWTotal:Double = 52.0+(Double(height)-158.0)*0.5
        let SWTotalStr:String = NSString(format:"%.2f",SWTotal) as String
        return SWTotalStr
    }
    
}
