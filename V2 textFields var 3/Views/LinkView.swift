//
//  LinkView.swift
//  V2 textFields var 3
//
//  Created by Alex on 05.03.2023.
//

import UIKit
import SnapKit
import SafariServices

protocol LinkViewDelegate: AnyObject {
    func openURL(url: URL)
}

final class LinkView: UIView {
    weak var delegate: LinkViewDelegate?
    private let linkRegex: String = "((?:http|https)://)?(?:www\\.)?(?:Www\\.)?(?:WWW\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
    //MARK: UI Elements
    private let linkLabel: UILabel = {
        let linkLabel = UILabel()
        linkLabel.text = Constants.LabelsTexts.linkLabelText
        linkLabel.backgroundColor = .white
        linkLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        linkLabel.font = Constants.LabelsFonts.smallLabelFont
        return linkLabel
    }()
    private let linkTextView: UIView = {
        let linkTextView = UIView()
        linkTextView.backgroundColor = Constants.TextFields.textFieldBackgroundColor
        linkTextView.layer.cornerRadius = Constants.LabelsSettings.lettersTextViewCornerRadius
        return linkTextView
    }()
    private let linkTextField: UITextField = {
        let linkTextField = UITextField()
        linkTextField.placeholder = Constants.TextFields.linkTextFieldPlaceholderText
        linkTextField.textColor = Constants.TextFields.textFieldTextColor
        linkTextField.font = Constants.TextFields.textFieldFont
        linkTextField.keyboardType = .URL
        return linkTextField
    }()
    //MARK: Initialization
    init() {
        super.init(frame: .zero)
        setupUI()
        defaultConfiguration()
    }
    required init?(coder: NSCoder) {
        return nil
    }
    //MARK: Methods
    private func setupUI() {
        addSubview(linkLabel)
        linkLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Constants.Constraints.labelHeightConstraint)
        }
        addSubview(linkTextView)
        linkTextView.snp.makeConstraints { make in
            make.top.equalTo(linkLabel.snp.bottom).offset(Constants.Constraints.topConstraint)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Constants.Constraints.viewHeightConstraint)
        }
        addSubview(linkTextField)
        linkTextField.snp.makeConstraints { make in
            make.top.equalTo(linkTextView.snp.top).offset(Constants.Constraints.topToViewConstraint)
            make.leading.trailing.equalToSuperview().inset(Constants.Constraints.leadingConstraint)
            make.height.equalTo(Constants.Constraints.textfieldHeightConstraint)
        }
    }
    private func defaultConfiguration() {
        backgroundColor = .white
        linkTextField.delegate = self
    }
}

//MARK: linkTextFieldDelegate
extension LinkView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == linkTextField {
            let link = linkTextField.text ?? ""
            func isLinkValid(_ link: String) -> Bool {
                let linkTest = NSPredicate(format: "SELF MATCHES %@", linkRegex)
                return linkTest.evaluate(with: link)
            }
            if isLinkValid(link) {
                let delay: Double = 2.0
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    func startBrowser(_ sender: Any) {
                        if let urlString = self.linkTextField.text {
                            let url: URL?
                            if urlString.hasPrefix("http://") {
                                url = URL(string: urlString)
                            } else if urlString.hasPrefix("https://") {
                                url = URL(string: urlString)
                            } else {
                                url = URL(string: "http://" + urlString)
                            }
                            if let url = url {
                                self.delegate?.openURL(url: url)
                            }
                        }
                    }
                    startBrowser(self.linkTextField)
                }
            } else {
                print("NOT valid link")
            }
        }
        return true
    }
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
//MARK: constants
extension LinkView {
    enum Constants {
        enum Constraints {
            static let topConstraint = 4
            static let topToViewConstraint = 7
            static let trailingConstraint = 16
            static let leadingConstraint = 8
            static let labelHeightConstraint = 20
            static let viewHeightConstraint = 36
            static let textfieldHeightConstraint = 22
        }
        enum LabelsSettings {
            static let lettersTextViewCornerRadius: CGFloat = 10
        }
        enum LabelsFonts {
            static let smallLabelFont = UIFont(name: "Rubik", size: 13)
        }
        enum LabelsTexts {
            static let linkLabelText = "Link"
            static let smallLabelTextColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1)
        }
        enum TextFields {
            static let linkTextFieldPlaceholderText = "www.example.com"
            static let textFieldFont = UIFont(name: "Rubik", size: 17)
            static let textFieldTextColor = UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6)
            static let textFieldBackgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
        }
    }
}

