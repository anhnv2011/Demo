//
//  AddNoteViewController.swift
//  DemoSingleton
//
//  Created by MAC on 7/19/22.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    @IBOutlet weak var contextTextView: UITextView!
    @IBOutlet weak var titleTextfield: UITextField!
    
    var itemNote: NoteModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    func setupUI(){
        //nếu là sửa thì là đổ dữ liệu
        if let itemNote = itemNote {
            contextTextView.text = itemNote.content
            titleTextfield.text = itemNote.title
        }
    }
    @IBAction func actionBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionSave(_ sender: Any) {
        if let title = titleTextfield.text, !title.isEmpty {
            
            //kiểm tra đang sửa hay là tạo mới
            if var  itemNote = itemNote {
                //dang sua
                itemNote.title = title
                itemNote.content = contextTextView.text
                DataManager.shared.updateNote(item: itemNote)
            } else {
                // tao moi
                //Save note
                let itemNote = NoteModel(id: UUID().uuidString,
                                         dateCreated: Date(),
                                         title: title,
                                         content: contextTextView.text)
                DataManager.shared.creatNote(item: itemNote)
                
            }
            navigationController?.popViewController(animated: true)
            
        } else {
            print("Tieu de ko duoc de trong")
        }
    }
    
    
}
