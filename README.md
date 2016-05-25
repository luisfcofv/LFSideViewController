# LFSideViewController
![License MIT](https://img.shields.io/github/license/luisfcofv/LFSideViewController.svg)
[![Badge w/ Version](https://img.shields.io/cocoapods/v/LFSideViewController.svg)](http://cocoadocs.org/docsets/LFSideViewController)
[![Badge w/ Platform](https://img.shields.io/cocoapods/p/LFSideViewController.svg)](http://cocoadocs.org/docsets/LFSideViewController)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

iOS 8 side menu

<img src="https://raw.githubusercontent.com/luisfcofv/LFSideViewController/master/LFSideViewController.gif?" alt="Demo" width="320" height="568" />

#### Requirements

* Xcode 6
* iOS 8

## Installation
The best and easiest way is to use [CocoaPods](http://cocoapods.org).

    pod 'LFSideViewController', '~> 1.3.1'

#### Usage

```swift
import UIKit

class RootViewController: LFSideViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.contentViewController = storyboard.instantiateViewControllerWithIdentifier("NavigationViewController") as? UIViewController
        self.rightViewController = storyboard.instantiateViewControllerWithIdentifier("RightViewController") as? UIViewController
        self.leftViewController = storyboard.instantiateViewControllerWithIdentifier("LeftViewController") as? UIViewController
    }
}
```

Check out the example project for more details.

## License

LFSideViewController is licensed under the [MIT License](LICENSE).
