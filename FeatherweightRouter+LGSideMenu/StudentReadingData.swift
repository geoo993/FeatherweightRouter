//
//  StudentReadingData.swift
//  FeatherweightRouter-iOS
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import Foundation

public protocol StudentReadingData {
    var book : Book { get }
    var currentPage : Int { get set }
    var status : BookStatus { get set }
    var startReadingTime : Date? { get set }
    var endReadingTime : Date? { get set }
    var awards : [StudentReadingAward] { get }
    
    func addAward(award: StudentReadingAward) -> Void
}

public enum BookStatus: Int {
    case toRead
    case reading
    case read
}

public enum StudentReadingAward : String {
    case perfectReading
    case fluentReading
    case fastReading
}

public class MockStudentReadingData : StudentReadingData {
    
    private var title: String = "" 
    private var pages: Int = 20
    public var book: Book {
        return MockBook(title: title, pages: pages)
    }
    public var currentPage = 1
    public var startReadingTime : Date?
    public var endReadingTime : Date? 
    public var bookStatus : Int = 0
    public var bookAwards = Array<StudentReadingAward>()
    
    public var status: BookStatus {
        get { return BookStatus.init(rawValue: bookStatus) ?? BookStatus.toRead }
        set { bookStatus = newValue.rawValue }
    }
    
    public var awards : [StudentReadingAward] {
        get { return bookAwards
            .flatMap { StudentReadingAward.init(rawValue: $0.rawValue)  }
        }
        set { 
            bookAwards.removeAll()
            bookAwards = newValue
        }
    }
    
    public func addAward(award: StudentReadingAward) {
        let realmAward = StudentReadingAward(rawValue: award.rawValue)
        bookAwards.append(realmAward!)
        return
    }
    
    public convenience init(title: String, pages: Int, currentPage: Int = 1, startReadingTime: Date? = nil, endReadingTime: Date? = nil, bookStatus: BookStatus = BookStatus.toRead) {
        self.init()
        self.title = title 
        self.pages = pages
        self.currentPage = currentPage
        self.startReadingTime = startReadingTime
        self.endReadingTime = endReadingTime
        self.bookStatus = bookStatus.rawValue
    }
    
}

