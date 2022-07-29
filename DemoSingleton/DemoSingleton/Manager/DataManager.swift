//
//  DataManager.swift
//  DemoSingleton
//
//  Created by MAC on 7/19/22.
//

import Foundation

class DataManager {
    //Biến khởi tạo
    static let shared = DataManager()
    
    //mảng các note đã lưu
    var arrNotes: [NoteModel] = [
            NoteModel(id: UUID().uuidString, dateCreated: Date(), title: "A", content: "A content"),
            NoteModel(id: UUID().uuidString, dateCreated: Date(), title: "B", content: "B content"),
            NoteModel(id: UUID().uuidString, dateCreated: Date(), title: "C", content: "C content"),
            NoteModel(id: UUID().uuidString, dateCreated: Date(), title: "D", content: "D content"),
        ]
    
    // Tao note moi
    func creatNote(item: NoteModel){
        arrNotes.append(item)
    }
    
    func updateNote(item: NoteModel){
        for i in 0..<arrNotes.count {
            if item.id == arrNotes[i].id {
                arrNotes[i].title = item.title
                arrNotes[i].content = item.content
                break
            }
        }
    }
    
    func removeNote(item: NoteModel){
        for i in 0..<arrNotes.count {
            if item.id == arrNotes[i].id {
                arrNotes.remove(at: i)
                break
            }
        }
        
    }
    
    func searchNote(text: String) -> [NoteModel]{
        return arrNotes.filter { (item) -> Bool in
            item.title.lowercased().contains(text.lowercased())
            
        }
    }
}
