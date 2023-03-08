//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by SonGoku on 12/02/2023.
//

import UIKit

final class RMTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
    }
    private func setupTabs() {
        let characterVC = RMCharacterViewController()
        let locationVC = RMLocationViewController()
        let episodesVC = RMEpisodeViewController()
        let settingsVC = RMSettingViewController()
        
        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        episodesVC.navigationItem.largeTitleDisplayMode = .automatic

//        characterVC.title = "Characters"
//        locationVC.title = "Location"
//        episodesVC.title = "Episodes"
//        settingsVC.title = "Settings"
        
        
        let navi1 = UINavigationController(rootViewController: characterVC)
        let navi2 = UINavigationController(rootViewController: locationVC)
        let navi3 = UINavigationController(rootViewController: episodesVC)
        let navi4 = UINavigationController(rootViewController: settingsVC)
        
        navi1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        navi2.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        navi3.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        navi4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        for nav in [navi1, navi2, navi3, navi4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        setViewControllers([navi1, navi2, navi3, navi4], animated: true)
    }
}

