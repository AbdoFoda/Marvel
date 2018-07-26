//
//  MarvelViewController.swift
//  Marvel
//
//  Created by Abdulrahman on 7/26/18.
//  Copyright © 2018 Ahmad Ragab. All rights reserved.
//

import UIKit

class MarvelViewController: UIViewController{
    
    var characters = [Result]()

    @IBOutlet weak var marvelTabel: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        marvelTabel.dataSource = self
        marvelTabel.delegate = self
        marvelTabel.register(UINib.init(nibName:"MarvelCell",bundle:nil), forCellReuseIdentifier: "MarvelCell")
        CharacterRepositoryUseCase().getCharactersData(completion: {(characters:[Result]) in
           self.characters = characters
           self.marvelTabel.reloadData()
        }
        )
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        cell.MarvelName.text = characters[indexPath.row].name
        cell.MarvelDescription.text = characters[indexPath.row].description
        // here we will call our Image view extension
        return cell
    }
    
}






