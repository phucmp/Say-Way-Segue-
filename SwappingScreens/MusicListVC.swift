//
//  MusicListVC.swift
//  SwappingScreens
//
//  Created by Paul Minh Pham on 6/23/17.
//  Copyright © 2017 Paul Minh Pham. All rights reserved.
//

import UIKit

class MusicListVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var songRequestLbl: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songRequestLbl.delegate = self

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1.0)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


    @IBAction func loadThirdScreenPressed(_ sender: Any) {
        let songTitle = songRequestLbl.text
        if songTitle != "" {
            performSegue(withIdentifier: "PlaySongVC", sender: songTitle)
        }
        else {
            songRequestLbl.placeholder = "Please enter a song"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PlaySongVC {
            
            if let song = sender as? String {
                destination.selectedSong = song
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
