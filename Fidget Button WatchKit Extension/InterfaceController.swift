//
//  InterfaceController.swift
//  Fidget Button WatchKit Extension
//
//  Created by Bruno Bernardino on 11/05/2019.
//  Copyright © 2019 Bruno Bernardino. All rights reserved.
//

import WatchKit
import Foundation

extension WKInterfaceController {
    func animate(withDuration duration: TimeInterval,
                 animations: @escaping () -> Swift.Void,
                 completion: @escaping () -> Swift.Void) {
        
        let queue = DispatchGroup()
        queue.enter()
        
        let action = {
            animations()
            queue.leave()
        }
        
        self.animate(withDuration: duration, animations: action)
        
        queue.notify(queue: .main, execute: completion)
    }
}


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var mainButton: WKInterfaceButton!
    @IBOutlet weak var mainGroup: WKInterfaceGroup!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view con1troller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func touchButton() {
        WKInterfaceDevice.current().play(WKHapticType.success)
        
        // self.mainGroup.stopAnimating()

        let duration = TimeInterval(0.2)

        self.animate(
            withDuration: duration,
            animations: {
                self.mainGroup.setWidth(140)
                self.mainGroup.setHeight(140)
                self.mainGroup.setCornerRadius(70)
                self.mainGroup.setAlpha(0.8)
            },
            completion: {
                self.mainGroup.setWidth(120)
                self.mainGroup.setHeight(120)
                self.mainGroup.setCornerRadius(60)
                self.mainGroup.setAlpha(1)
            }
        )
    }
}
