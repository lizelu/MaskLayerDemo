//
//  CEScrollSubView.swift
//  CECustomeSegmentControl
//
//  Created by Mr.LuDashi on 16/7/14.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

import UIKit

class CEScrollSubView: UIView {
    private var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addLabel()
    }
    
    private func addLabel() {
        self.textLabel = UILabel(frame: self.bounds)
        self.textLabel.font = UIFont.boldSystemFont(ofSize: 50)
        self.textLabel.textAlignment = .center
        self.textLabel.textColor = UIColor.white
        self.addSubview(self.textLabel)
    }
    
    func configScrollSubView(parameter: AnyObject) {
        if let title = parameter as? String {
            self.textLabel.text = title
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("ScrollSubView释放")
    }
}
