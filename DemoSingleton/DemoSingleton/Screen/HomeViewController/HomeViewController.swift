//
//  HomeViewController.swift
//  DemoSingleton
//
//  Created by MAC on 7/19/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var containerNavView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var arrNote = DataManager.shared.arrNotes
//    var arrNote = shared2.arrNotes
    var isDetail = false {
        didSet {
            //khối lệnh trong didset được thực hiện khi biến checkin được gán giá trị mới
            collectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureCollectionView()
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        arrNote = DataManager.shared.arrNotes
        collectionView.reloadData()
    }

    func setupUI(){
        navigationView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        //configure textfield
        searchTextField.delegate = self
//        searchTextField.leftViewMode = .always
//        searchTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        
    }
    func configureCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "NoteCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "noteCell")
    }
    @IBAction func actionAddNewNote(_ sender: Any) {
     let vc = AddNoteViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionMore(_ sender: Any) {
        let aleart = UIAlertController(title: "View", message: "Choose View", preferredStyle: .actionSheet)
        aleart.addAction(UIAlertAction(title: "Detail", style: .default, handler: { (_) in
            self.isDetail = true
        }))
        aleart.addAction(UIAlertAction(title: "Collection", style: .default, handler: { (_) in
            self.isDetail = false
        }))
        aleart.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            
        }))
        present(aleart, animated: true, completion: nil)
    }
    
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrNote.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "noteCell", for: indexPath) as! NoteCollectionViewCell
        
        cell.bindData(item: arrNote[indexPath.row])
        cell.handleDelete = {
            DataManager.shared.removeNote(item: self.arrNote[indexPath.row])
            self.arrNote = DataManager.shared.arrNotes
            collectionView.reloadData()
        }
        if (indexPath.row % 2 == 0) {
//            cell.contbackgroundColor = .cyan
            cell.containerView.backgroundColor = .cyan
        } else {
//            cell.backgroundColor = .brown
            cell.containerView.backgroundColor = .brown
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        if isDetail {
            
            return CGSize(width: width, height: 160)
        } else {
            return CGSize(width: (width-16)/2 , height: (width-16)/2)
        }
       
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = AddNoteViewController()
        
        
        
        vc.itemNote = arrNote[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension HomeViewController:UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            print("dasdada")
            arrNote = DataManager.shared.searchNote(text: text)
            print(DataManager.shared.searchNote(text: text))
        } else {
            arrNote = DataManager.shared.arrNotes
        }
        collectionView.reloadData()
    }
}
