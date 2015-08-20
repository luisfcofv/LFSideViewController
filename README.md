# LFSideViewController ![License MIT](https://go-shields.herokuapp.com/license-MIT-blue.png)
iOS 8 side menu

<img src="https://raw.githubusercontent.com/luisfcofv/LFSideViewController/master/LFSideViewController.gif?" alt="Demo" width="320" height="568" />

#### Usage

```
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

## Licence

LFSideViewController is licensed under the [MIT Licence](LICENSE).
