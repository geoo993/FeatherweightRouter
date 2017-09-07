//
//  NewsPresenter.swift
//  FeatherweightRouter-iOSDemo
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import Foundation
import UIKit
import FeatherweightRouter

func newsPresenter(_ store: AppStore, _ student: StudentUser) -> UIPresenter {
    
    let newscontroller = storyboard.instantiateViewController(withIdentifier: "NewsViewController") as! NewsViewController
    newscontroller.viewModel = NavigationModel(
        title: "News", 
        store: store, 
        backgroundColor: UIColor.yellow, 
        student: student)
    
    return Presenter(getPresentable: { _ in newscontroller })
}
