//
//  MyBookPresenter.swift
//  FeatherweightRouter-iOS
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import Foundation
import UIKit
import FeatherweightRouter

func myBookPresenter(_ store: AppStore, _ student: StudentUser) -> UIPresenter {

    let mybookcontroller = storyboard.instantiateViewController(withIdentifier: "MyBookViewController") as! MyBookViewController
    mybookcontroller.viewModel = NavigationModel(
        title: "Book", 
        store: store, 
        backgroundColor: UIColor.red, 
        student: student)
    
    return Presenter(getPresentable: { _ in mybookcontroller })
}
