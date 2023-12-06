
import UIKit

class TableViewCell: UITableViewCell {
    var wrapperCellView: UIView!
    var postImageView: UIImageView!
    var labelPostName: UILabel!
    var labelPostContent: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupWrapperCellView()
        setupPostImageView()
        setupLabelPostName()
        setupLabelPostContent()
        initConstraints()
    }

    func setupWrapperCellView() {
        wrapperCellView = UIView()
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 10.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 6.0
        wrapperCellView.layer.shadowOpacity = 0.7
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(wrapperCellView)
    }

    func setupPostImageView() {
        postImageView = UIImageView()
        postImageView.image = UIImage(systemName: "photo")
        postImageView.contentMode = .scaleToFill
        postImageView.clipsToBounds = true
        postImageView.layer.cornerRadius = 10
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(postImageView)
    }

    func setupLabelPostName() {
        labelPostName = UILabel()
        labelPostName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelPostName)
    }

    func setupLabelPostContent() {
        labelPostContent = UILabel()
        labelPostContent.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelPostContent)
    }

    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            postImageView.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
            postImageView.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            postImageView.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
            postImageView.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),

            labelPostName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 2),
            labelPostName.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: 8),
            labelPostName.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -8),

            labelPostContent.topAnchor.constraint(equalTo: labelPostName.bottomAnchor, constant: 2),
            labelPostContent.leadingAnchor.constraint(equalTo: labelPostName.leadingAnchor),
            labelPostContent.trailingAnchor.constraint(equalTo: labelPostName.trailingAnchor),
            labelPostContent.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -2)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


