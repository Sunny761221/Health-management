//
//  inVC.swift
//  Health-management
//
//  Created by Root HSZ HSU on 2017/6/22.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class inVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {
    
    var preIndex:Int=1
    var preAry:Array<String>=[]
    var datas:Array<String>=[]
    var data:String=""
    @IBOutlet weak var numView: UITableView!
    
    @IBAction func storeBtn(_ sender: UIButton) {

     //nameData write to file
        let fm = FileManager.default
        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let fileName = "1_.txt"
        
        let folderName = preAry[self.preIndex]
        let folderurl = docsurl.appendingPathComponent(folderName)
        
        let myurl = folderurl.appendingPathComponent(fileName)
        print("myurl = \(myurl)")
    
        var names=numText.text
        if names==""{
          enterAction()
          return
        }else{
          for name in datas{
              names = names! + "," + name
          }
        }

        do {
            try names?.write(to: myurl, atomically: false, encoding: .utf8)
            print("OK1")
        }catch{
            print(" error1 ")
        }

        self.datas.append(numText.text!)
        self.numView.reloadData()
        numText.text!=self.data
        
    }
    
    @IBOutlet weak var numText: UITextField!
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let label1:UILabel = cell.contentView.subviews[0] as! UILabel
        
        label1.text=self.datas[indexPath.row]
        return cell
    }
//消除表格
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
           datas.remove(at: indexPath.row)
           tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func enterAction(){
        var alertMeassage = ""
        let title = "提示訊息"
        
        let sport = numText.text
        
        
        if sport == ""{
            alertMeassage="不能輸入空白,請輸入名稱"
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

        self.numText.delegate=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // 顯示表格標題
    func tableView(_ tableView: UITableView, titleForHeaderInSection section:
        Int) -> String?{
        return "運動";
    }
    // 顯示表格結尾
    func tableView(_ tableView: UITableView, titleForFooterInSection section:
        Int) -> String?{
        return "尾";
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func viewWillAppear(_ animated: Bool) {
    // read file to nameData
    // tableview reload dat
        loadData()
    }
    
    func loadData(){
        let fm = FileManager.default
        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let fileName = "1_.txt"
        
        let folderName = preAry[self.preIndex]
        let folderurl = docsurl.appendingPathComponent(folderName)
        
        let myurl = folderurl.appendingPathComponent(fileName)
        print("myurl = \(myurl)")

        do {
            let Names=try String(contentsOf: myurl)
            datas = Names.components(separatedBy: ",")
            print("OK2")
        }catch{
            print(" error2 ")
        }

    }
    
}
