//
//  ChallengesPresenter.swift
//  FeatherweightRouter-iOSDemo
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import Foundation
import UIKit
import FeatherweightRouter

func challengesPresenter(_ store: AppStore, _ student: StudentUser) -> UIPresenter {
    
    let challengescontroller = storyboard.instantiateViewController(withIdentifier: "ChallengesViewController") as! ChallengesViewController
    challengescontroller.viewModel = NavigationModel(
        title: "Tricky Words", 
        store: store, 
        backgroundColor: UIColor.red, 
        student: student)
    
    return Presenter(getPresentable: { _ in challengescontroller })
}
