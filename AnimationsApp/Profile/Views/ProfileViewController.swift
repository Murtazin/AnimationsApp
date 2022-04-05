import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties and data
    
    private let profileView = ProfileView()
    
    let reusableIdForCell: String = "cell"
    let reusableIdForHeader: String = "header"
    
    var animator: Animator?
    
    var selectedCell: ItemCollectionViewCell?
    var selectedCellImageViewSnapshot: UIView?
    
    var data: [Item] = [
        Item(shopTitle: "ASOS", clothTitle: "Sneakers", sizes: ["42","43","44"], oldPrice: "3000", newPrice: "1700", clothImage: #imageLiteral(resourceName: "image5")),
        Item(shopTitle: "Stockx", clothTitle: "Sneakers", sizes: ["37","38","39"], oldPrice: "12900", newPrice: "3434", clothImage: #imageLiteral(resourceName: "image6")),
        Item(shopTitle: "Farfetch", clothTitle: "Sneakers", sizes: ["40"], oldPrice: "545542", newPrice: "21212", clothImage: #imageLiteral(resourceName: "image5")),
        Item(shopTitle: "Yoox", clothTitle: "Hoodie", sizes: ["M", "S"], oldPrice: "3333", newPrice: "1333", clothImage: #imageLiteral(resourceName: "image6")),
        Item(shopTitle: "ASOS", clothTitle: "Sneakers", sizes: ["42","43","44"], oldPrice: "3000", newPrice: "1700", clothImage: #imageLiteral(resourceName: "image5")),
        Item(shopTitle: "ASOS", clothTitle: "Sneakers", sizes: ["42","43","44"], oldPrice: "3000", newPrice: "1700", clothImage: #imageLiteral(resourceName: "image6")),
        Item(shopTitle: "Farfetch", clothTitle: "Sneakers", sizes: ["40"], oldPrice: "545542", newPrice: "21212", clothImage: #imageLiteral(resourceName: "image5")),
        Item(shopTitle: "Yoox", clothTitle: "Hoodie", sizes: ["M", "S"], oldPrice: "3333", newPrice: "1333", clothImage: #imageLiteral(resourceName: "image6")),
        Item(shopTitle: "ASOS", clothTitle: "Sneakers", sizes: ["42","43","44"], oldPrice: "3000", newPrice: "1700", clothImage: #imageLiteral(resourceName: "image5")),
        Item(shopTitle: "ASOS", clothTitle: "Sneakers", sizes: ["42","43","44"], oldPrice: "3000", newPrice: "1700", clothImage: #imageLiteral(resourceName: "image6"))
    ]
    
    // MARK: - View life cycle
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        setUpProfileCollectionView()
    }
    
    // MARK: - Private funcs
    
    private func setUpProfileCollectionView() {
        profileView.profileCollectionView.delegate = self
        profileView.profileCollectionView.dataSource = self
        profileView.profileCollectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: reusableIdForCell)
        profileView.profileCollectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reusableIdForHeader)
    }
    
    // MARK: - Other funcs
    
    func presentSecondViewController(with data: Item) {
        let secondVC = ProfileDetailViewController()
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.data = data
        present(secondVC, animated: true, completion: nil)
    }
}
