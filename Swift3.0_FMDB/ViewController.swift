//
//  ViewController.swift
//  Swift3.0_FMDB
//
//  Created by HuangQibo on 17/4/4.
//  Copyright © 2017年 HuangQibo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var txtSqlComm: UITextView!
    
    
    @IBOutlet weak var viewScroll: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onbtnCreateTable_Clicked(_ sender: Any) {
        SQLiteManager.sharInstance.HQBCreateTable(tableName: "pub_UserInfo", arFields: ["usedName","age","phone","date"], arFieldsType: ["TEXT","INTEGER","TEXT","DATETIME"])
    }
    
    @IBAction func onbtnAddData_Clicked(_ sender: Any) {
        SQLiteManager.sharInstance.HQBInsertDataToTable(tableName: "pub_UserInfo", dicFields: ["usedName":"黄启博","age":24,"phone":"13750088412","date":NSDate.init(timeIntervalSinceNow:0)])

    }
   
    
    @IBAction func onbtnUpData_Clicked(_ sender: Any) {
         var result =  SQLiteManager.sharInstance.HQBModifyToData(tableName: "pub_UserInfo", dicFields: ["usedName":"黄启博","phone":"13750088412"], ConditionsKey: "id", ConditionsValue: 1)
    }
    
    @IBAction func onbtnSelectData_Clicked(_ sender: Any) {
        let result =  SQLiteManager.sharInstance.HQBSelectFromTable(tableName:  "pub_UserInfo", arFieldsKey: ["usedName","phone","age"])
        print(result)
    }

    @IBAction func onbtnDelete_Clicked(_ sender: Any) {
          SQLiteManager.sharInstance.HQBDeleteFromTable(tableName: "pub_UserInfo", FieldKey: "id", FieldValue: 1)
    }
    
    @IBAction func onbtnUpTable_Clicked(_ sender: Any) {
         SQLiteManager.sharInstance.HQBChangTable(tableName: "pub_UserInfo", newField: "QQ", arFields: ["usedName","age","phone","date","QQ"], arFieldsType: ["TEXT","INTEGER","TEXT","DATETIME","TEXT"])
    }
   
    @IBAction func onDropTable(_ sender: Any) {
        SQLiteManager.sharInstance.HQBDropTable(tableName: "pub_UserInfo")
        SQLiteManager.sharInstance.HQBDropTable(tableName: "old_Table")
    }
}

