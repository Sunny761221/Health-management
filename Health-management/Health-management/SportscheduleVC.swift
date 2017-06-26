//
//  WomanVC.swift
//  Health-management
//
//  Created by ios135 on 2017/5/31.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class SportscheduleVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {

    var datas:Array<String> = []
    var data:String = ""
    @IBOutlet weak var spciesView: UITableView!
    
    @IBOutlet weak var sporttext: UITextField!
    @IBAction func addBtn(_ sender: UIButton) {
        self.datas.append(sporttext.text!)
        self.spciesView.reloadData()
        sporttext.text!=self.data

        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let Label1:UILabel = cell.contentView.subviews[0] as! UILabel
        Label1.text=self.datas[indexPath.row]

        return  cell
    }
    
    // 顯示表格標題
    func tableView(_ tableView: UITableView, titleForHeaderInSection section:
        Int) -> String?{
        return "運動項目";
    }
    // 顯示表格結尾
    func tableView(_ tableView: UITableView, titleForFooterInSection section:
        Int) -> String?{
        return "尾";
    }
    override func viewDidLoad() {
        super.viewDidLoad()

         self.sporttext.delegate=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "inVC1") as! inVC
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    
    }
  
    
}
