//
//  caloireVC.swift
//  Health-management
//
//  Created by 孫士凱 on 2017/6/30.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class caloireVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var nav : UINavigationBar!
    var navItem : UINavigationItem!
    
    var myTableView: UITableView!
    
    var Sports: [String] = ["走路","爬樓梯","跑步",
                            "騎腳踏車",
                            "家事",
                            "工作",
                            "球類運動",
                            "其他運動"]
    
    var Walk: [String] = [
        "慢走消耗熱量METs3.5",
        "快走消耗熱量METs5.5"
    ]
    var ClimbingＳtairs: [String] = [
        "下樓梯消耗熱量METs3.2",
        "上樓梯消耗熱量METs8.4"
    ]
    var Jog: [String] = [
        "慢跑(8公里/時)消耗熱量METs8.2",
        "快跑(12公里/時)消耗熱量METs12.7",
        "快跑(16公里/時)消耗熱量METs16.8"
    ]
    var bicycle: [String] = [
        "一般(10公里/時)消耗熱量METs4",
        "快(20公里/時)消耗熱量METs8.4",
        "很快(30公里/時)消耗熱量METs12.6"
    ]
    var housework: [String] = [
        "拖地消耗熱量METs3.7",
        "園藝消耗熱量METs4.2"
    ]
    var work: [String] = [
        "製造或修理(如水電工)消耗熱量METs5.3",
        "耕種、牧場、漁業消耗熱量METs7.4",
        "搬運重物消耗熱量METs8.4"
    ]
    var BallSports: [String] = [
        "排球消耗熱量METs3.6",
        "保齡球消耗熱量METs3.6",
        "乒乓球消耗熱量METs4.2",
        "棒壘球消耗熱量METs4.7",
        "高爾夫消耗熱量METs5",
        "羽毛球消耗熱量METs5.1",
        "籃球(半場)消耗熱量METs6.3",
        "籃球(全場)消耗熱量METs8.3",
        "網球消耗熱量METs6.6",
        "足球消耗熱量METs7.7",
        "高爾夫球消耗熱量METs3.7",
        "保齡球消耗熱量METs3.7"
    ]
    var other: [String] = [
        "瑜珈消耗熱量METs3",
        "跳舞(慢)、元極舞消耗熱量METs3.1",
        "跳舞(快)、國標舞消耗熱量METs5.3",
        "飛盤消耗熱量METs3.2",
        "太極拳消耗熱量METs4.2",
        "高爾夫消耗熱量METs5",
        "溜直排輪消耗熱量METs5.1",
        "游泳(慢)消耗熱量METs6.3",
        "游泳(較快)消耗熱量METs10",
        "有氧舞蹈消耗熱量METs6.8",
        "跳繩(慢)消耗熱量METs8.4",
        "跳繩(快)消耗熱量METs12.6",
        "健康操消耗熱量METs4",
        "划獨木舟消耗熱量METs3.4",
        "溜輪鞋消耗熱量METs5.1",
        "騎馬(小跑)消耗熱量METs5.1",
        "溜冰刀(16公里/時)消耗熱量METs5.9",
        "爬岩(35公尺/時)消耗熱量METs7",
        "滑雪(16公里/時)消耗熱量METs7.2",
        "拳擊消耗熱量METs11.4",
        "划船比賽消耗熱量METs12.4"
    ]
    
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sports.count
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return Walk.count
        case 1:
            return ClimbingＳtairs.count
        case 2:
            return Jog.count
        case 3:
            return bicycle.count
        case 4:
            return housework.count
        case 5:
            return work.count
        case 6:
            return BallSports.count
        case 7:
            return other.count
        default:
            break
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.default,reuseIdentifier:"cell")
        
        
        var str: String!
        switch indexPath.section {
        case 0:
            str = Walk[indexPath.row]
        case 1:
            str = ClimbingＳtairs[indexPath.row]
        case 2:
            str = Jog[indexPath.row]
        case 3:
            str = bicycle[indexPath.row]
        case 4:
            str = housework[indexPath.row]
        case 5:
            str = work[indexPath.row]
        case 6:
            str = BallSports[indexPath.row]
        case 7:
            str = other[indexPath.row]
            
        default:
            break
            
        }
        let imgStr="img_"+String(indexPath.section)+"_"+String(indexPath.row)
        
        cell.textLabel?.text = str
        cell.imageView?.image=UIImage(named:imgStr)
        cell.selectedBackgroundView = UIView()
        cell.selectedBackgroundView?.backgroundColor = UIColor(red: 186/255, green: 254/255, blue: 188/255, alpha: 1)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let rect=CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.width)
        
        let headerView: UIView = UIView(frame: rect)
        headerView.backgroundColor = UIColor(red: 63/255, green: 235/255, blue: 133/255, alpha: 1)
        
        let titleText: UILabel = UILabel(frame: CGRect(x: 10, y: 3, width:tableView.bounds.size.width - 20, height: 18))
        titleText.textColor = UIColor.black
        titleText.text = Sports[section]
        headerView.addSubview(titleText)
        
        return headerView
        
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return Sports
        
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Sports[section]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var rect=UIScreen.main.bounds
        rect.origin.y=65
        
        myTableView=UITableView(frame: rect, style: UITableViewStyle.plain)
        myTableView.dataSource=self
        myTableView.delegate=self
        myTableView.sectionIndexBackgroundColor = UIColor(red: 55/255, green: 186/255, blue: 89/255, alpha: 1)
        myTableView.sectionIndexColor = UIColor.black
        self.view.addSubview(myTableView)
        
        
        rect.size.height -= 64
        
        rect.origin.y += 64
        
        print(rect)
        
        var spaceView: UIView = UIView(frame: CGRect(x:0, y:0 ,width:320, height:20))
        
        spaceView.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        
        self.view.addSubview(spaceView)
        
        
        nav = UINavigationBar(frame: CGRect(x:0, y:20, width:370, height:44))
        
        self.view.addSubview(nav)
        
        navItem = UINavigationItem(title: "METs(能量消耗)＝(km/hr)×體重(kg)")
        
        nav.pushItem(navItem, animated: true)
        
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
