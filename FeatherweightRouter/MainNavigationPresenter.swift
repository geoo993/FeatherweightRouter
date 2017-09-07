//
//  MainNavigationPresenter.swift
//  FeatherweightRouter-iOSDemo
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import Foundation
import UIKit
import FeatherweightRouter

func mainNavigationPresenter(_ title: String) -> UIPresenter {
    
    let navigationController = storyboard.instantiateViewController(withIdentifier: "NavigationViewController") as! NavigationViewController
    navigationController.tabBarItem.title = title
    navigationController.tabBarItem.image = UIImage(named: "placeholder-icon")
    
    return Presenter(
        getPresentable: { _ in navigationController },
        setChild: { _ in },
        setChildren: { navigationController.setViewControllers($0, animated: true) })
}

