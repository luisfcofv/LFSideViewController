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
        self.sideViewController()!.delegate = self
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }

    @IBAction func leftSideMenuPressed() {
        self.sideViewController()!.toogleLeftViewController()
    }
    
    @IBAction func rightSideMenuPressed() {
        if self.sideViewController()!.rightViewControllerVisible {
            self.sideViewController()!.hideRightViewController()
        } else {
            self.sideViewController()!.presentRightViewController(0.5, dampingRatio: 0.4, velocity: 10, options: .CurveEaseIn)
        }
    }

    func willPresentViewController(viewController: UIViewController?) {
        print("willPresentViewController \(viewController)")
    }
    
    func didPresentViewController(viewController: UIViewController?) {
        print("didPresentViewController \(viewController)")
    }
    
    func willHideViewController(viewController: UIViewController?) {
        print("willHideViewController \(viewController)")
    }
    
    func didHideViewController(viewController: UIViewController?) {
        print("didHideViewController \(viewController)")
    }
}
