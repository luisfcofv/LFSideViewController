//
//  MainViewController.swift
//  LFSideViewController
//
//  Created by Luis Flores on 8/18/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, LFSideViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideViewController().delegate = self
    }

    @IBAction func openLeftSideMenu(sender: AnyObject) {
        self.sideViewController().toogleLeftViewController()
    }
    
    @IBAction func openRightSideMenu(sender: AnyObject) {
        self.sideViewController().toogleRightViewController()
    }
    
    func willPresentViewController(viewController: UIViewController?) {
        println("willPresentViewController \(viewController)")
    }
    
    func didPresentViewController(viewController: UIViewController?) {
        println("didPresentViewController \(viewController)")
    }
    
    func willHideViewController(viewController: UIViewController?) {
        println("willHideViewController \(viewController)")
    }
    
    func didHideViewController(viewController: UIViewController?) {
        println("didHideViewController \(viewController)")
    }
}
