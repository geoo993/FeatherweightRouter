//
//  LGNavigationController.swift
//  LGSideMenuControllerDemo
//

import UIKit
import FeatherweightRouter

class LGNavigationController: UINavigationController {

    override var shouldAutorotate : Bool {
        return true
    }
    
    override var prefersStatusBarHidden : Bool {
        return UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation) && UI_USER_INTERFACE_IDIOM() == .phone
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default
    }
    
    override var preferredStatusBarUpdateAnimation : UIStatusBarAnimation {
        guard let isRightVisible = sideMenuController?.isRightViewVisible else { return UIStatusBarAnimation.none }
        return isRightVisible ? .slide : .fade
    }

    public var router: Router<UIViewController, String>!
    public var store : AppStore!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("navigation controller view did load ")
        

        //comment this out if using appDelegate
        coordinator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("navigation controller view will appear ")
        
    }
    
    
    func coordinator() //-> UIViewController 
    {
        
        let student = masterUser.students.first!
        store = AppStore() { _ = self.router.setRoute($0) }
        router = createRouter(store, student: student)
        store.setPath("home")
        
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
