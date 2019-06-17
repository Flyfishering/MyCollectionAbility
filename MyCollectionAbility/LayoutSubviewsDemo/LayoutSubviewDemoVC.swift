//
//  LayoutSubviewDemoVC.swift
//  MyCollectionAbility
//
//  Created by 斌 on 2019/6/15.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import UIKit


class LayoutSubviewDemoVC: UIViewController {
    let containView =  ContainView.init()
    let subview1 = DemoSubview1.init()
    let subview2 = DemoSubview2.init()
    let subview3 = DemoSubview3.init()
    
    override func viewDidLoad() {
//        self.addDemo1()
//        self.addDemo2()
//        self.addDemo3()
         self.addDemo4()
    }
    override func viewDidAppear(_ animated: Bool) {
//        self.addDemo1()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let file = NSStringFromClass(self.classForCoder)
        //        let funcStr = #function
        print("\(file)---\(#function)")

    }
    
    func addDemo1(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(containView)
        self.view.addSubview(self.subview1)
        self.view.addSubview(self.subview2)
        self.view.addSubview(self.subview3)
    }
    
    func addDemo2(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(containView)
        self.containView.addSubview(self.subview1)
        self.containView.addSubview(self.subview2)
        self.containView.addSubview(self.subview3)
    }    
    
    func addDemo3(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(containView)
        self.containView.addSubview(self.subview1)
        self.subview1.addSubview(self.subview2)
        self.subview1.addSubview(self.subview3)
    }
    
    func addDemo4(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(containView)
        self.containView.addSubview(self.subview1)
        self.subview1.addSubview(self.subview2)
        self.subview2.addSubview(self.subview3)
    }

    
    
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.containView.frame = CGRect(x: 0, y: 100, width: 100, height: 100)
        self.subview3.frame = CGRect(x: 0, y: 200, width: 100, height: 100)

    }
}

class ContainView: UIView {
    override func layoutSubviews() {
        let file = NSStringFromClass(self.classForCoder)
//        let funcStr = #function
        print("\(file)---\(#function)")
    }
}

class DemoSubview1: UIView {
    override func layoutSubviews() {
        let file = NSStringFromClass(self.classForCoder)
        //        let funcStr = #function
        print("\(file)---\(#function)")
    }
}

class DemoSubview2: UIView {
    override func layoutSubviews() {
        let file = NSStringFromClass(self.classForCoder)
        //        let funcStr = #function
        print("\(file)---\(#function)")
    }
}

class DemoSubview3: UIView {
    override func layoutSubviews() {
        let file = NSStringFromClass(self.classForCoder)
        //        let funcStr = #function
        print("\(file)---\(#function)")
    }
}
