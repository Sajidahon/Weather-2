//
//  MainTabBarController.swift
//  Weather 2
//
//  Created by Smart Castle M1A2006 on 13.04.2024.
//

import UIKit

class MainTabBarController: UITabBarController {
override func viewDidLoad() {
    super.viewDidLoad()
   
    
    viewControllers = [
        createController(viewController: ForecastViewController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Forecast", imageName: "free-icon-weather-forecast-6323550.png"),
        createController(viewController: LocationViewController(collectionViewLayout: UICollectionViewFlowLayout()), title: "Location", imageName: "free-icon-list-5718311.png")
        
    ]
}

func createController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
    let navController = UINavigationController(rootViewController: viewController)
    navController.navigationBar.prefersLargeTitles = true
    viewController.navigationItem.title = title
    viewController.view.backgroundColor = .white
    navController.tabBarItem.title = title
    navController.tabBarItem.image = UIImage(named: imageName)
    navController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
    return navController
}

}

