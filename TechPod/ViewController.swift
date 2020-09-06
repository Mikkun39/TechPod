//
//  ViewController.swift
//  TechPod
//
//  Created by 高山瑞基 on 2020/09/05.
//  Copyright © 2020 Takayama Mizuki. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //StoryBoardで使うTableViewを宣言
    @IBOutlet var table: UITableView!
    
    //曲名をいれるための配列
    var songNameArray = [String]()
    //曲のファイルを入れるための配列
    var fileNameArray = [String]()
    //音楽家の番号を入れるための配列
    var imageNameArray = [String]()
    
    //音楽を再生するための変数
    var audioPlayer : AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //テーブルビューのデータソースメソッドはViewControllerクラスに書く設定
        table.dataSource = self
        
        //テーブルビューのデリゲートメソッドはViewControllerメソッドに書く設定
        table.delegate = self
        
        //songNameArrayに曲名をいれる
        songNameArray = ["カノン", "エリーゼのために", "G戦上のアリア" ]
        
        //fileNameArrayにファイル名を入れていく
        fileNameArray = ["cannon", "elise" , "aria"]
        
        //imageNameArrayに曲の画像を入れる
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg", "Bach.jpg"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    //ID付きのセルを取得して、セル付属のtextLabelに「テスト」と表示させる
    func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //セルにsongNameArrayの曲名を表示
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        //セルに音楽家の画像を表示
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath[indexPath.row]])
        return cell!
    }
    
    //セルが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました")
        
        //音楽ファイルの設定
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        //再生の準備
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        //音楽を再生
        audioPlayer.play()
    }

}

