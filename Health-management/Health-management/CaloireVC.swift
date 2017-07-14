//
//  CaloireVC.swift
//  Health-management
//
//  Created by Patrik Laine on 2017/7/14.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class CaloireVC: UITableViewController {

    var Section = ["走路","爬樓梯","跑步",
                   "腳踏車",
                   "家事",
                   "工作",
                   "球類運動",
                   "其他運動"]
    let item = [[
        "慢走",
        "快走"
        ],[
            "下樓梯",
            "上樓梯"
        ],[
            "慢跑",
            "快跑"
        ],[
            "腳踏車",
            ],[
                "拖地",
                "園藝"
        ],[
            "製造或修理",
            "農林漁牧",
            "搬運重物"
        ],[
            "排球",
            "保齡球",
            "乒乓球",
            "棒壘球",
            "羽毛球",
            "籃球",
            "網球",
            "足球",
            "高爾夫球",
            ],[
                "瑜珈",
                "跳舞",
                "飛盤",
                "太極拳",
                "溜直排輪",
                "游泳",
                "有氧舞蹈",
                "跳繩",
                "健康操",
                "划獨木舟",
                "溜輪鞋",
                "騎馬",
                "溜冰刀",
                "爬岩",
                "滑雪",
                "拳擊",
                "划船比賽"
        ]]
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let rect=CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.width)
        
        let headerView: UIView = UIView(frame: rect)
        headerView.backgroundColor = UIColor(red: 186/255, green: 254/255, blue: 188/255, alpha: 1)
        let titleText: UILabel = UILabel(frame: CGRect(x: 10, y: 3, width:tableView.bounds.size.width - 20, height: 18))
        titleText.textColor = UIColor.black
        titleText.text = self.Section[section]
        headerView.addSubview(titleText)
        return headerView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorColor = UIColor(red: 119/255, green: 252/255, blue: 52/255, alpha: 1)
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        
        return self.Section [section ]
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.Section.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return self.item [section ].count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = self.item[indexPath.section][indexPath.row]
        
        cell.selectedBackgroundView = UIView()
        cell.selectedBackgroundView?.backgroundColor =
            UIColor(red: 63/255, green: 235/255, blue: 133/255, alpha: 1)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showRecord" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let TextVC = segue.destination as!TextVC
                TextVC.productName = self.item[indexPath.section][indexPath.row]
                
            }
        }
        
    }
    
    
    
}
