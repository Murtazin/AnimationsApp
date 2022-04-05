import UIKit

class ProfileView: UIView {
    
    // MARK: - Propeties
    
    lazy var profileCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    // MARK: - Overrided
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileCollectionView.frame = self.bounds
    }
    
    // Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private funcs
    
    private func setUpView() {
        addSubview(profileCollectionView)
    }
}
