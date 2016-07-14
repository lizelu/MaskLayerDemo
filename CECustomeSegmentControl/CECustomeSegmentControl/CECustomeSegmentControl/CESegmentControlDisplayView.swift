//
//  CESegmentControlDisplayView.swift
//  CECustomeSegmentControl
//
//  Created by Mr.LuDashi on 16/7/14.
//  Copyright © 2016年 ZeluLi. All rights reserved.
//

import UIKit

class CESegmentControlDisplayView: UIView, UIScrollViewDelegate {
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
    }
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
    }
    
    
    let topSegmentControlHeight: CGFloat = 50;
    var topSegmentControlWidth: CGFloat {
        get {
            return self.width
        }
    }
    
    var scrollViewY: CGFloat {
        get {
            return topSegmentControlHeight + 10
        }
    }
    
    
    var scrollViewHeight: CGFloat {
        get {
            return self.height - scrollViewY
        }
    }
    var scrollViewWidth: CGFloat {
        get {
            return self.width
        }
    }
    
    var scrollView: UIScrollView!
    var segmentControl: CESegmentControl!
    var titleArray:Array<String> = []
    private var scrollSubViewsArray: Array<CEScrollSubView> = []     //存储三个视图
    private var currentPage: Int = 0                            //当前页数
    private var direction:CGFloat = 1                           //运动方向，1 <==> right, -1 <==> left
    private var isDraging: Bool = false
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTopSegmentControl()
        self.addScrollView()
    }
    
    func setTitlesArray(titleArray: Array<String>) {
        self.titleArray = titleArray
        self.segmentControl.setTitleArray(self.titleArray)
        self.setScrollSubView(0)
    }
    
    private func addTopSegmentControl() {
        self.segmentControl = CESegmentControl.init(frame: CGRectMake(0, 0, topSegmentControlWidth, topSegmentControlHeight))
        
        weak var weak_self = self
        self.segmentControl.setButtonTouchUpInsideClosure { (page) in
            weak_self!.isDraging = false
            if page != weak_self!.currentPage {
                print(page)
                if page > weak_self!.currentPage {
                    weak_self!.direction = 1
                } else {
                    self.direction = -1
                }
                
                weak_self?.currentPage = page
                
                UIView.animateWithDuration(0.3, animations: {
                    weak_self!.scrollView.contentOffset.x = weak_self!.scrollView.contentOffset.x + (weak_self!.width * weak_self!.direction)  - 1
                    }, completion: { (result) in
                        if result {
                            weak_self!.scrollView.contentOffset.x += 1
                        }
                })

            }
        }
        self.addSubview(segmentControl)
    }
    
    private func addScrollView() {
        self.scrollView = UIScrollView.init(frame: CGRectMake(0, scrollViewY, scrollViewWidth, scrollViewHeight))
        self.scrollView.bounces = false
        self.scrollView.delegate = self
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.backgroundColor = UIColor.grayColor()
        self.scrollView.contentSize = CGSizeMake(3 * self.self.scrollViewWidth, self.scrollViewHeight)
        self.scrollView.pagingEnabled = true
        self.scrollView.contentOffset.x = self.scrollViewWidth
        self.addSubview(self.scrollView)
        self.addScrollSubView()
    }
    
    private func addScrollSubView() {
        for i in 0..<3 {
            let tempView: CEScrollSubView = CEScrollSubView.init(frame: getScrollSubViewFrameWithIndex(i))
            tempView.tag = i
            tempView.layer.borderColor = UIColor.brownColor().CGColor
            tempView.layer.borderWidth = 10
            self.scrollView.addSubview(tempView)
            self.scrollSubViewsArray.append(tempView)
        }
    }
    
    /**
     设置ScrollSubView上应显示的内容
     
     - parameter currentPage: 当前页数
     */
    private func setScrollSubView(currentPage: Int) {
        
        let titleIndexArray = [getBeforeContentIndex(currentPage),
                               getCurrentContentIndex(currentPage),
                               getLastContentIndex(currentPage)]
        
        for i in 0..<self.scrollSubViewsArray.count {
            let tempView = self.scrollSubViewsArray[i]
            let title = self.titleArray[titleIndexArray[i]]
            tempView.configScrollSubView(title)
        }
    }
    
    
    /**
     获取当前显示图片索引
     
     - parameter currentPage: 当前页数
     
     - returns:
     */
    private func getCurrentContentIndex(currentPage: Int) -> Int {
        if self.titleArray.count > 0 {
            let tempCurrentPage = currentPage % self.titleArray.count
            return tempCurrentPage < 0 ? self.titleArray.count - 1 : tempCurrentPage
        }
        return 0
    }
    
    /**
     获取当前显示图片的上一张图片的索引
     
     - parameter currentPage:
     
     - returns:
     */
    private func getBeforeContentIndex(currentPage: Int) -> Int {
        let beforeNumber = getCurrentContentIndex(currentPage) - 1
        return beforeNumber < 0 ? self.titleArray.count - 1 : beforeNumber
    }
    
    /**
     获取当前图片显示的下一张图片的索引
     
     - parameter currentPage:
     
     - returns:
     */
    private func getLastContentIndex(currentPage: Int) -> Int {
        let lastNumber = getCurrentContentIndex(currentPage) + 1
        return lastNumber >= self.titleArray.count ? 0 : lastNumber
    }

    
    /**
     获取每个按钮的Frame
     
     - parameter index:
     
     - returns:
     */
    private func getScrollSubViewFrameWithIndex(index: Int) -> CGRect{
        return CGRectMake(CGFloat(index) * self.scrollViewWidth, 0, self.scrollViewWidth, self.scrollViewHeight)
    }
    
    
    
    //MARK -- UIScrollViewDelegate
    /**
     移动Button到合适的位置
     
     - parameter scrollView:
     */
    func scrollViewDidScroll(scrollView: UIScrollView) {
    
        if titleArray.count > 0 {
            let contentOffsetX = scrollView.contentOffset.x + CGFloat(currentPage - 1) * self.width
            print(contentOffsetX)
            self.segmentControl.changeMaskX(contentOffsetX*(1/CGFloat(titleArray.count)))
        }
        
        self.moveImageView(scrollView.contentOffset.x)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.isDraging = true
    }
    
    
    /**
     移动Button到合适的位置
     
     - parameter offsetX:
     */
    private func moveImageView(offsetX: CGFloat) {
        let temp = offsetX / self.width
        
        if temp == 0 || temp == 1 || temp == 2 {
            if isDraging {
                let position: Int = Int(temp) - 1
                self.currentPage = getCurrentContentIndex(self.currentPage + position)
            }
            self.scrollView.contentOffset.x = self.width
            self.setScrollSubView(self.currentPage)
        }
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("释放")
    }
}
