//
//  MyReadingPresenter.swift
//  FeatherweightRouter-iOS
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import Foundation
import UIKit
import FeatherweightRouter

func myReadingPresenter(_ store: AppStore, _ student: StudentUser) -> UIPresenter {
    
    let myreadingcontroller = storyboard.instantiateViewController(withIdentifier: "MyReadingViewController") as! MyReadingViewController
    myreadingcontroller.viewModel = NavigationModel(
        title: "My Reading", 
        store: store, 
        backgroundColor: UIColor.orange, 
        student: student)
    
    
    return Presenter(getPresentable: { _ in myreadingcontroller })
}
