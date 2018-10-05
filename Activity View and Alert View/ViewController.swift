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
        button01.backgroundColor = UIColor(red:8/255, green:217/255, blue:214/255, alpha:1)

        // Button Title
        button01.setTitle("Button", for: .normal)

        // Title Heighlighted when push button
        button01.setTitleColor(UIColor.black, for: .highlighted)

        // backColor
        //self.backgroundColor = UIColor.cyan

        button01.frame = CGRect( // boundsは画面のViewが基準。frameは親Viewが基準。
            x: bounds.origin.x + 50,  // CustomViewのlabelのレイアウトを組む際には、frameではなく boundsを使う
            y: bounds.origin.y + 300,
            width: bounds.width - 50 * 2,
            height: 100
        )
    }
    //*********************************************
}
//+++++++++++++++++++++++++++++++++++++++++++++++++++++


class ViewController: UIViewController {

    // CustomView Initialize
    let customView = CustomView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // customView is ridden on view
        view.addSubview(customView)

        customView.button01.addTarget(self, action: #selector(ViewController.onClickUpAlert), for: UIControl.Event.touchUpInside)
    }

    // ************************************************
    override func viewDidLayoutSubviews() { // ViewControllerクラスではviewDidLayoutSubviewsメソッド内でレイアウトを組む
        super.viewDidLayoutSubviews()


        customView.backgroundColor = UIColor(red:234/255, green:234/255, blue:234/255, alpha:1)  // UIColorで色を指定する


        // boundsは画面のViewが基準。frameは親Viewが基準。
        customView.frame = CGRect(
            x: view.safeAreaInsets.left,
            y: view.safeAreaInsets.top, // safeAreaの一番うえを基準にしている
            width: view.frame.maxX,
            height: view.frame.maxY
        )
    }
     // ************************************************


// Pop up the Alert when push Button
    @objc func onClickUpAlert(sender: UIButton) {

        // instance UIAlertController
        let myAlertController = UIAlertController(title: "Alert Title", message: "Message: This is a test", preferredStyle: .alert)

        // set OK button & print("OK Test!") in debug console
        let myOKButton = UIAlertAction(title: "OK", style: .default){ action in print("OK Test!")}

        // add myOKButton on myAlertController as action
        myAlertController.addAction(myOKButton)

//        controller.title = "Test Alert"
//        controller.message = "This is a test"

        present(myAlertController, animated: true, completion: nil)

    }
}

