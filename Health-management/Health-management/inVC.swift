//
//  inVC.swift
//  Health-management
//
//  Created by Root HSZ HSU on 2017/6/22.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class inVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {
    
    var preIndex:Int=0
    var datas:Array<String>=[]
    var data:String=""
    @IBOutlet weak var numView: UITableView!
    
    @IBAction func storeBtn(_ sender: UIButton) {
        self.datas.append(numText.text!)
        self.numView.reloadData()
        numText.text!=self.data

        
    }
    
    @IBOutlet weak var numText: UITextField!
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
         // nameData write to file
        
        
        let fm = FileManager.default
        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let fileName = String(self.preIndex)+"_.txt"
        
        let myurl = docsurl.appendingPathComponent(fileName)
        print("myurl = \(myurl)")
        var names=""
        for name in datas{
            names = names + "," + name
        }
        do {
            
            try names.write(to: myurl, atomically: false, encoding: .utf8)
        }catch{
            print(" error ")
        }

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
        
        // tableview reload data
        
        
        print(self.preIndex)
        
        let fm = FileManager.default
        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let fileName = String(self.preIndex)+"_.txt"
        
        let myurl = docsurl.appendingPathComponent(fileName)
        print("myurl = \(myurl)")
        
        
        
        do {
            let names=try String(contentsOf: myurl)
            
            datas = names.components(separatedBy: ",")
            
            //            try nameData=String(contentsOf: myurl)
            //                .write(to: myurl, atomically: false, encoding: .utf8)
        }catch{
            datas=[]
            print(" error ")
        }

        
        
        
    }
}
