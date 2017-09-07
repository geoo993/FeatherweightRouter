//
//  BookData.swift
//  FeatherweightRouter-iOS
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import Foundation

public protocol Book {
    var title : String { get }
    var pages : Int { get }
}

public class MockBook : Book {
    
    public var title : String = ""
    public var pages : Int = 20
    
    public convenience init(title: String, pages: Int = 20) {
        self.init()
        self.title = title
        self.pages = pages
    }
    
    public static var availableBooks : [MockBook] {
        return [ 
            MockBook(title: "The Tale of Mr Tod", pages: 25),
            MockBook(title: "The Tailor of Gloucester", pages: 28),
            MockBook(title: "Goldilocks", pages: 15),
            MockBook(title: "Exploring London", pages: 16),
            MockBook(title: "Dinositting", pages: 21),
            MockBook(title: "Living in a Caslte", pages: 24),
            MockBook(title: "The Tale of Benjamin Bunny", pages: 28),
            MockBook(title: "Biff, Chip and Kipper - Get on", pages: 20),
            MockBook(title: "Cecily Parsleys Nursery Rhymes", pages: 16),
            MockBook(title: "The Story of a Fierce Bad Rabbit", pages: 19)
        ]
    }
    
}
