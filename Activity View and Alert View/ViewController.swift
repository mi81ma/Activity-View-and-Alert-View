//
//  ViewController.swift
//  Activity View and Alert View
//
//  Created by masato on 5/10/2018.
//  Copyright © 2018 masato. All rights reserved.
//
//  Show Up the Alert View when Push Button
//  Swift 4.2
//

import UIKit

class ViewController: UIViewController {

    // CustomView Initialize
    let customView = CustomView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // customView is ridden on view
        view.addSubview(customView)
    }

    override func viewDidLayoutSubviews() { // ViewControllerクラスではviewDidLayoutSubviewsメソッド内でレイアウトを組む
        super.viewDidLayoutSubviews()


//        customView.backgroundColor = UIColor.red // customViewを赤色にする


        // boundsは画面のViewが基準。frameは親Viewが基準。
        customView.frame = CGRect(
            x: view.frame.origin.x + 200,
            y: view.safeAreaInsets.top + 400, // safeAreaの一番うえを基準にしているｒ
            width: view.frame.width - 50 * 2,
            height: 200
        )
        // ************************************************
    }
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++
//CustomView Class inorder to design UIButton

class CustomView: UIView {
    var button01: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)

        button01 = UIButton()
        addSubview(button01)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init with coder in not implemented")
    }

    //*******************************************
    // make Button Layout
    override func layoutSubviews() {
        super.layoutSubviews()

        // Button BackGround Color
        button01.backgroundColor = UIColor.blue

        // Button Title
        button01.setTitle("Button", for: .normal)

        // Title Heighlighted when push button
        button01.setTitleColor(UIColor.black, for: .highlighted)

        // backColor
        //self.backgroundColor = UIColor.cyan

        // set Size
        let bWidth: CGFloat = 300
        let bHeight: CGFloat = 100

//        // set X, Y Position
//        let posX: CGFloat = 0 // self.bounds.origin.x + 100
//        let posY: CGFloat = 0 // self.frame.height/2 - bHeight/2

        button01.bounds = CGRect(
            x: 0, y:0, width: bWidth, height: bHeight
        )
    }
    //*********************************************
}
//+++++++++++++++++++++++++++++++++++++++++++++++++++++
