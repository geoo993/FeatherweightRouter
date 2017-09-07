//
//  HomePresente.swift
//  FeatherweightRouter-iOS
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import Foundation
import UIKit
import FeatherweightRouter

func homePresenter(_ store: AppStore, _ student: StudentUser) -> UIPresenter {
    
    let homeviewcontroller = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    homeviewcontroller.viewModel = NavigationModel(
        title: "Home", 
        store: store, 
        backgroundColor: UIColor.yellow, 
        student: student)
    
    return Presenter(getPresentable: { _ in homeviewcontroller })
}

