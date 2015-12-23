//
//  AWActivityIndicator.swift
//  AWActivityIndicator
//
//  Created by Anthony Williams on 12/20/15.
//  Copyright © 2015 Anthony Williams. All rights reserved.
//

import UIKit

class AWActivityIndicator: UIView {
    
    // Creating the layer constants and Animation
    let r = CAReplicatorLayer()
    let dot = CALayer()
    let move = CAKeyframeAnimation(keyPath: "position")
    
    // Default Values
    var animating = false
    var pathName = "diamond"
    var defaultActivityBackgroundColor = UIColor(white: 0.0, alpha: 0.75).CGColor
    var defaultDotColor = UIColor(red: 25/255, green: 209/255, blue: 163/255, alpha: 1).CGColor
    
    // MARK: Animations
    
    // This function is called to create the animation of the activity indicator
    func animation(){
        r.bounds = CGRect(x: 0, y: 0, width: 120, height: 120)
        r.backgroundColor = defaultActivityBackgroundColor
        r.position = superview!.center
        superview!.layer.addSublayer(r)
        
        dot.bounds = CGRect(x: 0, y: 0, width: 7, height: 7)
        dot.backgroundColor = defaultDotColor
        dot.cornerRadius = 5.0
        dot.shouldRasterize = true
        dot.rasterizationScale = UIScreen.mainScreen().scale
        r.addSublayer(dot)
        
        setPath(pathName)
        move.repeatCount = Float.infinity
        dot.addAnimation(move, forKey: nil)
        
        r.instanceCount = 20
        r.instanceDelay = 0.15
    }
    
    // MARK: Paths
    
    func diamondPath() -> CGPath {
        let diamond = UIBezierPath()
        diamond.moveToPoint(CGPointMake(20,35))
        diamond.addLineToPoint(CGPointMake(2,18))
        diamond.addLineToPoint(CGPointMake(10,5))
        diamond.addLineToPoint(CGPointMake(30,5))
        diamond.addLineToPoint(CGPointMake(38,18))
        diamond.addLineToPoint(CGPointMake(20,35))
        diamond.closePath()
        
        var t = CGAffineTransformMakeScale(3, 3)
        return CGPathCreateCopyByTransformingPath(diamond.CGPath, &t)!
    }
    
    func starPath() -> CGPath {
        let star = UIBezierPath()
        star.moveToPoint(CGPointMake(60,5))
        star.addLineToPoint(CGPointMake(75,45))
        star.addLineToPoint(CGPointMake(115,45))
        star.addLineToPoint(CGPointMake(75,70))
        star.addLineToPoint(CGPointMake(100,115))
        star.addLineToPoint(CGPointMake(60,85))
        star.addLineToPoint(CGPointMake(20,115))
        star.addLineToPoint(CGPointMake(45,70))
        star.addLineToPoint(CGPointMake(5,45))
        star.addLineToPoint(CGPointMake(45,45))
        star.closePath()
        
        return CGPathCreateCopy(star.CGPath)!
    }
    
    func arrowPath() -> CGPath {
        let arrow = UIBezierPath()
        arrow.moveToPoint(CGPointMake(60,5))
        arrow.addLineToPoint(CGPointMake(100,55))
        arrow.addLineToPoint(CGPointMake(75,55))
        arrow.addLineToPoint(CGPointMake(75,115))
        arrow.addLineToPoint(CGPointMake(45,115))
        arrow.addLineToPoint(CGPointMake(45,55))
        arrow.addLineToPoint(CGPointMake(20,55))
        arrow.closePath()
        
        return CGPathCreateCopy(arrow.CGPath)!
    }
    
    // MARK: Actions
    func setNameOfPath(name: String){
        if name == "star" || name == "arrow" {
            self.pathName = name
        } else {
            self.pathName = "diamond"
        }
    }
    
    func startAnimating(){
        animation()
        animating = true
    }
    
    func stopAnimation(){
        r.removeFromSuperlayer()
        animating = false
    }
    
    func isAnimating() -> Bool {
        return animating
    }
    
    private func setPath(pathName: String){
        if pathName == "star" {
            move.path = starPath()
            move.duration = 4.5
        } else if pathName == "arrow" {
            move.path = arrowPath()
            move.duration = 4.0
        } else {
            move.path = diamondPath()
            move.duration = 3.5
        }
    }
    
    // MARK: Customizable
    func setActivityBackgroundColor(color: UIColor){
        defaultActivityBackgroundColor = color.CGColor
    }
    
    func setDotColor(color: UIColor){
        defaultDotColor = color.CGColor
    }
}