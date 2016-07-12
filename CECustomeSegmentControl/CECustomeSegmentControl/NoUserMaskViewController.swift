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
        let maskFrame = CGRect(origin: CGPointZero, size: CGSizeMake(150, 150))
        maskView = UIView(frame: maskFrame)
        maskView.center = self.view.center
        maskView.layer.cornerRadius = 50
        maskView.clipsToBounds = true
        maskView.backgroundColor = UIColor.init(patternImage: UIImage(named: "color")!)
        self.view.addSubview(maskView)
        self.addColorImageView()
    }
    
    func addColorImageView() {
        colorImageView = UIImageView.init()
        colorImageView.contentMode = .ScaleAspectFit
        colorImageView.image = UIImage(named: ColorImageName)
        self.maskView.addSubview(colorImageView)
        
        self.addColorImageConstraint()
        
    }
    
    func addColorImageConstraint() {
        self.colorImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints([creatConstraint(.Top),
                                  creatConstraint(.Left),
                                    creatConstraint(.Bottom), creatConstraint(.Right)])
        
    }
    
    func creatConstraint(attribute:NSLayoutAttribute) ->  NSLayoutConstraint{
        return NSLayoutConstraint.init(item: colorImageView,
                                attribute: attribute,
                                relatedBy: .Equal,
                                toItem: self.view,
                                attribute: attribute,
                                multiplier: 1,
                                constant: 0)
    }
    

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