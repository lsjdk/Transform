# Transform


1.缩放或旋转默认都是围绕视图的中心点来进行的，通过 AnchorPoint 的设定，可以改变缩放或旋转围绕的点，下面是修改方法。

    /// Set the point around which zoom or rotate
    /// - Parameters:
    ///   - point: Modify the location of AnchorPoint
    ///   - view: Set view
    func setAnchorPoint(point: CGPoint, view: UIView) {
        let oldOrigin = view.frame.origin
        view.layer.anchorPoint = point
        let newOrigin = view.frame.origin
        
        let transition = CGPoint.init(x: newOrigin.x - oldOrigin.x, y: newOrigin.y - oldOrigin.y)
        view.center = CGPoint.init(x: view.center.x - transition.x, y: view.center.y - transition.y)
    }

2.改变控件的大小，下面两个方式效果是一样的
//        self.three.transform = self.three.transform.scaledBy(x: self.volumeSlider.value > 0 ? 1.1 : 0.9, y: self.volumeSlider.value > 0 ? 1.1 : 0.9)
        
        self.three.bounds = CGRect.init(x: 0, y: 0, width: self.bounds.size.width - CGFloat(self.volumeSlider.value * 50), height: self.bounds.size.height - CGFloat(self.volumeSlider.value * 50))
