//
//  CESegmentControlDisplayViewController.swift
//  CECustomeSegmentControl
//
//  Created by Mr.LuDashi on 16/7/14.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

import UIKit

class CESegmentControlDisplayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.frame.width
        let segmentScollView = CESegmentControlDisplayView.init(frame: CGRectMake(10, 60, self.view.frame.width - 20, self.view.frame.height - 100));
        segmentScollView.setTitlesArray(["Swift", "Apple", "ObjC", "iPhone"])
        self.view.addSubview(segmentScollView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit{
        print("释放")
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
