import Foundation
import UIKit

protocol DetailsViewProtocol {
    func loadComics(comics : [Comic]) -> Void
    func loadComicImage(withIdx idx:Int , image : UIImage)
    func getComicsURL() -> String
}
class DetailsViewController: UIViewController,  DetailsViewProtocol{

    
    
    @IBOutlet weak var detailsTableView: UITableView!
    @IBOutlet weak var charImage: UIImageView!
    @IBOutlet weak var charNameLabel: UILabel!
    
    private var character : Result?
    
    let titles = ["comics" , "series"]
    
    var presenter :DetailsPresenter?
    
    var comics = [Comic]()
    var comicImages = [UIImage?]()
    
    var idxOfCurrentLoadedImage = -1
    var comicsCell : DetailsCell?
    
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
    
    func loadComics(comics: [Comic]) {
        self.comics = comics
        comicImages = [UIImage?] (repeating: nil, count: comics.count)
        print("number of comics : \(comics.count)")
        DispatchQueue.global().sync {
            self.idxOfCurrentLoadedImage = -1
            self.comicsCell?.setComics(comics: comics)
        }
    }
    
    func getComicsURL() -> String {
        return (character?.comics.collectionURI)!
    }
    
    func loadComicImage(withIdx idx: Int, image: UIImage) {
        comicImages[idx] = image
        DispatchQueue.global().sync {
            self.idxOfCurrentLoadedImage = idx
            self.comicsCell?.loadComicImage(atIndex: idxOfCurrentLoadedImage, withImage: comicImages[idxOfCurrentLoadedImage]!)
        }
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
        if(comicsCell == nil) {
            comicsCell = detailsTableView.dequeueReusableCell(withIdentifier: "DetailsCell") as? DetailsCell
        }
//        switch indexPath.section {
//        case 0: do {
//                if(idxOfCurrentLoadedImage == -1) {
//                    comicsCell?.setComics(comics: comics)
//                }else{
//                    print("cell is reloaded at index : \(idxOfCurrentLoadedImage)")
//                    comicsCell?.loadComicImage(atIndex: idxOfCurrentLoadedImage, withImage: comicImages[idxOfCurrentLoadedImage]!)
//                }
//            }
//        default: break
//        }
        return comicsCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

}
