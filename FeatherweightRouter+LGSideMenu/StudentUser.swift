//
//  StudentUser.swift
//  FeatherweightRouter-iOS
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import Foundation
import UIKit

public protocol StudentUser {
    var name : String { get }
    var age : Int { get }
    var readingData : [StudentReadingData] { get }
}

public class MockStudentUser : StudentUser {
    public var name : String = ""
    public var age : Int = 7
    public var readingData : [StudentReadingData] = []
  
    public convenience init(name: String, age: Int = 7, readingData : [StudentReadingData]) {
        self.init()
        self.name = name
        self.age = age
        self.readingData = readingData
    }
    
    
    public static var mockStudents : [MockStudentUser] {
        var readingData1 : [MockStudentReadingData] {
            return [
                MockStudentReadingData(title: MockBook.availableBooks[0].title, pages: MockBook.availableBooks[0].pages, currentPage: 2),
                MockStudentReadingData(title: MockBook.availableBooks[1].title, pages: MockBook.availableBooks[1].pages, currentPage: 2),
                MockStudentReadingData(title: MockBook.availableBooks[2].title, pages: MockBook.availableBooks[2].pages, currentPage: 2)
            ]
        }
        var readingData2 : [MockStudentReadingData] {
            return [
                MockStudentReadingData(title: MockBook.availableBooks[3].title, pages: MockBook.availableBooks[3].pages, currentPage: 2),
                MockStudentReadingData(title: MockBook.availableBooks[4].title, pages: MockBook.availableBooks[4].pages, currentPage: 2),
                MockStudentReadingData(title: MockBook.availableBooks[5].title, pages: MockBook.availableBooks[5].pages, currentPage: 2)
            ]
        }
        var readingData3 : [MockStudentReadingData] {
            return [
                MockStudentReadingData(title: MockBook.availableBooks[6].title, pages: MockBook.availableBooks[6].pages, currentPage: 2),
                MockStudentReadingData(title: MockBook.availableBooks[7].title, pages: MockBook.availableBooks[7].pages, currentPage: 2),
                MockStudentReadingData(title: MockBook.availableBooks[8].title, pages: MockBook.availableBooks[8].pages, currentPage: 2),
                MockStudentReadingData(title: MockBook.availableBooks[9].title, pages: MockBook.availableBooks[9].pages, currentPage: 2)
            ]
        }
        return [
            MockStudentUser(name: "Alex", age: 10, readingData: readingData1),
            MockStudentUser(name: "Dominic", age: 10, readingData: readingData2),
            MockStudentUser(name: "Rosa", age: 10, readingData: readingData3)
        ]
    }
    
    
}


