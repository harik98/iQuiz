//
//  DataSource.swift
//  iQuiz
//
//  Created by Jerry Li on 2/18/18.
//  Copyright © 2018 Jerry Li. All rights reserved.
//

import Foundation


class DataSource {
    static let shared = DataSource()
    var allData: Quiz
    var currentCategory: Int
    
    init(){
        
    }
    
    func setQuiz(quiz: Quiz) {
        DataSource.allData = quiz
    }
    
    func setCategory (_ num: Int){
        DataSource.currentCategory = num
    }
}
