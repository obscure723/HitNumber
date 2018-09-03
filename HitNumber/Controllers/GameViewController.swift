//
//  GameViewController.swift
//  HitNumber
//
//  Created by yonekan on 2018/09/03.
//  Copyright © 2018年 yonekan. All rights reserved.
//

import UIKit

let perfectScore = 3

class GameViewController: UIViewController ,UIPickerViewDataSource ,UIPickerViewDelegate {

    @IBOutlet var picker: UIPickerView!
    
    var pickerContents = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    /// 正解の数字を保持する変数
    var leftCorrectNum: Int = Int()
    var centerCorrectNum: Int = Int()
    var rightCorrectNum: Int = Int()
    
    /// ピッカービューの列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    /// ピッカービューの行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerContents.count
    }
    
    /// ピッカービューに表示する文字
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerContents[row])
    }
    
    // チェックボタン押下時の処理
    @IBAction func check(_ sender: UIButton) {
        // 正解しているカウントを取得
        let correctCount = judge()
        
        if correctCount == perfectScore {
            // 満点の場合
            showGameClearAlert()
        } else {
            // 満点以外の場合
            showCorrectCountAlert(correctCount: correctCount)
        }
        
    }
    
    /// ゲームクリアのアラートを表示する
    private func showGameClearAlert() {
        //アラートを作る
        let alertController = UIAlertController(
            title: "ゲームクリア！", message: "おめでとうございます", preferredStyle: .alert)
        
        //OKボタンを追加
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in self.performSegue(withIdentifier: "backStartPage", sender: nil)}))
        
        //アラートを表示する
        present(alertController, animated: true, completion: nil)
    }
    
    /// チェック結果のアラートを表示するaf
    private func showCorrectCountAlert(correctCount: Int) {
        var message: String = String()
        if 0 == correctCount {
            message = "どの桁も違います"
        } else {
            message = String(correctCount) + "個あっています"
        }
        
        //アラートを作る
        let alertController = UIAlertController(
            title: "残念！", message: message, preferredStyle: .alert)
        
        //OKボタンを追加
        alertController.addAction(UIAlertAction(title: "諦める", style: .default, handler: {action in self.performSegue(withIdentifier: "backStartPage", sender: nil)}))
        
        //OKボタンを追加
        alertController.addAction(UIAlertAction(title: "もう一度", style: .default))
        
        //アラートを表示する
        present(alertController, animated: true, completion: nil)
    }
    
    /// 正解か判定する
    private func judge() -> Int {
        // ユーザーの入力値を取得
        let inputLeftVal = pickerContents[picker.selectedRow(inComponent: 0)]
        let inputCenterVal = pickerContents[picker.selectedRow(inComponent: 1)]
        let inputRightVal = pickerContents[picker.selectedRow(inComponent: 2)]
        
        var correctCount = 0
        
        if inputLeftVal == leftCorrectNum {
            correctCount = correctCount + 1
        }
        
        if inputCenterVal == centerCorrectNum {
            correctCount = correctCount + 1
        }
        
        if inputRightVal == rightCorrectNum {
            correctCount = correctCount + 1
        }
        
        return correctCount
    }
    
    /// 1から9の乱数を作成する
    private func getRandomNum() -> Int {
        let min = 1
        let range = 9
        
        let num = arc4random_uniform(UInt32(range)) + UInt32(min)
        return num.hashValue
    }
    
    /// ゲームの初期処理を行う
    private func initGame() -> Void {
        leftCorrectNum = getRandomNum()
        centerCorrectNum = getRandomNum()
        rightCorrectNum = getRandomNum()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.dataSource = self
        picker.delegate = self
        
        initGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
