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
        self.tabBar.layer.borderColor = UIColor.lightGray.cgColor
        self.tabBar.layer.borderWidth = 1
        self.tabBar.clipsToBounds = true
    }
    
    //MARK: - DatePicker
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.preferredDatePickerStyle = .compact
        datePicker.tintColor = .black
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return datePicker
    }()
    
    private func setUpTabs(){
        let tracker = self.createNav(with: "Трекеры", and: UIImage(named: "TabBarTrackerButton") , vc: TrackerController())
        tracker.viewControllers.first?.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "AddTrack"), style: .plain, target: nil, action: #selector(AddTrackerButtonTapped))
        tracker.navigationBar.tintColor = .black
        tracker.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: datePicker)
        
        let stats = self.createNav(with: "Статистика", and: UIImage(named: "TabBarStatsButton"), vc: StatsController())
        self.setViewControllers([tracker, stats], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        return nav
    }
    
    //MARK: - Button
    
    @objc func AddTrackerButtonTapped(){
        print("add tracker")
    }
    
}
