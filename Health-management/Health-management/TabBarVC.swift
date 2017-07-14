//
//  TabBarVC.swift
//  Health-management
//
//  Created by Patrik Laine on 2017/7/10.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {
    
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.yellow], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.green], for: .selected)
        UITabBar.appearance().tintColor = UIColor.green
        self.tabBar.unselectedItemTintColor = UIColor.yellow
        
        self.tabBar.barTintColor = UIColor.black
        

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
