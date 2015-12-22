//
//  ViewController.swift
//  AWActivityIndicator
//
//  Created by Anthony Williams on 12/20/15.
//  Copyright © 2015 Anthony Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let activity = AWActivityIndicator()

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        button.setTitle("Button", forState: .Normal)
        button.backgroundColor = UIColor.blueColor()
        button.addTarget(self, action: "buttonPressed", forControlEvents: .TouchUpInside)
        view.addSubview(button)
        
//        activity.setActivityBackgroundColor(UIColor.clearColor())
//        activity.setDotColor(UIColor.blackColor())
        activity.setNameOfPath("spiral")
        self.view.addSubview(activity)
    }
    
    func buttonPressed(){
        if activity.isAnimating() == true {
            activity.stopAnimation()
        } else {
            activity.startAnimating()
        }
    }
}