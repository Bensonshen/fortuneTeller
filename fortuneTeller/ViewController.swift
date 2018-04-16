//
//  ViewController.swift
//  fortuneTeller
//
//  Created by BensonShen on 2018/4/7.
//  Copyright © 2018年 BensonShen. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox
class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool{ //hidden the state bar
        return true
    }
    
    @IBOutlet weak var yourFortune: UIImageView!
    @IBAction func tellMeSomething(_ sender: UIButton) {
        showAnswer()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == .motionShake{
            showAnswer()
        }
    }
    
    
    func showAnswer(){
        //1.make a random rumber
        if yourFortune.isHidden == true{
        let answer = GKRandomSource.sharedRandom().nextInt(upperBound: 6)+1
        //2.change image
        yourFortune.image = UIImage(named: "\(answer)")
        yourFortune.isHidden = false
        //3.voice
        AudioServicesPlaySystemSound(1000)
        }else{
            yourFortune.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

