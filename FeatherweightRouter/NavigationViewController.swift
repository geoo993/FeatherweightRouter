//
//  NavigationViewController.swift
//  FeatherweightRouter-iOSDemo
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import UIKit
import FeatherweightRouter

public class NavigationViewController: UINavigationController {

    public var router: Router<UIViewController, String>!
    public var masterUser : MockMasterUser {
        return MockMasterUser(email: "ramesh@lexilabs.co", password: "ramesh@lexilabs.co", students: MockStudentUser.mockStudents)
    }
    public var availableBooks = MockBook.availableBooks
    

    func mainNavigationPresenter(_ title: String) -> UIPresenter {
        
        self.tabBarItem.title = title
        self.tabBarItem.image = UIImage(named: "placeholder-icon")
        
        return Presenter(
            getPresentable: { _ in self },
            setChild: { _ in },
            setChildren: { self.setViewControllers($0, animated: true) })
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        //comment this out if using appDelegate
        coordinator()
        
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func coordinator() //-> UIViewController 
    {
        
        let student = masterUser.students.first!
        let store = AppStore() { _ = self.router.setRoute($0) }
        router = createRouter(store, student: student)
        
        store.setPath("myReading/book/challenges")
        
        print(router.presentable)
        
    }
    
    func createRouter(_ store: AppStore, student: StudentUser) -> Router<UIViewController, String> {
      
        return 
            Router(mainNavigationPresenter("Home")).stack([
                Router(homePresenter(store, student)).route(predicate: {$0 == "home"}, children: [
                    Router(newsPresenter(store, student)).route(predicate: {$0 == "home/news"}),
                    Router(notificationsPresenter(store, student)).route(predicate: {$0 == "home/notifications"})
                    ]),
                Router(libraryPresenter(store, student)).route(predicate: {$0 == "library"}),
                Router(myReadingPresenter(store, student)).route(predicate: {$0 == "myReading"}, children: [
                    Router(myBookPresenter(store, student)).route(predicate: {$0 == "myReading/book"}, children: [
                        Router(gamesPresenter(store, student)).route(predicate: {$0 == "myReading/book/games"}),
                        Router(trickywordsPresenter(store, student)).route(predicate: {$0 == "myReading/book/trickywords"}),
                        Router(challengesPresenter(store, student)).route(predicate: {$0 == "myReading/book/challenges"})
                        ])
                    ]),
                Router(readerBoardPresenter(store, student)).route(predicate: {$0 == "readerboard"}),
                Router(profilePresenter(store, student)).route(predicate: {$0 == "profile"}),
                ])
    }

}
