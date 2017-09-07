//
//  ProfilePresenter.swift
//  FeatherweightRouter-iOS
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import Foundation
import UIKit
import FeatherweightRouter

func profilePresenter(_ store: AppStore, _ student: StudentUser) -> UIPresenter {
    
    let profilecontroller = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
    profilecontroller.viewModel = NavigationModel(
        title: "Profile", 
        store: store, 
        backgroundColor: UIColor.cyan, 
        student: student)
    
    return Presenter(getPresentable: { _ in profilecontroller })
}
