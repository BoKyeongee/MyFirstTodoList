//
//  ViewController.swift
//  MyApp2
//
//  Created by 남보경 on 2023/08/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var willButton: UIButton!
    @IBAction func willButtonAct(_ sender: Any) {
        // 화면전환버튼
        let todoViewControllerID = UIStoryboard(name: "Main", bundle: .none).instantiateViewController(identifier: "todoViewControllerID") as! TodoViewController
        todoViewControllerID.title = "할 일 목록"
        todoViewControllerID.view.backgroundColor = .white
        navigationController?.pushViewController(todoViewControllerID, animated: true)
    }
    
    
    @IBAction func doneButtonAct(_ sender: Any) {}
    @IBOutlet weak var doneButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(willButton)
        
        // navigaiton back 버튼 검정색 뒤로가기로 변경
        let backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: nil)
            backBarButtonItem.tintColor = .black  // 색상 변경
            self.navigationItem.backBarButtonItem = backBarButtonItem
        
       
    }

}
//extension UIStoryboard {
//    static func viewController<T: UIViewController>(from storyboardName: String = "Main", bundle: Bundle? = nil) -> T {
//        let identifier = String(describing: T.self)
//        return UIStoryboard(name: storyboardName, bundle: bundle).instantiateViewController(withIdentifier: identifier) as! T
//    }
//}
