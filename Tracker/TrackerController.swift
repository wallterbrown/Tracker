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
        self.view.backgroundColor = UIColor.white
        setPlusTrackButton()
        setHeaderText()
        setBackgroundImage()
        setUnderStarText()
    }
    
    private var underStarText: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        lable.textColor = .black
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    
    private var headText: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        lable.textColor = .black
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    
    private var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private var addTrackButton: UIButton = {
        let addTrackButton = UIButton(type: .custom)
        addTrackButton.setImage(UIImage(named: "AddTrack"), for: .normal)
        addTrackButton.addTarget(TrackerController.self, action: #selector(AddTrackerButtonTapped), for:.touchUpInside) //trackerCon.self?
        addTrackButton.translatesAutoresizingMaskIntoConstraints = false

        return addTrackButton
    }()
    
    private func setPlusTrackButton(){
        view.addSubview(addTrackButton)
        
        addTrackButton.widthAnchor.constraint(equalToConstant: 42).isActive = true
        addTrackButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        addTrackButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 6).isActive = true
        addTrackButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true //try to connect to superview
    }
    
    private func setHeaderText(){
        view.addSubview(headText)
        
        headText.text = "Трекеры"
        headText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        headText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
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
    
    @objc func AddTrackerButtonTapped(){
        
    }
}
