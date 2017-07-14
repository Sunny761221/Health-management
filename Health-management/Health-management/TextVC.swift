//
//  TextVC.swift
//  Health-management
//
//  Created by Patrik Laine on 2017/7/14.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class TextVC: UIViewController {

    @IBOutlet var productTextField: UITextField!
    
    
    @IBOutlet var detailTextView: UITextView!
    
    var productName = ""
    
    let 慢走 = "消耗熱量METs:3.5"
    let 快走 = "消耗熱量METs:5.5"
    let 下樓梯 = "消耗熱量METs3.2"
    let 上樓梯 = "消耗熱量METs8.4"
    let 慢跑 = "(8公里/時)消耗熱量METs8.2"
    let 快跑 = "(12公里/時)消耗熱量METs12.7，(16公里/時)消耗熱量METs16.8"
    let 腳踏車 = "一般速度(10公里/時)：消耗熱量METs4，快速(20公里/時)：消耗熱量METs8.4，很快(30公里/時)：消耗熱量METs12.6"
    let 拖地 = "消耗熱量METs3.7"
    let 園藝 = "消耗熱量METs4.2"
    let 製造或修理 = "(例：水電工)消耗熱量METs5.3"
    let 農林漁牧 = "消耗熱量METs7.4"
    let 搬運重物 = "消耗熱量METs8.4"
    let 排球 = "消耗熱量METs3.6"
    let 保齡球 = "消耗熱量METs3.6"
    let 乒乓球 = "消耗熱量METs4.2"
    let 棒壘球 = "消耗熱量METs4.7"
    let 羽毛球 = "消耗熱量METs5.1"
    let 籃球 = "半場：消耗熱量METs6.3，全場：消耗熱量METs8.3"
    let 網球 = "消耗熱量METs6.6"
    let 足球 = "消耗熱量METs7.7"
    let 高爾夫球 = "消耗熱量METs3.7"
    let 瑜珈 = "消耗熱量METs3"
    let 跳舞 = "慢(如元極舞)：消耗熱量METs3.1，快(如國標舞)：消耗熱量METs5.3"
    let 飛盤 = "消耗熱量METs3.2"
    let 太極拳 = "消耗熱量METs4.2"
    let 溜直排輪 = "消耗熱量METs5.1"
    let 游泳 = "慢：消耗熱量METs6.3，較快：消耗熱量METs10"
    let 有氧舞蹈 = "消耗熱量METs6.8"
    let 跳繩 = "慢：消耗熱量METs8.4，快：消耗熱量METs12.6"
    let 健康操 = "消耗熱量METs4"
    let 划獨木舟 = "消耗熱量METs3.4"
    let 溜輪鞋 = "消耗熱量METs5.1"
    let 騎馬 = "消耗熱量METs5.1"
    let 溜冰刀 = "消耗熱量METs5.9"
    let 爬岩 = "(35公尺/時)消耗熱量METs7"
    let 滑雪 = "(16公里/時)消耗熱量METs7.2"
    let 拳擊 = "消耗熱量METs11.4"
    let 划船比賽 = "消耗熱量METs12.4"
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        productTextField.text = productName
        if productName == "慢走" {
            detailTextView.text = 慢走
        }else if productName == "快走"{
            detailTextView.text = 快走
        }else if productName == "下樓梯"{
            detailTextView.text = 下樓梯
        }else if productName == "上樓梯"{
            detailTextView.text = 上樓梯
        }else if productName == "慢跑"{
            detailTextView.text = 慢跑
        }else if productName == "快跑"{
            detailTextView.text = 快跑
        }else if productName == "腳踏車"{
            detailTextView.text = 腳踏車
        }else if productName == "拖地"{
            detailTextView.text = 拖地
        }else if productName == "園藝"{
            detailTextView.text = 園藝
        }else if productName == "製造或修理"{
            detailTextView.text = 製造或修理
        }else if productName == "農林漁牧"{
            detailTextView.text = 農林漁牧
        }else if productName == "搬運重物"{
            detailTextView.text = 搬運重物
        }else if productName == "排球"{
            detailTextView.text = 排球
        }else if productName == "保齡球"{
            detailTextView.text = 保齡球
        }else if productName == "乒乓球"{
            detailTextView.text = 乒乓球
        }else if productName == "棒壘球"{
            detailTextView.text = 棒壘球
        }else if productName == "羽毛球"{
            detailTextView.text = 羽毛球
        }else if productName == "籃球"{
            detailTextView.text = 籃球
        }else if productName == "網球"{
            detailTextView.text = 網球
        }else if productName == "足球"{
            detailTextView.text = 足球
        }else if productName == "高爾夫球"{
            detailTextView.text = 高爾夫球
        }else if productName == "瑜珈"{
            detailTextView.text = 瑜珈
        }else if productName == "跳舞"{
            detailTextView.text = 跳舞
        }else if productName == "飛盤"{
            detailTextView.text = 飛盤
        }else if productName == "太極拳"{
            detailTextView.text = 太極拳
        }else if productName == "溜直排輪"{
            detailTextView.text = 溜直排輪
        }else if productName == "游泳"{
            detailTextView.text = 游泳
        }else if productName == "有氧舞蹈"{
            detailTextView.text = 有氧舞蹈
        }else if productName == "跳繩"{
            detailTextView.text = 跳繩
        }else if productName == "健康操"{
            detailTextView.text = 健康操
        }else if productName == "划獨木舟"{
            detailTextView.text = 划獨木舟
        }else if productName == "溜輪鞋"{
            detailTextView.text = 溜輪鞋
        }else if productName == "騎馬"{
            detailTextView.text = 騎馬
        }else if productName == "溜冰刀"{
            detailTextView.text = 溜冰刀
        }else if productName == "爬岩"{
            detailTextView.text = 爬岩
        }else if productName == "滑雪"{
            detailTextView.text = 滑雪
        }else if productName == "拳擊"{
            detailTextView.text = 拳擊
        }else if productName == "划船比賽"{
            detailTextView.text = 划船比賽
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
