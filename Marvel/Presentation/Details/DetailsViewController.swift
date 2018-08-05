import Foundation
import UIKit

protocol DetailsViewProtocol {
    
    func startActivityIndicator()
    func stopActivityIndicator()
    
    func loadComics(comics : [Comic])
    func loadSeries(series : [Comic])
    
    func loadComicImage(withIdx idx:Int , image : UIImage)
    func loadSeriesImage(withIdx idx: Int, image: UIImage)
    
    func getComicsURL() -> String
    func getSeriesURL() -> String
}
class DetailsViewController: UIViewController,  DetailsViewProtocol{
   
    @IBOutlet weak var detailsTableView: UITableView!
    @IBOutlet weak var charImage: UIImageView!
    @IBOutlet weak var charNameLabel: UILabel!
    
    private var character : Result?
    
    let titles = ["comics" , "series"]
    
    var presenter :DetailsPresenter?
    
    var comics = [Comic]()
    var series = [Comic]()

    var comicsCell : DetailsCell?
    var seriesCell : DetailsCell?
    
    
    let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    func startActivityIndicator() {
       myActivityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        myActivityIndicator.stopAnimating()
    }
    
    
    func getComicsURL() -> String {
        return (character?.comics.collectionURI)!
    }
    
    func getSeriesURL() -> String {
        return (character?.series.collectionURI)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myActivityIndicator.center = view.center
        myActivityIndicator.transform = CGAffineTransform(scaleX: 3, y: 3)
        view.addSubview(myActivityIndicator)
        self.charNameLabel?.text = character?.name
        /// move this line to presenter
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
    
    func loadComics(comics: [Comic]) {
        self.comics = comics
        self.comicsCell?.setComics(comics: comics)
    }
    
    
    func loadComicImage(withIdx idx: Int, image: UIImage) {
        self.comicsCell?.loadComicImage(atIndex: idx, withImage: image)
    }

    func loadSeries(series : [Comic]) {
        self.series = series
        self.seriesCell?.setSeries(series: series)
    }
    
    func loadSeriesImage(withIdx idx: Int, image: UIImage) {
        self.seriesCell?.loadSeriesImage(atIndex: idx, withImage: image)
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
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if(comicsCell == nil) {
                comicsCell = detailsTableView.dequeueReusableCell(withIdentifier: "DetailsCell") as? DetailsCell
            }
            return comicsCell!
        case 1:
            if(seriesCell == nil) {
                seriesCell = detailsTableView.dequeueReusableCell(withIdentifier: "DetailsCell") as? DetailsCell
            }
            return seriesCell!
            
        default:
            return UITableViewCell()
        }
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

}
