//
//  MainViewController.swift
//  V2 textFields var 3
//
//  Created by Alex on 06.03.2023.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    //MARK: UI elements
    private let noDigitsView = NoDigitsView()
    private let inputLimitView = InputLimitView()
    private let onlyCharView = OnlyCharView()
    private let linkView = LinkView()
    private let passwordView = PasswordView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = Constants.LabelsTexts.mainTitleLabeText
        titleLabel.font = Constants.LabelsFonts.mainLabelFont
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .white
        return titleLabel
    }()
    //MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItemsOnView()
        defaultConfiguration()
        addTapToHideKeyboard()
        observeKeyboardNotificaton()
    }
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
            make.edges.width.height.equalTo(scrollView)
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
        linkView.delegate = self
    }
}

//MARK: extension ViewController - keyboard
extension MainViewController {
    private func addTapToHideKeyboard() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(hideKeyboard(gesture:))
        )
        contentView.addGestureRecognizer(tap)
    }
    private func observeKeyboardNotificaton() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(sender:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(sender:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    @objc private func keyboardWillShow(sender: NSNotification) {
        guard let userInfo = sender.userInfo else { return }
        guard var keyboardFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else { return }
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        var contentInset: UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
        
    }
    @objc private func keyboardWillHide(sender: NSNotification) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    @objc private func hideKeyboard(gesture: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
// MARK: Delegate
extension MainViewController: LinkViewDelegate {
    func openURL(url: URL) {
        UIApplication.shared.open(url)
    }
}

extension MainViewController {
    //MARK: extension ViewController -  Constants
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







