import Foundation
import UIKit

protocol DetailsViewProtocol {
    func loadComics(comics : [Comic]) -> Void
    func getComicsURL() -> String
}
class DetailsViewController: UIViewController,  DetailsViewProtocol{
    private var character : Result?
    
    @IBOutlet weak var detailsTableView: UITableView!
    func getComicsURL() -> String {
        return (character?.comics.collectionURI)!
    }
    
    @IBOutlet weak var charImage: UIImageView!
    
    @IBOutlet weak var charNameLabel: UILabel!
    let titles = ["comics" , "series"]
    
    var presenter :DetailsPresenter?
    var comics = [Comic]()
    
    func loadComics(comics: [Comic]) {
        self.comics = comics
        print(comics.count)
        detailsTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.charNameLabel?.text = character?.name
        AlamofireClient.sharedInstance.getImage(withUrl: "\(self.character!.thumbnail.path).\(self.character!.thumbnail.thumbnailExtension.rawValue)", success: { (image) in
            self.charImage.image = image
        }) { (error) in
            print(error)
        }
        self.presenter = DetailsPresenter(view : self)
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
    }
 
    func setChar(character : Result) {
        self.character = character
    }
    

}


extension DetailsViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return titles[section]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch  section {
        case 0:
            return 1
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailsTableView.dequeueReusableCell(withIdentifier: "DetailsCell") as! DetailsCell
        switch indexPath.section {
        case 0:
            cell.setComics(comics: comics)
        default: break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

}
