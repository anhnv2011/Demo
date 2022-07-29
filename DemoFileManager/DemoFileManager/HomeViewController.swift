//
//  HomeViewController.swift
//  DemoFileManager
//
//  Created by MAC on 7/29/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /*Bundle path*/

        getURLByBundle()
        readFileBundle(name: "TestFileManager", withExtension: "rtf")
        
        
        
        /*Document path*/
        print("Documents Directory Path: \(getDocumentsDirectory().absoluteString)")
        print("Append Path Component:  \(getDocumentsFilePath(fileName: "FileManager2.rtf"))")
        //
        print(checkFileExist(fileName: "FileManager2.rtf"))
        
        //dung extension
        let fileUrl = getDocumentsFilePath(fileName: "FileManager2.rtf")
        print("dung extension check co ton tai ko \(fileUrl.checkFileExist2())")
        
        guard let data = readFileDocumentPath(fileName: "FileManager2.rtf") else {return}
        guard let content = String(data: data, encoding: .utf8) else {return}
        print(content)
        
        

        //write in file (ghi đè)
        // infor
        let stringContent = "Hello, I am supperman33232!"
        let fileName = "FileManager2.rtf"
        // write file
        if let stringData = stringContent.data(using: .utf8) {
            let okay = writeFile(fileName: fileName, content: stringData)
            if okay {
                print("DONE")
            } else {
                print("FAILED")
            }
        }
        // read file
        if let dataFile = readFileDocumentPath(fileName: fileName) {
            let content = String(data: dataFile, encoding: .utf8) ?? "n/a"
            print("File: \(fileName) : \(content)")
        }
        
        
        
        //Attributes
        getAttributes(fileName: "FileManager2.rtf")
    }


    //dùng bundle để lấy đường dẫn của 1 file, với cách dùng bundle thì tìm được luôn còn với cách dùng DocumentsDirectory thì phải tìm được nơi chứa của app rồi mới tìm được đường dẫn
    //note: Nó là riêng cho project
    func getURLByBundle(){
        // Lấy đường dẫn của 1 file được đính kèm trong project(bundle ứng dụng), với forResource là tên và withExtension là đuôi file
        guard let filePath = Bundle.main.url(forResource: "TestFileManager", withExtension: "rtf") else {
            print("no exitst")
            return
        } // kiểu đường dẫn
        
        
        print("bundle path url: \(filePath)")
        
       guard let path = Bundle.main.path(forResource: "TestFileManager", ofType: "rtf") // kiểu string
       else {
        return
       }
        print("bundle path string: \(path)")
        
    }
    func readFileBundle(name: String, withExtension: String){
        
        // lấy đường dẫn
        guard let txtFileURL = Bundle.main.url(forResource: name, withExtension: withExtension) else {
            return
        }
        do {
            // khởi tạo 1 data với phương thức contentOf
            let data = try Data(contentsOf: txtFileURL)
            // ép kiểu data về định dạng string
            let content = String(data: data, encoding: .utf8)
            print("Content File: \(content ?? "n/a")")
        } catch {
            print(error.localizedDescription)
        }
        
//
//        //Ngoài ra swift có hỗ trợ vài kiểu định dạng cơ bản, ta có thể dùng luôn
//        do {
//            let content2 = try String(contentsOf: txtFileURL)
//            print("Content File: \(content2)")
//        } catch {
//            print(error.localizedDescription)
//        }
        
    }
   
    
    
    
    
    
    //MARK:- NGOÀI RA TRONG IOS CÒN CÓ NƠI ĐỂ LƯU DỮ LIỆU CHO RIÊNG BẠN
    // lấy đường dẫn nơi lưu dữ liệu riêng của app trên máy ios, nó khác với bundle ở trên
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    func getDocumentsFilePath(fileName: String) -> URL{
        let doccumentFilePath = getDocumentsDirectory()
        let filePath = doccumentFilePath.appendingPathComponent(fileName) //phương thức .appendingPathComponent(_) của chính nó để thêm các phần đường dẫn tiếp theo
        return filePath
    }
    
    
    
    //kiểm tra xem có tồn tại
    func checkFileExist(fileName: String) -> Bool {
        let filePath = getDocumentsFilePath(fileName: fileName)
        print("asdds: \(filePath)")
        let fileManger = FileManager.default
        
        if fileManger.fileExists(atPath: filePath.path) {
            print("FILE: \(fileName) is AVAILABLE")
            return true
        } else {
            print("FILE: \(fileName) NOT AVAILABLE")
            return false
        }
    }
    
    
    func readFileDocumentPath(fileName: String) -> Data? {
        if checkFileExist(fileName: fileName) {
            let filePath = getDocumentsFilePath(fileName: fileName)
            do {
                let data = try Data(contentsOf: filePath)
                return data
            } catch {
                print("Can not read file")
                return nil
            }
        } else {
            print("File not available.")
            return nil
        }
    }
    
    
    // Chỉ ghi file ở document, còn ở bundle chỉ đọc được
    func writeFile(fileName: String, content: Data) -> Bool {
        let filePath = getDocumentsFilePath(fileName: fileName)
        
        do {
            try content.write(to: filePath)
            return true
            
        } catch {
            print("Can not write file")
            return false
        }
    }
    
    func getAttributes(fileName: String){
        let fileSupperManPath = getDocumentsFilePath(fileName: fileName).path
        do {
            let fileManager = FileManager.default
            let attributes = try fileManager.attributesOfItem(atPath: fileSupperManPath)
            print("File Attributes:")
            for item in attributes {
                print(item)
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
}


extension URL    {
    func checkFileExist2() -> Bool {
        let path = self.path
        if (FileManager.default.fileExists(atPath: path))   {
            print("FILE AVAILABLE")
            return true
        }else        {
            print("FILE NOT AVAILABLE")
            return false;
        }
    }
}
