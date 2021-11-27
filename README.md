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
