import UIKit
import SwiftGifOrigin

protocol MarvelViewProtocol {
    func getImagesFromPresenter(images:[UIImage?])
    func getCharacters(characters:[Result])
    func adjustProgressView(withProgress progress:Float)
    func initSearchBar()
    func hideProgressBar()
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
    func hideProgressBar() {
        self.loadingLabel.isHidden = true
        self.progressView.isHidden = true
    }
    func initSearchBar () {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Marvel"
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
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
        self.charImages = images
        self.marvelTabel.reloadData()
    }
    
    var selectedChar : Result?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" && selectedChar != nil{
            if let details = segue.destination as? DetailsViewController {
                details.setChar(character: selectedChar!)
            }
        }
    }
    
    
}


extension MarvelViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedChar = characters[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: self)
      
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarvelCell",for: indexPath) as! MarvelCell
        let char = characters[indexPath.row]
        cell.MarvelName.text = char.name
        cell.MarvelDescription.text = char.description
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


extension MarvelViewController :UISearchResultsUpdating ,UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(searchController.searchBar.text!)
        if let searchText = searchController.searchBar.text {
            presenter?.getMarvelDataFromNetwork(name: searchText)
        }
    }
    
    
}






