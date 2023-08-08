//
//  PopupViewController.swift
//  MyApp2
//
//  Created by 보경 on 2023/08/04.
//

import UIKit

protocol UpdatedDataDelegate: AnyObject {
    func updateData(_ newData: [[String]])
}

class PopupViewController: UIViewController {
    
    let addData =  TodoViewController()
    var tempData: [String:String] = [:]

    weak var delegate : UpdatedDataDelegate?
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var dueChoice: UIDatePicker!
    @IBOutlet weak var detailsTextInput: UITextField!
    @IBOutlet weak var todoTextInput: UITextField!
    
    @IBOutlet weak var importanceLable: UILabel!
    @IBOutlet weak var dueLable: UILabel!
    @IBOutlet weak var detailsLable: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet var popupWrapView: UIView!
    @IBOutlet weak var addingStack: UIStackView!
    @IBOutlet weak var popupView: UIView!
    
    
    @IBAction func todoAct(_ sender: Any) {
        let tempTodoData = todoTextInput.text!
        tempData["title"] = tempTodoData
    }

    @IBOutlet weak var popupButton: UIButton!
    @IBAction func saveAction(_ sender: Any) {
        // 입력값 nil인 경우 경고창 추가하기
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd a h시 mm분"
            dateFormatter.amSymbol = "오전"
            dateFormatter.pmSymbol = "오후"
            
        let dueInfo = dateFormatter.string(from: self.dueChoice.date)
        tempData["due"] = dueInfo
        
        let tempDetailsData = detailsTextInput.text!
        tempData["details"] = tempDetailsData
        print(tempData)
        
        addData.todo.append(tempData["title"]!)
        addData.emoji.append(tempData["importance"]!)
        addData.info.append(tempData["details"]!)
        addData.dates.append(tempData["due"]!)
        
        let newData = [addData.todo, addData.emoji, addData.info, addData.dates]

        self.delegate?.updateData(newData)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func cancelAction(_ sender: Any) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let emojiArray = ["🚨","⚠️","🔥","⚪️","🟢"]
        let urgent = UIAction(title: "🚨 긴급함") { (action) in self.tempData["importance"] = emojiArray[0]}
        let important = UIAction(title: "⚠️ 매우 중요함") { (action) in self.tempData["importance"] = emojiArray[1]}
        let hard = UIAction(title: "🔥 열심히 달려야함") { (action) in self.tempData["importance"] =  emojiArray[2]}
        let notUrgent = UIAction(title: "⚪️ 급하지 않음") { (action) in self.tempData["importance"] =  emojiArray[3]}
        let freely = UIAction(title: "🟢 기한 없음") { (action) in self.tempData["importance"] = emojiArray[4]}
        let menu = UIMenu(title: "🔎 중요도 선택", options: .displayInline, children: [urgent, important, hard, notUrgent, freely])
        popupButton.menu = menu
        popupButton.showsMenuAsPrimaryAction = true
    }
    
}
