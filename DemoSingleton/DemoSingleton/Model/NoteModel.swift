//
//  NoteModel.swift
//  DemoSingleton
//
//  Created by MAC on 7/19/22.
//

import Foundation
struct NoteModel {
    var id: String = UUID().uuidString
    var dateCreated: Date = Date()
    var title: String = ""
    var content: String = ""
}
