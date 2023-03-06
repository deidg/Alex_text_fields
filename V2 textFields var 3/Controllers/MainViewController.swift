//
//  MainViewController.swift
//  V2 textFields var 3
//
//  Created by Alex on 06.03.2023.
//

import UIKit
import SnapKit
import SafariServices
import JMMaskTextField_Swift

final class MainViewController: UIViewController {
    
    let noDigitsView = NoDigitsView()
    let inputLimitView = InputLimitView()
    let onlyCharView = OnlyCharView()
    let linkView = LinkView()
    let passwordView = PasswordView()
    var activeTextField : UITextField? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItemsOnView()
        defaultConfiguration()
        setupKeyboardHiding()
        linkView.delegate = self
    }
    
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    let textFieldFrame = view.convert(currentTextField.frame, from: currentTextField.superview)
//    resetButton.addTarget(self, action: #selector(resetPasswordButtonTapped), for: .primaryActionTriggered)
    
    
    //MARK: views
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    //MARK: elements
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = Constants.LabelsTexts.mainTitleLabeText
        titleLabel.font = Constants.LabelsFonts.mainLabelFont
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .white
        return titleLabel
    }()
    //MARK: Items On View
    private func setupItemsOnView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.width.height.equalTo(scrollView)
        }
        // titleLabel
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(Constants.Constraints.titleTopToSuperViewConstraint)
            make.trailing.leading.equalToSuperview().inset(Constants.Constraints.leadingConstraint)
            make.height.equalTo(Constants.Constraints.titleLabelHeightConstraint)
        }
        // noDigitsView
        contentView.addSubview(noDigitsView)
        noDigitsView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(Constants.Constraints.noDigitsViewConstraint)
            make.leading.trailing.equalToSuperview().inset(Constants.Constraints.leadingConstraint)
            make.height.equalTo(Constants.Constraints.heightConstraint)
        }
        // inputLimitView
        contentView.addSubview(inputLimitView)
        inputLimitView.snp.makeConstraints{make in
            make.top.equalTo(noDigitsView.snp.bottom).offset(Constants.Constraints.topConstraint)
            make.leading.trailing.equalToSuperview().inset(Constants.Constraints.leadingConstraint)
            make.height.equalTo(Constants.Constraints.heightConstraint)
        }
        // onlyCharView
        contentView.addSubview(onlyCharView)
        onlyCharView.snp.makeConstraints{make in
            make.top.equalTo(inputLimitView.snp.bottom).offset(Constants.Constraints.topConstraint)
            make.leading.trailing.equalToSuperview().inset(Constants.Constraints.leadingConstraint)
            make.height.equalTo(Constants.Constraints.heightConstraint)
        }
        // linkView
        contentView.addSubview(linkView)
        linkView.snp.makeConstraints{make in
            make.top.equalTo(onlyCharView.snp.bottom).offset(Constants.Constraints.topConstraint)
            make.leading.trailing.equalToSuperview().inset(Constants.Constraints.leadingConstraint)
            make.height.equalTo(Constants.Constraints.heightConstraint)
        }
        // passwordView
        contentView.addSubview(passwordView)
        passwordView.snp.makeConstraints{make in
            make.top.equalTo(linkView.snp.bottom).offset(Constants.Constraints.topConstraint)
            make.leading.trailing.equalToSuperview().inset(Constants.Constraints.leadingConstraint)
            make.height.equalTo(Constants.Constraints.heightConstraint)
        }
    }
    
    
    
    
    
    
    private func defaultConfiguration() {
        self.view.backgroundColor = .white
        
        
    }
}

//MARK: extension ViewController
extension MainViewController: LinkViewDelegate {
    func openURL(url: URL) {
        UIApplication.shared.open(url)
    }
}

//MARK: constants
extension MainViewController {
    
    @objc func keyboardWillShow(sender: NSNotification) {
        guard let userInfo = sender.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextField = UIResponder.currentFirst() as? UITextField else { return }
        
        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(currentTextField.frame, from: currentTextField.superview)
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
        
        if textFieldBottomY > keyboardTopY {
            let textBoxY = convertedTextFieldFrame.origin.y
            let newFrameY = (textBoxY - keyboardTopY / 2) * -1
            view.frame.origin.y = newFrameY
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {  //@objc
        view.frame.origin.y = 0
    }
    //    }
    
    
    
    
    enum Constants {
        enum LabelsFonts {
            static let mainLabelFont = UIFont(name: "Rubik-Medium", size: 34)
        }
        enum LabelsTexts {
            static let mainTitleLabeText = "Text Fields"
        }
        enum Constraints {
            static let titleTopToSuperViewConstraint = 92
            static let noDigitsViewConstraint = 163
            static let topConstraint = 30
            static let leadingConstraint = 16
            static let trailingConstraint = 16
            static let titleLabelHeightConstraint = 41
            static let heightConstraint = 60
        }
    }
}
//}
extension MainViewController : UITextFieldDelegate {
    //MARK: textediting
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
}
//MARK: keyboard
//extension MainViewController {
//
//    }
//}

extension UIResponder {
    
    private struct Static {
        static weak var responder: UIResponder?
    }
    
    /// Finds the current first responder
    /// - Returns: the current UIResponder if it exists
    static func currentFirst() -> UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
        return Static.responder
    }
    
    @objc private func _trap() {
        Static.responder = self
    }
}



