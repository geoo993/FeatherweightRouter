//
//  ReaderBoardPresenter.swift
//  FeatherweightRouter-iOS
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import Foundation
import UIKit
import FeatherweightRouter

func readerBoardPresenter(_ store: AppStore, _ student: StudentUser) -> UIPresenter {
    
    let readerboardcontroller = storyboard.instantiateViewController(withIdentifier: "ReaderBoardViewController") as! ReaderBoardViewController
    readerboardcontroller.viewModel = NavigationModel(
        title: "ReaderBoard", 
        store: store, 
        backgroundColor: UIColor.blue, 
        student: student)
    
    return Presenter(getPresentable: { _ in readerboardcontroller })
}
