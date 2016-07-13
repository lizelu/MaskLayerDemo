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
    
    var segmentControl: CESegmentControl!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createBackgoundLabel()
        self.createBeforeLabel()
        self.addMask()
        
        self.addCustomeSegmentControl()
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
        label.textAlignment = .Center
        self.view.addSubview(label)
    }
    
    func addMask() {
        maskLayer = CALayer()
        maskLayer.frame = CGRectMake(0, 0, 100, 50)
        maskLayer.cornerRadius = 25
        maskLayer.backgroundColor = UIColor.blackColor().CGColor
        self.beforeLabel.layer.mask = maskLayer
    }
    
    
    
    func addCustomeSegmentControl() {
        self.segmentControl = CESegmentControl.init(frame: CGRectMake(10, 200, 300, 60))
        self.view.addSubview(segmentControl)
    }
    
    
    
    
    func getLableFrame() -> CGRect {
        return CGRectMake(0, 100, self.view.frame.size.width, 50)
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touche in touches {
            CATransaction.setDisableActions(true)
            let movePoint = touche.locationInView(self.beforeLabel)
            var frame = maskLayer.frame
            frame.origin.x = movePoint.x - frame.size.width/2
            maskLayer?.frame = frame
            
            self.segmentControl.changeMaskX(movePoint.x - self.segmentControl.subViewWidth/2)
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
