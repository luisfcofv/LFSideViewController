//
//  CenterViewController.swift
//  LFSideViewController
//
//  Created by Luis Flores on 8/18/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit
import LFSideViewController

class CenterViewController: UIViewController {

    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    @IBAction func updateViewControllerPressed(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.sideViewController()!.contentViewController = storyboard.instantiateViewControllerWithIdentifier("AdditionalCenterViewController")
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
}
