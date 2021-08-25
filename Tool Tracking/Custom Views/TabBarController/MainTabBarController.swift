//
//  MainTabBarController.swift
//  Tool Tracking
//
//  Created by Ferry Adi Wijayanto on 24/08/21.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            createViewControllers(viewController: ToolsVC(), title: "Home", item: UITabBarItem(title: "Tools", image: UIImage(systemName: "wrench.fill"), tag: 0)),
            createViewControllers(viewController: FriendsVC(), title: "Friends", item: UITabBarItem(title: "Friends", image: UIImage(systemName: "person.2.fill"), tag: 1))
        ]
    }
    
    private func createViewControllers(viewController: UIViewController, title: String, item: UITabBarItem) -> UINavigationController {
        let vc              = viewController
        vc.title            = title
        vc.tabBarItem       = item
        
        let navController   = UINavigationController(rootViewController: vc)
        return navController
    }

}
