import Foundation
import UIKit

class ProfileDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var data: Item?
    
    var closeButton: UIButton = {
        let button = UIButton(type: .custom)
        return button
    }()
    
    var itemLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var itemImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSuperview()
        setUpConstraints()
        setUpViews()
    }
    
    // MARK: - Private funcs
    
    private func setUpSuperview() {
        view.backgroundColor = .systemBackground
        view.addSubview(itemImageView)
        view.addSubview(itemLabel)
        view.addSubview(closeButton)
    }
    
    private func setUpViews() {
        guard let data = data else {
            return
        }
        let cross = UIImage(named: "cross")?.withRenderingMode(.alwaysTemplate)
        closeButton.setImage(cross, for: .normal)
        closeButton.tintColor = .label
        closeButton.addTarget(self, action: #selector(closeButtonDidPressed), for: .touchUpInside)
        itemImageView.image = data.clothImage
        itemImageView.contentMode = .scaleAspectFill
        itemLabel.text = data.clothTitle
        itemLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    
    private func setUpConstraints() {
        itemImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(300)
        }
        itemLabel.snp.makeConstraints { make in
            make.centerX.equalTo(itemImageView)
            make.bottom.equalTo(itemImageView).offset(5)
        }
        closeButton.snp.makeConstraints { make in
            make.height.width.equalTo(45)
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
    
    // MARK: - OBJC funcs
    
    @objc private func closeButtonDidPressed() {
        dismiss(animated: true, completion: nil)
    }
}
