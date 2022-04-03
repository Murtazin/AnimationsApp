import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Private properties and data
    
    private let reusableIdForCell: String = "cell"
    private let reusableIdForHeader: String = "header"
    
    private let profileView = ProfileView()
    
    private var data: [ItemData] = [
        ItemData(shopTitle: "ASOS", clothTitle: "Sneakers", sizes: ["42","43","44"], oldPrice: "3000", newPrice: "1700", clothImage: #imageLiteral(resourceName: "image3")),
        ItemData(shopTitle: "Stockx", clothTitle: "Sneakers", sizes: ["37","38","39"], oldPrice: "12900", newPrice: "3434", clothImage: #imageLiteral(resourceName: "image2")),
        ItemData(shopTitle: "Farfetch", clothTitle: "Sneakers", sizes: ["40"], oldPrice: "545542", newPrice: "21212", clothImage: #imageLiteral(resourceName: "image1")),
        ItemData(shopTitle: "Yoox", clothTitle: "Hoodie", sizes: ["M", "S"], oldPrice: "3333", newPrice: "1333", clothImage: #imageLiteral(resourceName: "image4")),
        ItemData(shopTitle: "ASOS", clothTitle: "Sneakers", sizes: ["42","43","44"], oldPrice: "3000", newPrice: "1700", clothImage: #imageLiteral(resourceName: "image3")),
        ItemData(shopTitle: "ASOS", clothTitle: "Sneakers", sizes: ["42","43","44"], oldPrice: "3000", newPrice: "1700", clothImage: #imageLiteral(resourceName: "image3")),
        ItemData(shopTitle: "Farfetch", clothTitle: "Sneakers", sizes: ["40"], oldPrice: "545542", newPrice: "21212", clothImage: #imageLiteral(resourceName: "image1")),
        ItemData(shopTitle: "Yoox", clothTitle: "Hoodie", sizes: ["M", "S"], oldPrice: "3333", newPrice: "1333", clothImage: #imageLiteral(resourceName: "image4")),
        ItemData(shopTitle: "ASOS", clothTitle: "Sneakers", sizes: ["42","43","44"], oldPrice: "3000", newPrice: "1700", clothImage: #imageLiteral(resourceName: "image3")),
        ItemData(shopTitle: "ASOS", clothTitle: "Sneakers", sizes: ["42","43","44"], oldPrice: "3000", newPrice: "1700", clothImage: #imageLiteral(resourceName: "image3"))
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
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 175.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 15, bottom: 80, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 80
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2.3, height: 230)
    }
}

// MARK: - UICollectionViewDataSource

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableIdForCell, for: indexPath) as? ItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.data = self.data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reusableIdForHeader, for: indexPath) as? HeaderCollectionReusableView else {
            return UICollectionReusableView()
        }
        return header
    }
}
