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
    func adjustProgressView(withProgress progress:Float)
    func initSearchBar()
    func hideProgress()
}



class MarvelViewController: UIViewController,MarvelViewProtocol {
    
    @IBOutlet weak var progressView: UIProgressView!
    let searchController = UISearchController(searchResultsController: nil)
    var charImages = [UIImage?]()
    var characters = [Result]()
    var presenter : MarvelPresenter?
    
    @IBOutlet weak var marvelTabel: UITableView!
    

  
    @IBOutlet weak var loadingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        marvelTabel.dataSource = self
        marvelTabel.delegate = self
        presenter = MarvelPresenter(view: self)
    }
    func hideProgress() {
        self.loadingLabel.isHidden = true
        self.progressView.isHidden = true
    }
    func initSearchBar () {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Marvel"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func adjustProgressView(withProgress progress : Float) {
        progressView.isHidden = false
        loadingLabel.isHidden = false
        progressView.setProgress(progress, animated: true)
        loadingLabel.attributedText =  NSAttributedString(string: "Loading Marvel Data ...(\(progress*100)%)")
        if(Int(progress) == 1){
            loadingLabel.attributedText = NSAttributedString(string : "Done :)")
        }
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
         let char = characters[indexPath.row]
         cell.MarvelName.text = char.name
        //cell.MarvelDescription.text = char.description
        if(charImages.count == characters.count) {
            if (charImages[indexPath.row]) != nil {
                cell.marvelImage.image = charImages[indexPath.row]
                cell.marvelImage.layer.cornerRadius = CGFloat(cell.marvelImage.frame.width/CGFloat(10.0))
                cell.marvelImage.layer.masksToBounds = true
            }
        }
        
        return cell
    }
}


extension MarvelViewController :UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text!)
        if let searchText = searchController.searchBar.text {
            presenter?.getMarvelDataFromNetwork(name: searchText)
        }
    }
    
    
}






