//
//  LedView.swift
//  DemoDelegate
//
//  Created by Florian Praile on 23/08/2018.
//  Copyright © 2018 Underside. All rights reserved.
//

import UIKit

class LedView: UIView {

    weak var delegate : LedViewDelegate?
    
    var isOn = true{
        didSet{
            updateUI()
            self.delegate?.ledStatusDidChanged(status: isOn, ledView: self)
        }
    }
    
    // init from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    // init(frame) from a viewcontroller code
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit(){
        self.backgroundColor = UIColor.yellow
        self.layer.masksToBounds = true
        
        let swipeRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        
        self.addGestureRecognizer(swipeRecognizer)
    }
    
    @objc func handleGesture(gesture: UITapGestureRecognizer) -> Void {
        self.isOn = !self.isOn
    }
    
    func updateUI(){
        self.backgroundColor = self.isOn ? UIColor.yellow : UIColor.black
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.layer.cornerRadius = self.bounds.width / 2.0
    }

}


protocol LedViewDelegate: AnyObject {
    func ledStatusDidChanged(status: Bool, ledView: LedView)
}
