# LFSideViewController ![License MIT](https://go-shields.herokuapp.com/license-MIT-blue.png)
[![Badge w/ Version](https://cocoapod-badges.herokuapp.com/v/LFSideViewController/badge.png)](http://cocoadocs.org/docsets/LFSideViewController)
[![Badge w/ Platform](https://cocoapod-badges.herokuapp.com/p/LFSideViewController/badge.svg)](http://cocoadocs.org/docsets/LFSideViewController)

iOS 8 side menu

<img src="https://raw.githubusercontent.com/luisfcofv/LFSideViewController/master/LFSideViewController.gif?" alt="Demo" width="320" height="568" />

#### Requirements

* Xcode 6
* iOS 8

## Installation
The best and easiest way is to use [CocoaPods](http://cocoapods.org).

    pod 'LFSideViewController', '~> 1.1.0'

#### Usage

```
import UIKit

class RootViewController: LFSideViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.contentViewController = storyboard.instantiateViewControllerWithIdentifier("NavigationViewController")
        self.rightViewController = storyboard.instantiateViewControllerWithIdentifier("RightViewController")
        self.leftViewController = storyboard.instantiateViewControllerWithIdentifier("LeftViewController")
    }
}
```

Check out the example project for more details.

## Licence

LFSideViewController is licensed under the [MIT Licence](LICENSE).
