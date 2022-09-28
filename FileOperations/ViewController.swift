//
//  ViewController.swift
//  FileOperations
//
//  Created by Murat Sağlam on 19.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var ımageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func writeButton(_ sender: Any)
    {
        let message:String = textField.text!;
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        {
            
            let filePath = dir.appendingPathComponent("file.txt")
                
            do
            {
                try message.write(to: filePath, atomically:false, encoding: String.Encoding.utf8)
            }
            catch
            {
                print("Error Occurred While Writing File Path")
            }
        
        }
    }
    
    
    @IBAction func deleteButton(_ sender: Any)
    {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        {
            
            let filePath = dir.appendingPathComponent("file.txt")
                
            do
            {
                try FileManager.default.removeItem(at: filePath)
                textField.text=""
            }
            catch
            {
                print("Error Occurred While Delete File Path")
            }
        
        }
    }
    
    @IBAction func readButton(_ sender: Any)
    {
        
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        {
            
            let filePath = dir.appendingPathComponent("file.txt")
            
            if FileManager.default.fileExists(atPath: filePath.path)
            {
                
            do
            {
                textField.text = try String(contentsOf: filePath, encoding: String.Encoding.utf8)
            }
            catch
            {
                print("Error Occurred While Read File Path")
            }
            
            }
        }
        
    }
    
    @IBAction func ımageSavedButton(_ sender: Any)
    {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        {
            
            let filePath = dir.appendingPathComponent("wallpapers.png")
            let wallPaper = UIImage(named: "Batman")
                
            do
            {
                try wallPaper!.pngData()?.write(to: filePath)
            }
            catch
            {
                print("Wallpaper Occurred While Writing File Path")
            }
        
        }
    }
    
    @IBAction func ımageViewButton(_ sender: Any)
    {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        {
            
            let filePath = dir.appendingPathComponent("wallpapers.png")
                                      
            self.ımageView.image = UIImage(contentsOfFile: filePath.path)
                              
            
        }
    }
    
    @IBAction func ımageDeleteButton(_ sender: Any)
    {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        {
            
            let filePath = dir.appendingPathComponent("wallpapers.png")
            
            if FileManager.default.fileExists(atPath: filePath.path)
            {
            
            do
            {
                try FileManager.default.removeItem(at: filePath)

            }
            catch
            {
                print("Error Occurred While Delete Wallpaper")
            }
            
            }
        }
    }
}

