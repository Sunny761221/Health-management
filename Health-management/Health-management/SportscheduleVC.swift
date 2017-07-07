//
//  WomanVC.swift
//  Health-management
//
//  Created by ios135 on 2017/5/31.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class SportscheduleVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {
    
    var preIndex:Int=0
    var datas:Array<String> = []
    var data:String = ""
    
    @IBOutlet weak var spciesView: UITableView!
    @IBOutlet weak var sporttext: UITextField!

    @IBAction func addBtn(_ sender: UIButton) {
        let manager = FileManager.default
        let getFolderName = String(self.preIndex)+"_.txt"
        var names = sporttext.text
//判斷sporttext是否有輸入
        if names == ""{
            enterAction()
            return
        }else{
            for name in datas{
                names = names! + "," + name
            }
        }
//設url,資料路徑
        let dirName = documentsPath().appendingPathComponent(getFolderName)
        print("dirName = \(dirName)")
//寫入資料成.txt檔
        do{
            try names?.write(to: dirName, atomically: false, encoding: .utf8)
            print("Yes2")
        }catch{
            
            print("NO2")
        }
//判斷sporttext是否有輸入
        var nameFolder = sporttext.text
        if nameFolder == ""{
            enterAction()
            return
        }else{
            nameFolder = sporttext.text
        }
//設url,資料路徑
        let dirname = documentsPath().appendingPathComponent(nameFolder!)
//創建新資料夾
        do{
            try manager.createDirectory(at: dirname, withIntermediateDirectories: true, attributes: nil)
            print("Yes1")
        }catch{
            
            print("NO1")
        }

        self.datas.append(sporttext.text!)
        self.spciesView.reloadData()
        sporttext.text!=self.data

    }
    
//設url
    func documentsPath() -> URL {
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask,appropriateFor: nil, create: false)
        print(documentDirectory)
        return documentDirectory
    }
//設定段落
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
//顯示警告視窗
    func enterAction(){
        var alertMeassage = ""
        let title = "提示訊息"
        let sport = sporttext.text

        if sport == ""{
            alertMeassage="不能輸入空白,請輸入名稱"
        }
//設定警告視窗內容
        let alertController = UIAlertController(title: title, message: alertMeassage, preferredStyle: UIAlertControllerStyle.alert)
//設定警告視窗的按鈕
        let okAction = UIAlertAction(
            title: "確認",
            style: .default,
            handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sporttext.delegate=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
//將keyboard向下收起
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
//選擇Cell進入下個視窗
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "inVC1") as! inVC
        
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        loadData()
    }
    
    func loadData(){
        let Fm = FileManager.default
        let docsurl = try! Fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let getFolderName = String(self.preIndex)+"_.txt"
        
        let dirName = docsurl.appendingPathComponent(getFolderName)
        print("dirName = \(dirName)")
        do{
            let Names = try String(contentsOf: dirName)
            datas = Names.components(separatedBy: ",")
            print("Yes3")
        }catch{
            //            datas=[]
            print("NO3")
        }
        
    }
    
}
