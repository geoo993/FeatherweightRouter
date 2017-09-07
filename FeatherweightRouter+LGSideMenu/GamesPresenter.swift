//
//  GamesPresenter.swift
//  FeatherweightRouter-iOS
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import Foundation
import UIKit
import FeatherweightRouter

func gamesPresenter(_ store: AppStore, _ student: StudentUser) -> UIPresenter {
    
    let gamescontroller = storyboard.instantiateViewController(withIdentifier: "GamesViewController") as! GamesViewController
    gamescontroller.viewModel = NavigationModel(
        title: "Games", 
        store: store, 
        backgroundColor: UIColor.red, 
        student: student)
    
    return Presenter(getPresentable: { _ in gamescontroller })
}
