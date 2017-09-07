//
//  DemoAppCoordinator.swift
//  FeatherweightRouter-iOS
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import Foundation
import UIKit
import FeatherweightRouter

func demoAppCoordinator() -> UIViewController {
    
    var router: Router<UIViewController, String>!
    let store = AppStore() { _ = router.setRoute($0) }
    router = createDemoRouter(store)
    
    store.setPath("welcome")
    
    return router.presentable
}

func createDemoRouter(_ store: AppStore) -> Router<UIViewController, String> {
    
    return Router(tabBarPresenter()).junction([
        
        Router(navigationPresenter("Welcome")).stack([
            Router(welcomePresenter(store)).route(predicate: {$0 == "welcome"}, children: [
                Router(registrationPresenter(store)).route(predicate: {$0 == "welcome/register"}, children: [
                    Router(step2Presenter(store)).route(predicate: {$0 == "welcome/register/step2"}),
                    ]),
                Router(loginPresenter(store)).route(predicate: {$0 == "welcome/login"}),
                ]),
            ]),
    
        Router(aboutPresenter(store)).route(predicate: {$0 == "about"})
    ])
}
