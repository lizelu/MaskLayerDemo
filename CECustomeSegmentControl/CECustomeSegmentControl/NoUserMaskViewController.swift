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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGrayImageView()
        addColorImageView()
    }
    
    func addGrayImageView() {
        grayImageView = UIImageView(frame: self.view.bounds)
        grayImageView.backgroundColor = UIColor.init(patternImage: UIImage(named: "gray")!)
        self.addImageView(grayImageView, imageName: GrayImageName)
    }
    
    func addColorImageView() {
        colorImageView = UIImageView(frame: self.view.bounds)
        colorImageView.backgroundColor = UIColor.init(patternImage: UIImage(named: "color")!)
        self.addImageView(colorImageView, imageName: ColorImageName)
    }
    
    func addImageView(imageView: UIImageView, imageName: String) {
        imageView.contentMode = .ScaleAspectFit
        imageView.image = UIImage(named: imageName)
        self.view.addSubview(imageView)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touche in touches {
            print(touche.locationInView(self.view))
        }
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
