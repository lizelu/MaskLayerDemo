//
//  NoUserMaskViewController.swift
//  CECustomeSegmentControl
//
//  Created by Mr.LuDashi on 16/7/11.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

import UIKit

class NoUserMaskViewController: UIViewController {
    
    var grayImageView: UIImageView!
    var colorImageView: UIImageView!
    var maskView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGrayImageView()
        addMaskView()
    }
    
    func addGrayImageView() {
        grayImageView = UIImageView(frame: self.view.bounds)
        grayImageView.backgroundColor = UIColor.init(patternImage: UIImage(named: "gray")!)
        grayImageView.contentMode = .ScaleAspectFit
        grayImageView.image = UIImage(named: GrayImageName)
        self.view.addSubview(grayImageView)
    }
    
    func addMaskView() {
        let maskFrame = CGRect(origin: CGPointZero, size: CGSizeMake(100, 100))
        maskView = UIView(frame: maskFrame)
        maskView.center = self.view.center
        maskView.layer.cornerRadius = 50
        maskView.clipsToBounds = true
        maskView.backgroundColor = UIColor.init(patternImage: UIImage(named: "color")!)
        self.view.addSubview(maskView)
        self.addColorImageView()
    }
    
    func addColorImageView() {
        let colorImageFrame = CGRect(origin: CGPointZero, size: self.view.bounds.size)
        colorImageView = UIImageView(frame: colorImageFrame)
        colorImageView.center = CGPointMake(50, 50)
        colorImageView.contentMode = .ScaleAspectFit
        colorImageView.image = UIImage(named: ColorImageName)
        self.maskView.addSubview(colorImageView)
    }
    
//    func countColorImageViewCenter() -> CGPoint {
//        
//    }
    

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touche in touches {
            let maskCenter = touche.locationInView(self.view)
            let colorImageCenter = touche.locationInView(self.maskView)
            print(maskCenter)
            print(colorImageCenter)
            self.maskView.center = maskCenter
        }
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
