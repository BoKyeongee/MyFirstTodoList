//
//  TodoViewController.swift
//  MyApp2
//
//  Created by 남보경 on 2023/08/03.
//

import UIKit
let todoCell = SegmentedControllerTableViewCell()
let table = SegmentedTableViewController()

var todo = ["고양이 밥 주기", "고양이 수발들기", "내배캠 출췤", "설거지하기"]
var isCompleted = [true, true, false, true]

class SegmentedTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    func trueArray() -> [String]? {
        var result = [String]()
        for (index, value) in isCompleted.enumerated()  {
            if value == true{
                result.append(todo[index])
            }
        }
        return result
    }
    
    func falseArray() -> [String]? {
        var result = [String]()
        for (index, value) in isCompleted.enumerated()  {
            if value == false{
                result.append(todo[index])
            }
        }
        return result
    }
    
    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var toDoTable: UITableView!
    @IBAction func plusButtonAct(_ sender: Any) {
        plusPressed(self)
    }
    @IBAction func switchAction(_ sender: UISwitch) {
        let cell = toDoTable.dequeueReusableCell(withIdentifier: "cell") as! SegmentedControllerTableViewCell
        let index:Int = returnIndexPath(sender)
        
        if isCompleted[index] == true {
            isCompleted[index] = false
            self.toDoTable.reloadData()
            return
        }
        else {
            isCompleted[index] = true
            cell.title.attributedText = nil
            self.toDoTable.reloadData()
            return
        }
    }
    @IBOutlet weak var plusButton: UIBarButtonItem!
    
    
    @IBAction func segAction(_ sender: Any) {
        self.toDoTable.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoTable.delegate = self
        toDoTable.dataSource = self
    }
    
    // cell 행 수 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(segControl.selectedSegmentIndex)
        return segControl.selectedSegmentIndex == 0 ? trueArray()?.count ?? 1 : falseArray()?.count ?? 1
    }

    // cell 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SegmentedControllerTableViewCell
        let empty = toDoTable.dequeueReusableCell(withIdentifier: "empty") as! SegmentedControllerTableViewCell
        if segControl.selectedSegmentIndex == 0 {
            cell.title.text = trueArray()?[indexPath.row]
            cell.isCompleted.isOn = true
            return cell
        }
        else if segControl.selectedSegmentIndex == 1 {
            cell.title.text = falseArray()?[indexPath.row]
            cell.isCompleted.isOn = false
            return cell
        }
    
        return empty
    }
    
    // cell 높이 지정
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if segControl.selectedSegmentIndex == 0 && trueArray() != nil { return 60 }
            else if segControl.selectedSegmentIndex == 1 && falseArray() != nil{ return 60 }
            return 720
        }

    @objc func plusPressed(_ sender: Any) {
        let popup = UIAlertController(title: "할 일 입력", message: "해야 할 일을 입력하세요", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let save = UIAlertAction(title: "저장", style: .default) { [self] (_) in
            // 저장 클릭 시 처리할 내용
            let txt = popup.textFields?[0]
            
            if txt!.text?.isEmpty != nil {
                todo.append(txt!.text!)
                isCompleted.append(true)
                print("입력값 : \(txt!.text!)")
                self.toDoTable.reloadData()
            }
            else {print("nil")}
        }
        popup.addAction(cancel)
        popup.addAction(save)
        popup.addTextField() {(tf) in
            tf.placeholder = "해야 할 일을 입력하세요"
        }
        
        self.present(popup, animated: true)
    }
    
    @objc func returnIndexPath(_ sender: UISwitch) -> Int {
        let contentView = sender.superview
        let cell = contentView?.superview as! SegmentedControllerTableViewCell
        let index = toDoTable.indexPath(for: cell)!.row
        print(index as Any)
        return index
    }
    
}
extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}

