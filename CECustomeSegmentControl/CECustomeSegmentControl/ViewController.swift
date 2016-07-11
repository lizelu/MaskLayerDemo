//
//  ViewController.swift
//  CECustomeSegmentControl
//
//  Created by Mr.LuDashi on 16/7/11.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        hideNavigation()
        
    }
    
    
    private func hideNavigation() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

