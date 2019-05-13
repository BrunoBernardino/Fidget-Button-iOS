//
//  ViewController.swift
//  Fidget Button
//
//  Created by Bruno Bernardino on 11/05/2019.
//  Copyright © 2019 Bruno Bernardino. All rights reserved.
//

import UIKit
import AVFoundation

func startPulseEffect(view: UIView, animationTime: Float) {
    UIView.animate(
        withDuration: TimeInterval(animationTime),
        delay: 0,
        options: [UIView.AnimationOptions.repeat, UIView.AnimationOptions.autoreverse],
        animations: {
            view.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
            view.alpha = 0
        }
    )
}

func shrinkEffect(view: UIView, animationTime: Float) {
    UIView.animate(
        withDuration: TimeInterval(animationTime),
        animations: {
            view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    )
}

func restoreEffect(view: UIView, animationTime: Float) {
    UIView.animate(
        withDuration: TimeInterval(animationTime),
        animations: {
            view.transform = CGAffineTransform(scaleX: 1, y: 1)
            view.alpha = 1
        }
    )
}

class ViewController: UIViewController {
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var outerCircle: Circle!
    
    let vibrationGenerator = UIImpactFeedbackGenerator(style: .heavy)
    // Check more sounds at https://github.com/TUNER88/iOSSystemSoundsLibrary
    let systemSoundID: SystemSoundID = 1114
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.sendSubviewToBack(self.outerCircle)
        self.outerCircle.isHidden = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func startTouch(_ sender: Any) {
        vibrationGenerator.impactOccurred()
        AudioServicesPlaySystemSound(systemSoundID)

        shrinkEffect(view: self.mainButton, animationTime: 0.2)
        startPulseEffect(view: self.outerCircle, animationTime: 0.5)
        self.outerCircle.isHidden = false
    }
    
    @IBAction func finishTouch(_ sender: Any) {
        vibrationGenerator.impactOccurred()
        AudioServicesPlaySystemSound(systemSoundID)
        
        restoreEffect(view: self.mainButton, animationTime: 0.1)
        restoreEffect(view: self.outerCircle, animationTime: 0.1)
        self.outerCircle.isHidden = true
    }
}

