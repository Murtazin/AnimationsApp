import UIKit
import SnapKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private properties
    
    private lazy var shopTitleLabel: UILabel = {
        let label = UILabel()
        label.text = nil
        label.textColor = .systemGray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var clothTitleLabel: UILabel = {
        let label = UILabel()
        label.text = nil
        label.textColor = .label
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var sizesLabel: UILabel = {
        let label = UILabel()
        label.text = nil
        label.textColor = .systemGray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var oldPriceLabel: UILabel = {
        let label = UILabel()
        label.text = nil
        label.textColor = .systemGray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var newPriceLabel: UILabel = {
        let label = UILabel()
        label.text = nil
        label.textColor = .systemBlue
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        return image
    }()
    
    // MARK: - Other properties
    
    public var data: ItemData? {
        didSet {
            guard let data = data else {
                return
            }
            imageView.image = data.clothImage
            shopTitleLabel.text = data.shopTitle
            clothTitleLabel.text = data.clothTitle
            sizesLabel.text = data.sizes.joined(separator: ",")
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "\(data.oldPrice)")
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
            oldPriceLabel.attributedText = attributeString
            newPriceLabel.text = data.newPrice
        }
    }
    
    // MARK: - Overrided
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpConstraints()
    }
    
    // Initializers
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
        setUpContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private funcs
    
    private func setUpContentView() {
        contentView.addSubview(imageView)
        contentView.addSubview(shopTitleLabel)
        contentView.addSubview(clothTitleLabel)
        contentView.addSubview(sizesLabel)
        contentView.addSubview(oldPriceLabel)
        contentView.addSubview(newPriceLabel)
    }
    
    private func setUpConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
        shopTitleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(20)
            make.left.equalToSuperview()
        }
        clothTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(shopTitleLabel).inset(12)
            make.left.equalToSuperview()
        }
        sizesLabel.snp.makeConstraints { make in
            make.top.equalTo(clothTitleLabel).inset(15)
            make.left.equalToSuperview()
        }
        oldPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(sizesLabel).inset(12)
            make.left.equalToSuperview()
        }
        newPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(oldPriceLabel).inset(12)
            make.left.equalToSuperview()
        }
    }
}
