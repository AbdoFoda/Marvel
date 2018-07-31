import Foundation
import UIKit

class DetailsViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    let titles = ["comics" , "series"]
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return titles[section]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    

}
