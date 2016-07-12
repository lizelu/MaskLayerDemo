//
//  MaskLabelViewController.swift
//  CECustomeSegmentControl
//
//  Created by Mr.LuDashi on 16/7/12.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

import UIKit

class MaskLabelViewController: UIViewController {
    
    var backgroundLabel: UILabel!
    var beforeLabel: UILabel!
    
    var maskLayer: CALayer!
    var maskImage: UIImage!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createBackgoundLabel()
        self.createBeforeLabel()
        self.addMask()
    }
    
    func createBackgoundLabel() {
        backgroundLabel = UILabel.init(frame: getLableFrame())
        self.addLabel(backgroundLabel, textColor: UIColor.greenColor())
    }
    
    func createBeforeLabel() {
        beforeLabel = UILabel.init(frame: getLableFrame())
        self.addLabel(beforeLabel, textColor: UIColor.redColor())
    }
    
    func addLabel(label: UILabel, textColor: UIColor) {
        label.font = UIFont.boldSystemFontOfSize(50)
        label.textColor = textColor
        label.text = "Hello Word"
        self.view.addSubview(label)
    }
    
    func addMask() {
        maskLayer = CALayer()
        maskLayer.frame = CGRectMake(0, 0, 100, 50)
        maskLayer.cornerRadius = 25
        maskLayer.backgroundColor = UIColor.blackColor().CGColor
        self.beforeLabel.layer.mask = maskLayer
    }
    
    func getLableFrame() -> CGRect {
        return CGRectMake(20, 100, 300, 50)
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touche in touches {
            CATransaction.setDisableActions(true)
            let movePoint = touche.locationInView(self.beforeLabel)
            var frame = maskLayer.frame
            frame.origin.x = movePoint.x
            maskLayer?.frame = frame
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
