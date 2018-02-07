//
//  ViewController.swift
//  StopWatch
////
//  Created by 小西夏穂 on 2017/09/06.
//  Copyright © 2017年 小西夏穂. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    //判定ラベル
    @IBOutlet var hanteiLabel: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func start() {
        if !timer.isValid {
            //タイマーが動作していなかったら動かす
            timer = Timer.scheduledTimer(
                timeInterval: 0.01,
                target: self,
                selector: #selector(self.up),
                userInfo: nil,
                repeats: true
            )
        }
        hanteiLabel.text = ""
    }
    
    @IBAction func stop() {
        if timer.isValid {
            //タイマーが動作していたら停止する
            timer.invalidate()
            //hanteiメソッドの呼び出し、結果を表示する
        }
        self.hantei()
    }
    
    func hantei() {
        
        if count > 9.80 && count < 10.20 {   //もし経過時間が9.8秒〜10.2秒だったら
            hanteiLabel.text = "PERFECT!"   //PERFECT!と表示
        }else if count > 9.70 && count < 10.30 {
            hanteiLabel.text = "GREAT!"
        }else if count > 9.50 && count < 10.50 {
            hanteiLabel.text = "GOOD!"
        }else {
            hanteiLabel.text = "BAD"
        }
        
    }
    
    
    func up() {
        //countを0.01(時間経過分)足す
        count = count + 0.01
        //ラベルに小数点以下２桁まで表示
        label.text = String(format: "%.2f", count)
    }
    
    
    
    @IBAction func clear() {
        if timer.isValid {
            //タイマーが動作していたら停止する
            timer.invalidate()
        }
        //カウントを0.0に初期化する
        count = 0.0
        
        //初期化したcountをlabelに表示させる
        label.text = String(format: "%.2f", count)
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
