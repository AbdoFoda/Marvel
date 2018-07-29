import UIKit

class MarvelCell: UITableViewCell {

    @IBOutlet weak var MarvleImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var MarvelDescription: UILabel!
    @IBOutlet weak var MarvelName: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        MarvleImage.frame   =  CGRect(x: 0, y: 0, width: 100, height: 200)
    }
}
