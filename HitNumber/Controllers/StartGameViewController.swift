//
//  StartGameViewController.swift
//  HitNumber
//
//  Created by yonekan on 2018/09/03.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit

class StartGameViewController: UIViewController {

    /// スタートボタン押下時の処理
    @IBAction func startGame(_ sender: UIButton) {
        // ゲーム画面に遷移
        performSegue(withIdentifier: "startGame", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
