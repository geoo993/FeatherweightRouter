//
//  LibraryPresenter.swift
//  FeatherweightRouter-iOS
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import Foundation
import UIKit
import FeatherweightRouter

func libraryPresenter(_ store: AppStore, _ student: StudentUser) -> UIPresenter {
    
    let librarycontroller = storyboard.instantiateViewController(withIdentifier: "LibraryViewController") as! LibraryViewController
    librarycontroller.viewModel = NavigationModel(
        title: "Library", 
        store: store, 
        backgroundColor: UIColor.magenta, 
        student: student)
    
    return Presenter(getPresentable: { _ in librarycontroller })
}
