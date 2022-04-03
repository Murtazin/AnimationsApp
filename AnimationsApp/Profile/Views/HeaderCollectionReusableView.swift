import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    // MARK: - Private properties
    
    private var propertyAnimator: UIViewPropertyAnimator!
    
    private lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.value = 1
        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.stepValue = 20
        stepper.addTarget(self, action: #selector(didChangeStepperValue), for: .valueChanged)
        return stepper
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemBlue
        imageView.image = UIImage(systemName: "person.circle.fill")
        return imageView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = "Murtazin Renat"
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    private lazy var profileSettingsButton: UIButton = {
        let button = UIButton(type: .custom)
        let buttonImage = UIImage(systemName: "chevron.right")
        button.setImage(buttonImage, for: .normal)
        button.setTitle("Profile settings", for: .normal)
        button.tintColor = .label
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        button.semanticContentAttribute = UIApplication.shared
            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        button.contentHorizontalAlignment = .left
        button.sizeToFit()
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: self.frame.width-32-button.frame.width, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(profileSettingsButtonDidPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var subscribesSettingsButton: UIButton = {
        let button = UIButton(type: .custom)
        let buttonImage = UIImage(systemName: "chevron.right")
        button.setImage(buttonImage, for: .normal)
        button.setTitle("Subscribes settings", for: .normal)
        button.tintColor = .label
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        button.semanticContentAttribute = UIApplication.shared
            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        button.contentHorizontalAlignment = .left
        button.sizeToFit()
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: self.frame.width-32-button.frame.width, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(subscribesSettingsButtonDidPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var myClothesLabel: UILabel = {
        let label = UILabel()
        label.text = "My clothes"
        label.textColor = .label
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    // MARK: - Overrided
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpConstraints()
    }
    
    // Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpHeaderView()
        setUpPropertyAnimator()
        setUpAnimationsForSettingsButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private funcs
    
    private func setUpHeaderView() {
        addSubview(profileImageView)
        addSubview(fullNameLabel)
        addSubview(profileSettingsButton)
        addSubview(subscribesSettingsButton)
        addSubview(myClothesLabel)
        addSubview(stepper)
    }
    
    private func setUpConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
            make.height.width.equalTo(60)
        }
        fullNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView)
            make.trailing.equalToSuperview().inset(16)
        }
        profileSettingsButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(profileImageView).inset(70)
        }
        subscribesSettingsButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(profileSettingsButton).inset(40)
        }
        myClothesLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalTo(subscribesSettingsButton).inset(40)
        }
        stepper.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalTo(myClothesLabel)
        }
    }
    
    private func setUpAnimationsForSettingsButtons() {
        UIView.animateKeyframes(withDuration: 3.0, delay: 0.1, options: [.autoreverse]) {
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.9) {
                self.profileSettingsButton.transform = .init(translationX: 0, y: 40)
                self.subscribesSettingsButton.transform = .init(translationX: 0, y: -40)
            }
        } completion: { _ in
            self.profileSettingsButton.transform = .identity
            self.subscribesSettingsButton.transform = .identity
        }

    }
    
    private func setUpPropertyAnimator() {
        propertyAnimator = UIViewPropertyAnimator(duration: 0.0, curve: .linear, animations: {
            self.layoutIfNeeded()
            self.profileImageView.transform = CGAffineTransform(translationX: 285, y: 0)
            self.profileImageView.tintColor = .label
            self.fullNameLabel.transform = CGAffineTransform(translationX: -185, y: 0)
            self.fullNameLabel.alpha = 0
        })
    }
    
    // MARK: - OBJC funcs
    
    @objc private func profileSettingsButtonDidPressed() {
        print("profile was pressed")
    }
    
    @objc private func subscribesSettingsButtonDidPressed() {
        print("subscribes was pressed")
    }
    
    @objc private func didChangeStepperValue(_ sender: UIStepper) {
        propertyAnimator.fractionComplete = CGFloat(sender.value) / 100
    }
}
