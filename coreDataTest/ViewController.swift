//
//  ViewController.swift
//  coreDataTest
//
//  Created by ハラダ アズサ on 2016/08/18.
//  Copyright © 2016年 ハラダ アズサ. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var memoField: UITextField!
    
    let ENTITY_NAME = "Memo"
    let ITEM_NAME = "text"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReadStore.sharedInstance.load()
        var aaa = ReadStore.sharedInstance.readDataList
        print(aaa)
        
        // text field
        memoField = UITextField(frame: CGRectMake(100, 100, 200, 30))
        memoField.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(memoField)
        
        // write button
        let writeBtn: UIButton = UIButton(frame: CGRectMake(100, 150, 200, 30))
        writeBtn.backgroundColor = UIColor.magentaColor()
        writeBtn.setTitle("write", forState: UIControlState.Normal)
        writeBtn.addTarget(self, action: #selector(ViewController.buttonTapped(_:)), forControlEvents: .TouchUpInside)

        self.view.addSubview(writeBtn)
        
        // read button
        let readBtn: UIButton = UIButton(frame: CGRectMake(100, 200, 200, 30))
        readBtn.backgroundColor = UIColor.orangeColor()
        readBtn.setTitle("read", forState: UIControlState.Normal)
       // readBtn.addTarget(self, action: "readData", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(readBtn)
        
        memoField.text = readData()
        
    }
    
    /**
     writeボタン押下時
     
     - parameter sender: ボタン
     
     - returns: 割り算の結果
     */
    func buttonTapped(sender: UIButton) {
        writeData(memoField.text!)
        //Button Tapped
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /**
     データ登録/更新
     
     - parameter txtMemo: テキストエリア入力項目
     
     - returns: 結果判定
     */
    func writeData(txtMemo: String) -> Bool{
        var ret = false
        ReadStore.sharedInstance.saveReadData("aaa", flag: "iii", viewId: "uuu")
        ReadStore.sharedInstance.load()
        var aaa = ReadStore.sharedInstance.readDataList[0]
        var aaaaa = aaa.valueForKey("flag") as? String
        print(aaa)
        print(aaaaa)
        
//        
//        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
//        let context: NSManagedObjectContext = appDelegate.managedObjectContext
//        let request = NSFetchRequest(entityName: ENTITY_NAME)
//        request.returnsObjectsAsFaults = false
//        
//        do {
//            let results: Array = try context.executeFetchRequest(request)
//            if (results.count > 0 ) {
//                // 検索して見つかったらアップデートする
//                let obj = results[0] as! NSManagedObject
//                let txt = obj.valueForKey(ITEM_NAME) as! String
//                obj.setValue(txtMemo, forKey: ITEM_NAME)
//                print("UPDATE \(txt) TO \(txtMemo)")
//                appDelegate.saveContext()
//                ret = true
//                
//            } else {
//                // 見つからなかったら新規登録
//                let entity: NSEntityDescription! = NSEntityDescription.entityForName(ENTITY_NAME, inManagedObjectContext: context)
//                let obj = Memo(entity: entity, insertIntoManagedObjectContext: context)
//                obj.setValue(txtMemo, forKey: ITEM_NAME)
//                print("INSERT \(txtMemo)")
//                do {
//                    try context.save()
//                } catch let error as NSError {
//                    // エラー処理
//                    print("INSERT ERROR:\(error.localizedDescription)")
//                }
//                ret = true
//            }
//        } catch let error as NSError {
//            // エラー処理
//            print("FETCH ERROR:\(error.localizedDescription)")
//        }
        return ret
    }
    
    // データ読み込み
    func readData() -> String{
        var ret = ""
//        
//        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
//        let context: NSManagedObjectContext = appDelegate.managedObjectContext
//        let request = NSFetchRequest(entityName: ENTITY_NAME)
//        request.returnsObjectsAsFaults = false
//        
//        do {
//            let results : Array = try context.executeFetchRequest(request)
//            if (results.count > 0 ) {
//                // 見つかったら読み込み
//                let obj = results[0] as! NSManagedObject
//                let txt = obj.valueForKey(ITEM_NAME) as! String
//                print("READ:\(txt)")
//                ret = txt
//            }
//        } catch let error as NSError {
//            // エラー処理
//            print("READ ERROR:\(error.localizedDescription)")
//        }
        return ret
    }
    
    /**
     データ削除
     
     - returns: 結果判定
     */
    func deleteData() -> Bool {
        var ret = false
        
//        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
//        let context: NSManagedObjectContext = appDelegate.managedObjectContext
//        let request = NSFetchRequest(entityName: ENTITY_NAME)
//        request.returnsObjectsAsFaults = false
//        
//        do {
//            let results : Array = try context.executeFetchRequest(request)
//            if (results.count > 0 ) {
//                // 見つかったら削除
//                let obj = results[0] as! NSManagedObject
//                let txt = obj.valueForKey(ITEM_NAME) as! String
//                print("DELETE \(txt)")
//                context.deleteObject(obj)
//                appDelegate.saveContext()
//            }
//            ret = true
//        } catch let error as NSError {
//            // エラー処理
//            print("FETCH ERROR:\(error.localizedDescription)")
//        }
        return ret
    }


}

