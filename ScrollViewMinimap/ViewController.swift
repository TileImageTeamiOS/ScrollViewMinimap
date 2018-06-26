//
//  ViewController.swift
//  ScrollViewMinimap
//
//  Created by Seong ho Hong on 2018. 6. 26..
//  Copyright © 2018년 Seong ho Hong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var grohongView: UIView!
    @IBOutlet weak var minimap: ScrollViewMinimap!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setZoomParametersForSize(scrollView.bounds.size)
        minimap.setUp(scrollView: scrollView)
    }
    
    func setZoomParametersForSize(_ scrollViewSize: CGSize) {
        let imageSize = grohongView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 4.0
        scrollView.zoomScale = minScale
    }
}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return grohongView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        minimap.resize(scrollView: scrollView)
    }
}

