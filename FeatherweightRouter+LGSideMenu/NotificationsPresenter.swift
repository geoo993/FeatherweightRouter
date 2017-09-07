//
//  NotificationsPresenter.swift
//  FeatherweightRouter-iOSDemo
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import Foundation
import UIKit
import FeatherweightRouter

func notificationsPresenter(_ store: AppStore, _ student: StudentUser) -> UIPresenter {
    
    let notificationscontroller = storyboard.instantiateViewController(withIdentifier: "NotificationsViewController") as! NotificationsViewController
    notificationscontroller.viewModel = NavigationModel(
        title: "Notifications", 
        store: store, 
        backgroundColor: UIColor.yellow, 
        student: student)

    return Presenter(getPresentable: { _ in notificationscontroller })
}
