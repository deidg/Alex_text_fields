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
        gesturesRecognitions()
        linkView.delegate = self
    }
    
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
            make.top.equalToSuperview().offset(92)
            make.trailing.leading.equalToSuperview().inset(16)
            make.height.equalTo(41)
        }
        // noDigitsView
        contentView.addSubview(noDigitsView)
        noDigitsView.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(163)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
        // inputLimitView
        contentView.addSubview(inputLimitView)
        inputLimitView.snp.makeConstraints{make in
            make.top.equalTo(noDigitsView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
        // onlyCharView
        contentView.addSubview(onlyCharView)
        onlyCharView.snp.makeConstraints{make in
            make.top.equalTo(inputLimitView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
        // linkView
        contentView.addSubview(linkView)
        linkView.snp.makeConstraints{make in
            make.top.equalTo(onlyCharView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
        // passwordView
        contentView.addSubview(passwordView)
        passwordView.snp.makeConstraints{make in
            make.top.equalTo(linkView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
    }
    
    func defaultConfiguration() {
        self.view.backgroundColor = .white
        
        //стереть гестурз при финальной чистке
        //        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainViewController.backgroundTap))
        //        self.view.addGestureRecognizer(tapGestureRecognizer)
        //        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        //        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //норм. оставить тут
    func gesturesRecognitions() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainViewController.backgroundTap))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
    enum Constants {
        enum LabelsFonts {
            static let mainLabelFont = UIFont(name: "Rubik-Medium", size: 34)
        }
        enum LabelsTexts {
            static let mainTitleLabeText = "Text Fields"
        }
    }
}
extension MainViewController : UITextFieldDelegate {
    //MARK: textediting
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
    
    //MARK: keyboard
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        var shouldMoveViewUp = false
        if let activeTextField = activeTextField {
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            let topOfKeyboard = self.view.frame.height - keyboardSize.height
            if bottomOfTextField > topOfKeyboard {
                shouldMoveViewUp = true
            }
        }
        if(shouldMoveViewUp) {
            self.view.frame.origin.y = 0 - keyboardSize.height
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
    @objc func backgroundTap(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}



