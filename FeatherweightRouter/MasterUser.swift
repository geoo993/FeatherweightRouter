//
//  MasterUser.swift
//  FeatherweightRouter-iOS
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import Foundation
import UIKit


public protocol MasterUser {
    var email : String { get }
    var password : String { get }
    var students : [StudentUser] { get }
}

public class MockMasterUser : MasterUser {
    public var email : String = ""
    public var password : String = ""
    public var students: [StudentUser] = []
    public convenience init(email: String, password: String, students : [StudentUser]) {
        self.init()
        self.email = email
        self.password = password
        self.students = students
    }
    
}

