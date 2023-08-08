//
//  TodoViewController.swift
//  MyApp2
//
//  Created by 남보경 on 2023/08/03.
//

import UIKit

let getData = PopupViewController()

class TodoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tempData: [String:String]?

    @IBOutlet weak var toDoTable: UITableView!

    var emoji = ["🚨", "⚠️", "🔴", "🟢", "🟠", "🔥"]
    var todo = ["고양이 밥 주기", "고양이 수발들기", "내배캠 출췤", "설거지하기", "세차하기", "iOS 공부하기"]
    var info = [
        "입 짧은 두 냥이가 배고프지 않게 극진히 모셔야 합니다.",
        "집사는 틈틈이 두 냥이가 심심하지 않도록 사랑을 주고 놀아줘야 합니다.",
        "12시간 채우고 24시 넘지않게 꼭 체크하기",
        "설거지 좀 하고 살자...",
        "세차 좀 하고 살자...",
        "빈 둑에 물을 붓는 것 같지만 차오를 것이라고 믿는 콩쥐의 심정으로!"
    ]
    var dates = [
        "2023/08/03",
        "2023/08/03",
        "2023/08/03",
        "2023/08/03",
        "2023/08/07",
        "2023/08/03"
    ]


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.toDoTable.delegate = self
        self.toDoTable.dataSource = self
        

        let plusButtonImage = UIImage(named: "plus")!
        let plusButton = UIButton(frame: CGRect(x: 0, y: 0, width: plusButtonImage.size.width, height: plusButtonImage.size.height))
        plusButton.tintColor = .black
        plusButton.setImage(plusButtonImage, for: .normal)
        plusButton.addTarget(self, action: #selector(plusPressed), for: .touchUpInside)

        let plusBarButton = UIBarButtonItem(customView: plusButton)
        
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5)

        plusButton.configuration = configuration
        self.navigationItem.rightBarButtonItems = [plusBarButton]
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.count
    }
    
    // cell 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoTable.dequeueReusableCell(withIdentifier: "toDoTable", for: indexPath) as! TodoListViewCell
    
        cell.title.text = todo[indexPath.row]
        cell.importance.text = emoji[indexPath.row]
        cell.details.text = info[indexPath.row]
        cell.dueDate.text = dates[indexPath.row]
        cell.isCompleted.isOn = true
        cell.isCompleted.tintColor = UIColor.black
        cell.isCompleted.addTarget(self, action: #selector(onClickSwitch), for: .valueChanged)

        return cell
    }
    
    @objc func onClickSwitch() {
        print("switch value changed")
    }
    
    //This method will call when you press button.
    @objc private func plusPressed(_ sender: Any) {
        print("plus")
        let popupViewControllerID = UIStoryboard(name: "Main", bundle: .none).instantiateViewController(identifier: "popupViewControllerID") as! PopupViewController
        popupViewControllerID.delegate = self
        popupViewControllerID.view.backgroundColor = .white
        navigationController?.pushViewController(popupViewControllerID, animated: true)
    }
    
    
  
}

extension TodoViewController: UpdatedDataDelegate {
    func updateData(_ newData: [[String]]) {
        self.todo = newData[0]
        self.emoji = newData[1]
        self.info = newData[2]
        self.dates = newData[3]
        self.toDoTable.reloadData()
    }
}
