//
//  History.swift
//  QA
//
//  Created by Nurzhigit Smailov on 2/27/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation

class History: NSObject{
    var rightAnswer: Int?
    var wrongAnswer: Int?
    
    init(_ rightAnswer: Int,_ wrongAnswer:Int){
        self.rightAnswer = rightAnswer
        self.wrongAnswer = wrongAnswer
    }
}
