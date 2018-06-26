//
//  ScrollViewMinimap.swift
//  ScrollViewMinimap
//
//  Created by Seong ho Hong on 2018. 6. 26..
//  Copyright © 2018년 Seong ho Hong. All rights reserved.
//

import UIKit

class ScrollViewMinimap: UIView {
    private var focusedBorderWidth: CGFloat = 1.5
    private var focusedBorderColor: CGColor = UIColor.red.cgColor
    
    private var focusedBoxView: UIView = UIView()
    private var minimapImageView: UIImageView = UIImageView()
    
    private var downSizeRatio: CGFloat = 5.0
    
    public func setUp(scrollView: UIScrollView) {
        // for after set auto layout size
        // todo: not work in viewdidload -> now work in viewdidappear
        scrollView.setNeedsLayout()
        scrollView.layoutIfNeeded()
        
        let width = scrollView.frame.width/downSizeRatio
        let height = scrollView.frame.height/downSizeRatio
        
        // minimap size is divide scollview size into downSizeRatio
        self.frame.size = CGSize(width: width, height: height)
        minimapImageView.frame = CGRect(origin: .zero,
                                        size: CGSize(width: width, height: height))
        
        minimapImageView.image = scrollView.asImage()
        self.addSubview(minimapImageView)
        
    }
}

extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
