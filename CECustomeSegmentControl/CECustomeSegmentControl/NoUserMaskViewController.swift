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
    let maskWidth: CGFloat = 200
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGrayImageView()
        addMaskView()
    }
    
    func addGrayImageView() {
        grayImageView = UIImageView(frame: self.view.bounds)
        grayImageView.contentMode = .scaleAspectFill
        grayImageView.image = UIImage(named: GrayImageName)
        self.view.addSubview(grayImageView)
    }
    
    func addMaskView() {
        let maskFrame = CGRect(origin: CGPoint.zero, size: CGSize(width:maskWidth, height:maskWidth))
        maskView = UIView(frame: maskFrame)
        maskView.center = self.view.center
        maskView.layer.cornerRadius = maskWidth / 2
        maskView.clipsToBounds = true
        self.view.addSubview(maskView)
        self.addColorImageView()
    }
    
    func addColorImageView() {
        colorImageView = UIImageView.init()
        colorImageView.contentMode = .scaleAspectFill
        colorImageView.image = UIImage(named: ColorImageName)
        self.maskView.addSubview(colorImageView)
        
        self.addColorImageConstraint()
        
    }
    
    func addColorImageConstraint() {
        self.colorImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints([creatConstraint(attribute: .top),
                                  creatConstraint(attribute: .left),
                                  creatConstraint(attribute: .bottom),
                                  creatConstraint(attribute: .right)])
        
    }
    
    func creatConstraint(attribute:NSLayoutAttribute) ->  NSLayoutConstraint{
        return NSLayoutConstraint.init(item: colorImageView,
                                attribute: attribute,
                                relatedBy: .equal,
                                toItem: self.view,
                                attribute: attribute,
                                multiplier: 1,
                                constant: 0)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touche in touches {
            self.maskView.center = touche.location(in: self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
