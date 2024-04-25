//
//  NoteModel.swift
//  meeting_notes
//
//  Created by Ground 2 on 25/04/24.
//

import Foundation

class NoteModel{
    var clientName: String = ""
    var subject: String = ""
    var createDate: String = ""
    var updateDate: String = ""
    var labels: [String] = [""]
    
    init(clientName: String, subject: String, createDate: String, updateDate: String, labels: [String]) {
        self.clientName = clientName
        self.subject = subject
        self.createDate = createDate
        self.updateDate = updateDate
        self.labels = labels
    }
}
