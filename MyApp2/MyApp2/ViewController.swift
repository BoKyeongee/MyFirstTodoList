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
    }
    
    
    @IBAction func doneButtonAct(_ sender: Any) {
    }
    @IBOutlet weak var doneButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // back 버튼 검정색 뒤로가기로 변경
        let backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: nil)
            backBarButtonItem.tintColor = .black  // 색상 변경
            self.navigationItem.backBarButtonItem = backBarButtonItem
        
    }


}
