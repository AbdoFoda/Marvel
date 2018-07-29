//
//  MarvelViewController.swift
//  Marvel
//
//  Created by Abdulrahman on 7/26/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import UIKit

protocol MarvelViewProtocol {
    func getImagesFromPresenter(images:[UIImage?])
    func getCharacters(characters:[Result])
}



class MarvelViewController: UIViewController,MarvelViewProtocol {
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var charImages = [UIImage?]()
    var characters = [Result]()
    var presenter : MarvelPresenter?
    
    @IBOutlet weak var marvelTabel: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        marvelTabel.dataSource = self
        marvelTabel.delegate = self
        presenter = MarvelPresenter(view: self)
        
    }
    
    func getCharacters(characters:[Result]) {
        self.characters = characters
        self.marvelTabel.reloadData()
    }
    
    func getImagesFromPresenter(images: [UIImage?]) {
        charImages = images
        marvelTabel.reloadData()
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


extension MarvelViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarvelCell",for: indexPath) as! MarvelCell
        // let char = characters[indexPath.row]
        // cell.MarvelName.text = char.name
        //cell.MarvelDescription.text = char.description
        if(charImages.count == characters.count) {
            if (charImages[indexPath.row]) != nil {
                cell.marvelImage.image = charImages[indexPath.row]
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}






