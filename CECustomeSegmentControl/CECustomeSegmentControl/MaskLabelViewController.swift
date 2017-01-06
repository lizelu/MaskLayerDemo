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
        self.addLabel(label: backgroundLabel, textColor: UIColor.green)
    }
    
    func createBeforeLabel() {
        beforeLabel = UILabel.init(frame: getLableFrame())
        self.addLabel(label: beforeLabel, textColor: UIColor.red)
    }
    
    func addLabel(label: UILabel, textColor: UIColor) {
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = textColor
        label.text = "Hello Word"
        label.textAlignment = .center
        self.view.addSubview(label)
    }
    
    func addMask() {
        maskLayer = CALayer()
        maskLayer.frame = CGRect(x:0, y:0, width:100, height:50)
        maskLayer.cornerRadius = 25
        maskLayer.backgroundColor = UIColor.black.cgColor
        self.beforeLabel.layer.mask = maskLayer
    }
    
    
    
    func addCustomeSegmentControl() {
        self.segmentControl = CESegmentControl.init(frame: CGRect(x:10, y:200, width:300, height:60))
        self.segmentControl.setTitleArray(titleArray: ["Swift", "Apple", "ObjC", "iPhone"])
        self.view.addSubview(segmentControl)
    }
    
    
    
    
    func getLableFrame() -> CGRect {
        return CGRect(x:0, y:100, width:self.view.frame.size.width, height:50)
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touche in touches {
            CATransaction.setDisableActions(true)
            let movePoint = touche.location(in: self.beforeLabel)
            var frame = maskLayer.frame
            frame.origin.x = movePoint.x - frame.size.width/2
            maskLayer?.frame = frame
            
            self.segmentControl.changeMaskX(x: movePoint.x - self.segmentControl.subViewWidth/2)
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
