//
//  PlusButtonPopup.swift
//  MyApp2
//
//  Created by 보경 on 2023/08/04.
//

import UIKit

// delegate protocol
protocol DisDelegate{
    func delegateString(text: String)
}

class PlusButtonPopup: UIViewController {
    
    var delegate: DisDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
