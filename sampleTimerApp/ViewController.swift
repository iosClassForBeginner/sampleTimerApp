//
//  ViewController.swift
//  sampleTimerApp
//
//  Created by Wataru Maeda on 5/7/16.
//  Copyright © 2016 wataru maeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var count = 0
    var second = 0
    var milliSecond = 0
    var timer: NSTimer?
    @IBOutlet var timerLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func updateTimerLabel()
    {
        count += 1
        
        // ミリ秒
        milliSecond += 1
        if milliSecond == 10 {
            milliSecond = 0
        }
        
        // 秒
        second = count / 10
        
        // 0埋め
        let mSec = String(format: "%02d", milliSecond)
        let sec =  String(format: "%02d", second)
        
        
        // タイマー表示
        self.timerLabel!.text = sec + ":" + mSec
    }
    
    @IBAction func startTimer(sender: AnyObject)
    {
        timer = nil
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateTimerLabel", userInfo: nil, repeats: true)
    }

    @IBAction func stopTimer(sender: AnyObject)
    {
        timer?.invalidate()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

