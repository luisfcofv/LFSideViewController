//
//  RootViewController.swift
//  LFSideViewController
//
//  Created by Luis Flores on 8/18/15.
//  Copyright (c) 2015 Luis Flores. All rights reserved.
//

import UIKit

class RootViewController: LFSideViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.leftViewController = storyboard.instantiateViewControllerWithIdentifier("LeftViewController") as? UIViewController
        self.contentViewController = storyboard.instantiateViewControllerWithIdentifier("NavigationViewController") as? UIViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func openLeftViewController(sender: AnyObject) {
        self.presentLeftViewController()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
