//
//  ViewController.swift
//  AlarmTimerAlertaction
//
//  Created by dit on 2018. 4. 18..
//  Copyright © 2018년 dit2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var myTimer = Timer()
    @IBOutlet weak var timelbl: UILabel!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    @IBOutlet weak var datelbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        datelbl.text = formatter.string(from: myDatePicker.date)
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in self.updateTime()
        })
    }
    
    func updateTime(){
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        timelbl.text = formatter.string(from: date)
        
        if timelbl.text == datelbl.text {
            let myAlret = UIAlertController(title : "알림", message: "알람 시간이 되었습니다.!", preferredStyle: .actionSheet)
            
            let okAction = UIAlertAction(title: "확인", style: .default, handler : {(myaction: UIAlertAction) -> Void in
                self.view.backgroundColor = UIColor.red
            })
            
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler : nil)
        myAlret.addAction(okAction)
        myAlret.addAction(cancelAction)
        present(myAlret, animated: true, completion: nil)
        }
    }
    @IBAction func changeDatePicker(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        datelbl.text = formatter.string(from: myDatePicker.date)
    }
    
    
    
    
}


