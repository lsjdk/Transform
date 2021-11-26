//
//  ViewController.swift
//  TransformTest
//
//  Created by 李世举 on 2021/11/26.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var one: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.orange
        view.frame = CGRect.init(x: 100, y: 100, width: 100, height: 200)
        return view
    }()
    
    lazy var two: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.blue
        view.frame = CGRect.init(x: 100, y: 100, width: 100, height: 200)
        return view
    }()
    
    lazy var three: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.red
        view.alpha = 0.5
        view.frame = CGRect.init(x: 100, y: 100, width: 100, height: 200)
        return view
    }()
    lazy var four: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.alpha = 1
        view.frame = CGRect.init(x: 0, y: 0, width: 10, height: 10)
        return view
    }()
    lazy var five: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.black
        view.alpha = 0.5
        view.frame = CGRect.init(x: 0, y: 0, width: 10, height: 10)
        return view
    }()
    private lazy var volumeSlider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 100, y: 400 , width: 200, height: 20))
        slider.minimumValue = -1
        slider.maximumValue = 1
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        slider.value = 0
        return slider
    }()
    
    
    private lazy var slider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 100, y: 500 , width: 200, height: 20))
        slider.minimumValue = -1
        slider.maximumValue = 1
        slider.addTarget(self, action: #selector(sliderValueChanged1), for: .valueChanged)
        slider.value = 0
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(self.one)
        self.view.addSubview(self.two)
        self.view.addSubview(self.three)
        self.three.addSubview(self.four)
        self.view.addSubview(self.five)
        self.view.addSubview(self.volumeSlider)
        self.view.addSubview(self.slider)
        self.two.transform = self.two.transform.rotated(by: CGFloat(Double(30) * .pi  / 180.0))
        self.three.transform = self.three.transform.rotated(by: CGFloat(Double(30) * .pi  / 180.0))

        
        let r = self.three.convert(CGPoint.init(x: self.three.bounds.size.width, y: 0), to: self.view)
        self.five.center = r
        
        
        print("-=-=-=-=-=\(self.three.frame)")
        self.setAnchorPoint(point: CGPoint.init(x: 1, y: 0), view: self.three)
        print("-=-=-123=-=-=\(self.three.frame)")
        
    }

    @objc private func sliderValueChanged() {
        self.setAnchorPoint(point: CGPoint.init(x: 1, y: 0), view: self.three)
        
        self.three.transform = self.three.transform.scaledBy(x: self.volumeSlider.value > 0 ? 1.1 : 0.9, y: self.volumeSlider.value > 0 ? 1.1 : 0.9)
        
        let r = self.three.convert(CGPoint.init(x: self.three.bounds.size.width, y: 0), to: self.view)
        self.five.center = r
        
    }
    
    func setAnchorPoint(point: CGPoint, view: UIView) {
        let oldOrigin = view.frame.origin
        view.layer.anchorPoint = point
        let newOrigin = view.frame.origin
        
        let transition = CGPoint.init(x: newOrigin.x - oldOrigin.x, y: newOrigin.y - oldOrigin.y)
        view.center = CGPoint.init(x: view.center.x - transition.x, y: view.center.y - transition.y)
    }
    
    
    @objc private func sliderValueChanged1() {
        self.setAnchorPoint(point: CGPoint.init(x: 0.5, y: 0.5), view: self.three)
        
        self.three.transform = self.three.transform.rotated(by: CGFloat(Double(1) * .pi  / 180.0))
        
        let r = self.three.convert(CGPoint.init(x: self.three.bounds.size.width, y: 0), to: self.view)
        self.five.center = r
    }
}

