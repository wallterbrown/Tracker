//
//  TabBarViewController.swift
//  Tracker
//
//  Created by Всеволод Нагаев on 02.08.2024.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTabs()
        
        self.tabBar.backgroundColor = .white
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .ypBlue
        self.tabBar.unselectedItemTintColor = .gray
    }
    
    private func setUpTabs(){
        let tracker = self.createNav(with: "Трекеры", and: UIImage(named: "TabBarTrackerButton") , vc: TrackerController())
        let stats = self.createNav(with: "Статистика", and: UIImage(named: "TabBarStatsButton"), vc: StatsController ())
        self.setViewControllers([tracker, stats], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController{
    
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        return nav
    }
}
