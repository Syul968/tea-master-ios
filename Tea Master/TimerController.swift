//
//  ViewController.swift
//  Tea Master
//
//  Created by Luis Flores on 4/10/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import UIKit

class TimerController: UIViewController {
    @IBOutlet weak var timerPicker: UIPickerView!
    @IBOutlet weak var timerButton: UIButton!
    @IBOutlet weak var minsLabel: UILabel!
    @IBOutlet weak var secsLabel: UILabel!
    @IBOutlet weak var timerLabel: UIStackView!
    
    var mins: Int = 0
    var secs: Int = 0
    var timer = Timer()
    var timerSecs: Int = 0
    var timerActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerPicker.delegate = self
        timerPicker.dataSource = self
    }
    
    @objc func updateTimer() {
        timerSecs -= 1
        minsLabel.text = NSString(format: "%02i", timerSecs / 60) as String
        secsLabel.text = NSString(format: "%02i", timerSecs % 60) as String
        
        if(timerSecs == 0) {
            timer.invalidate()
            toggleTimer(self)
            
            let alert = UIAlertController(title: "Tea is ready", message: "Your tea is ready! Don't let it get bitter.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimerController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @IBAction func toggleTimer(_ sender: Any) {
        if(!timerActive) {
            timerSecs = mins * 60 + secs
            timerActive = true
            
            timerPicker.isHidden = true
            minsLabel.text = NSString(format: "%02i", mins) as String
            secsLabel.text = NSString(format: "%02i", secs) as String
            timerLabel.isHidden = false
            
            runTimer()
            timerButton.setTitle("Cancel", for: .normal)
            timerButton.setTitleColor(.red, for: .normal)
        } else {
            timer.invalidate()
            timerActive = false
            
            timerLabel.isHidden = true
            timerPicker.isHidden = false
            timerButton.setTitle("Start", for: .normal)
            timerButton.setTitleColor(UIColor(hex: 0x74B24B), for: .normal)
        }
    }
}

extension TimerController: UIPickerViewDelegate, UIPickerViewDataSource {
    public func numberOfComponents(in _pickerView: UIPickerView) -> Int {
        return 4
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
            case 0:
                return 16
            case 1:
                return 1
            case 2:
                return 12
            case 3:
                return 1
            default:
                return 0
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
            case 0:
                return "\(row)"
            case 1:
                return "min"
            case 2:
                return "\(row * 5)"
            case 3:
                return "sec"
            default:
                return ""
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
            case 0:
                self.mins = row
            case 2:
                self.secs = row * 5
            default:
                break
        }
    }
}
