import UIKit
import FeatherweightRouter

typealias UIPresenter = Presenter<UIViewController>
let storyboard = UIStoryboard(name: "Main", bundle: nil)

public class AppCoordinator {
    
    public var router: Router<UIViewController, String>!
    public var masterUser : MockMasterUser {
        return MockMasterUser(email: "ramesh@lexilabs.co", password: "ramesh@lexilabs.co", students: MockStudentUser.mockStudents)
    }
    public var availableBooks = MockBook.availableBooks
   
    public init() {
      
    }
   
    func coordinator() -> UIViewController {
        
        let student = masterUser.students.first!
        let store = AppStore() { _ = self.router.setRoute($0) }
        router = createRouter(store, student: student)
        
        store.setPath("myReading/book/challenges")
        
        return router.presentable
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
