//
//  ViewController.swift
//  DemoDelegate
//
//  Created by Florian Praile on 23/08/2018.
//  Copyright © 2018 Underside. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LedViewDelegate {

    @IBOutlet weak var livingRoomLedView: LedView!
    @IBOutlet weak var kitchenLedView: LedView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.livingRoomLedView.delegate = self
        self.kitchenLedView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func ledStatusDidChanged(status: Bool, ledView: LedView) {
        if ledView === self.livingRoomLedView{
            self.status(forLedView: livingRoomLedView, named: "Living")
        }
        if ledView === self.kitchenLedView{
            self.status(forLedView: kitchenLedView, named: "Kitchen")
        }
    }
    
    func status(forLedView ledView: LedView, named name : String){
        if ledView.isOn{
            print("\(name) is On")
        }else{
            print("\(name) is Off")
        }
    }
    
    deinit {
        print("vc is deinit")
    }
}

