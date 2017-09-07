//
//  BaseViewController.swift
//  FeatherweightRouter-iOS
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import UIKit

public protocol ControllerData {
    var title: String { get }
    var student: StudentUser { get }
}

struct NavigationModel: ControllerData {
    
    var title: String
    var student: StudentUser
    let backgroundColor: UIColor
    let store: AppStore
  
    init(title: String, store: AppStore, backgroundColor: UIColor, student: StudentUser) {
        self.title = title
        self.store = store
        self.backgroundColor = backgroundColor
        self.student = student
    }
    
    func navigateToHome (){
        self.store.dispatchRoute("home")
    }
    func navigateToNews (){
        self.store.dispatchRoute("home/news")
    }
    func navigateToNotification (){
        self.store.dispatchRoute("home/notifications")
    }
    func navigateToMyLibrary (){
        self.store.dispatchRoute("library")
    }
    func navigateToMyReading (){
        self.store.dispatchRoute("myReading")
    }
    func navigateToMyBook (){
        self.store.dispatchRoute("myReading/book")
    }
    func navigateToGames (){
        self.store.dispatchRoute("myReading/book/games")
    }
    func navigateToTrickyWords (){
        self.store.dispatchRoute("myReading/book/trickywords")
    }
    func navigateToChallenges (){
        self.store.dispatchRoute("myReading/book/challenges")
    }
    func navigateToReaderboard (){
        self.store.dispatchRoute("readerboard")
    }
    func navigateToProfile (){
        self.store.dispatchRoute("profile")
    }
    
}

public class BaseViewController: UIViewController {

    func initialSetup(){
        
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        //disableNavBackButton()
        //addHamburgerMenuButton( with: self, selector: #selector(tapped) )
        initialSetup()
    }
    
    func disableNavBackButton(){
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = nil
        //self.navigationItem.setLeftBarButton(nil, animated: true)
        //self.navigationItem.leftBarButtonItems = []
        
    }
    
    func changeBackButton (){
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
    }
    
    
    func addHamburgerMenuButton(with target: Any?, selector: Selector?){
        var image = UIImage(named: "hamburger_icon")
        image = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        //create a new button
        let button: UIButton = UIButton(type: .system)
        //set image for button
        button.setImage(image, for: UIControlState.normal)
        //add function for button
        button.addTarget(target, action: selector!, for: .touchUpInside)
        //set frame
        button.frame = CGRect(x:0, y:0, width:30, height:30)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        navigationItem.rightBarButtonItem = barButton
        
        //let menu1 = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: selector)
        //let menu2 = UIBarButtonItem(image: image, style: .plain, target: target, action: selector  )
        //navigationItem.rightBarButtonItem = menu2
    }
    
    @objc func tapped ( _ sender: UIBarButtonItem) {
        print("Tapped")
        
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
