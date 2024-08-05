//
//  TestController.swift
//  Tracker
//
//  Created by Всеволод Нагаев on 02.08.2024.
//

import UIKit

final class TrackerController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Трекеры"
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        setBackgroundImage()
        setUnderStarText()
        self.setupSearchController()
    }
    
    //MARK: - UI Components
    private var underStarText: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        lable.textColor = .black
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let searchController = UISearchController(searchResultsController: nil )
    
    
    
    //MARK: - UI Functions
    
    private func setupSearchController(){
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.placeholder = "Поиск"
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.definesPresentationContext = false
    }
    
    private func setBackgroundImage(){
        view.addSubview(backgroundImage)
        backgroundImage.image = .star
        backgroundImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        backgroundImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        backgroundImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        backgroundImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    private func setUnderStarText(){
        view.addSubview(underStarText)
        underStarText.text = "Что будем отслеживать?"
        underStarText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        underStarText.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 8).isActive = true
    }
}

//MARK: - Search Controller Functions

extension TrackerController: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        print("Debug print:", searchController.searchBar.text)
    }
    
    
}
