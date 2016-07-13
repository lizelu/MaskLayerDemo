//
//  CESegmentControl.swift
//  CECustomeSegmentControl
//
//  Created by Mr.LuDashi on 16/7/13.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

import UIKit
enum LabelType {
    case BackgroundLabel, BeforeLabel
}

class CESegmentControl: UIView {
    var titleArray: Array<String> = ["Swift", "Apple", "ObjC"]
    var backgroundTextColor: UIColor = UIColor.blackColor()
    var beforeTextColor: UIColor = UIColor.whiteColor()
    
    var textFont: UIFont = UIFont.boldSystemFontOfSize(18)
    
    
    
    
    var backroundView: UIView!
    var beforeView: UIView!
    var maskLayer: CALayer!
    
    
    var subViewWidth: CGFloat {
        get {
            return self.frame.size.width / CGFloat(titleArray.count)
        }
    }
    
    var subViewHeight: CGFloat {
        get {
            return self.frame.size.height
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addBackgoundView()
        self.addBeforView()
        self.addMaskForBeforeView()
        self.addTopButtons()
    }
    
    func addBackgoundView() {
        self.backroundView = UIView.init(frame: self.bounds)
        self.addSubview(self.backroundView)
        self.addBackgroundLabels()
    }
    
    func addBeforView() {
        self.beforeView = UIView.init(frame: self.bounds)
        self.beforeView.backgroundColor = UIColor.redColor()
        self.backroundView.addSubview(self.beforeView)
        self.addBeforLabels()
    }
    
    func addBackgroundLabels() {
        self.addLabel(.BackgroundLabel)
    }
    
    func addBeforLabels() {
        self.addLabel(.BeforeLabel)
    }
    
    func addLabel(labelType: LabelType) {
        
        var superView: UIView!
        var textColor: UIColor!
        
        switch labelType {
            case .BackgroundLabel:
                textColor = backgroundTextColor
                superView = backroundView
            case .BeforeLabel:
                textColor = beforeTextColor
                superView = beforeView
        }
        
        for i in 0..<self.titleArray.count {
            let tempLabel = UILabel(frame: getSubViewFrame(i))
            tempLabel.font = self.textFont
            tempLabel.text = self.titleArray[i]
            tempLabel.textAlignment = .Center
            tempLabel.textColor = textColor
            superView.addSubview(tempLabel)
        }
    }
    
    func addMaskForBeforeView() {
        maskLayer = CALayer()
        maskLayer.frame = getSubViewFrame(0)
        maskLayer.cornerRadius = 25
        maskLayer.backgroundColor = UIColor.redColor().CGColor
        self.beforeView.layer.mask = maskLayer
    }
    
    func addTopButtons() {
        for i in 0..<self.titleArray.count {
            let tempButton = UIButton.init(frame: getSubViewFrame(i))
            tempButton.tag = i
            tempButton.addTarget(self, action: #selector(tapButton(_:)), forControlEvents: .TouchUpInside)
            self.addSubview(tempButton)
        }
    }
    
    func getSubViewFrame(index: Int) -> CGRect {
        return CGRectMake(CGFloat(index) * subViewWidth, 0, subViewWidth, subViewHeight)
    }
    
    func tapButton(sender: UIButton) {
        maskLayer.frame = getSubViewFrame(sender.tag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
