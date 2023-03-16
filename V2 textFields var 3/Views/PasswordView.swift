//
//  PasswordView.swift
//  V2 textFields var 3
//
//  Created by Alex on 05.03.2023.
//

import UIKit
import SnapKit
import SafariServices

final class PasswordView: UIView {
    //MARK: UI Elements
    private let validationLabel: UILabel = {
        let validationLabel = UILabel()
        validationLabel.text = Constants.LabelsTexts.validationLabelText
        validationLabel.backgroundColor = .white
        validationLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        validationLabel.font = Constants.LabelsFonts.smallLabelFont
        return validationLabel
    }()
    private let passwordTextView: UIView = {
        let passwordTextView = UIView()
        passwordTextView.backgroundColor = Constants.TextFields.textFieldBackgroundColor
        passwordTextView.layer.cornerRadius = Constants.LabelsSettings.lettersTextViewCornerRadius
        return passwordTextView
    }()
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = Constants.TextFields.passwordTextFieldPlaceholderText
        passwordTextField.textColor = Constants.TextFields.textFieldTextColor
        passwordTextField.font = Constants.TextFields.textFieldFont
        return passwordTextField
    }()
    private let validationRulesView: UIView = {
        let validationRulesView = UIView()
        return validationRulesView
    }()
    private let validationMinLengthLabel: UILabel = {
        let validationMinLengthLabel = UILabel()
        validationMinLengthLabel.text = Constants.LabelsTexts.validationMinLengthLabelText
        validationMinLengthLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        validationMinLengthLabel.font = Constants.LabelsFonts.smallLabelFont
        return validationMinLengthLabel
    }()
    private let validationDigitLabel: UILabel = {
        let validationDigitLabel = UILabel()
        validationDigitLabel.text = Constants.LabelsTexts.validationDigitLabelText
        validationDigitLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        validationDigitLabel.font = Constants.LabelsFonts.smallLabelFont
        return validationDigitLabel
    }()
    private let validationLowerCaseLabel: UILabel = {
        let validationLowerCaseLabel = UILabel()
        validationLowerCaseLabel.text = Constants.LabelsTexts.validationLowerCaseLabelText
        validationLowerCaseLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        validationLowerCaseLabel.font = Constants.LabelsFonts.smallLabelFont
        return validationLowerCaseLabel
    }()
    private let validationCapitalCaseLabel: UILabel = {
        let validationCapitalCaseLabel = UILabel()
        validationCapitalCaseLabel.text = Constants.LabelsTexts.validationCapitalCaseLabelText
        validationCapitalCaseLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        validationCapitalCaseLabel.font = Constants.LabelsFonts.smallLabelFont
        return validationCapitalCaseLabel
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
        addSubview(validationLabel)
        validationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Constants.Constraints.labelHeightConstraint)
        }
        addSubview(passwordTextView)
        passwordTextView.snp.makeConstraints { make in
            make.top.equalTo(validationLabel.snp.bottom).offset(Constants.Constraints.topConstraint)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(Constants.Constraints.viewHeightConstraint)
        }
        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextView.snp.top).offset(Constants.Constraints.topToViewConstraint)
            make.leading.trailing.equalToSuperview().inset(Constants.Constraints.leadingConstraint)
            make.height.equalTo(Constants.Constraints.textfieldHeightConstraint)
        }
        addSubview(validationRulesView)
        validationRulesView.snp.makeConstraints { make in
            make.top.equalTo(passwordTextView.snp.bottom).offset(Constants.Constraints.leadingConstraint)
            make.leading.trailing.equalToSuperview().inset(Constants.Constraints.rulesViewLeading)
            make.height.equalTo(Constants.Constraints.rulesViewHeight)
        }
        validationRulesView.addSubview(validationMinLengthLabel)
        validationMinLengthLabel.snp.makeConstraints{ make in
            make.top.equalTo(validationRulesView.snp.top).offset(Constants.Constraints.leadingConstraint)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(Constants.Constraints.rulesLabelHeight)
        }
        validationRulesView.addSubview(validationDigitLabel)
        validationDigitLabel.snp.makeConstraints{ make in
            make.top.equalTo(validationMinLengthLabel.snp.bottom).offset(Constants.Constraints.leadingConstraint)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(Constants.Constraints.rulesLabelHeight)
        }
        validationRulesView.addSubview(validationLowerCaseLabel)
        validationLowerCaseLabel.snp.makeConstraints{ make in
            make.top.equalTo(validationDigitLabel.snp.bottom).offset(Constants.Constraints.leadingConstraint)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(Constants.Constraints.rulesLabelHeight)
        }
        validationRulesView.addSubview(validationCapitalCaseLabel)
        validationCapitalCaseLabel.snp.makeConstraints{ make in
            make.top.equalTo(validationLowerCaseLabel.snp.bottom).offset(Constants.Constraints.leadingConstraint)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(Constants.Constraints.rulesLabelHeight)
        }
    }
    private func defaultConfiguration() {
        backgroundColor = .white
        passwordTextField.delegate = self
    }
}
//MARK: passwordTextFieldDelegate
extension PasswordView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = passwordTextField.text,
           let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            let decimalCharacters = CharacterSet.decimalDigits
            let decimalRange = updatedText.rangeOfCharacter(from: decimalCharacters)
            if decimalRange != nil {
                validationDigitLabel.textColor = .green
            } else {
                validationDigitLabel.textColor = .black
            }
            let lowercaseLetters = CharacterSet.lowercaseLetters
            let lowercaseLettersRange = updatedText.rangeOfCharacter(from: lowercaseLetters)
            if lowercaseLettersRange != nil {
                validationLowerCaseLabel.textColor = .green
            } else {
                validationLowerCaseLabel.textColor = .black
            }
            let capitalizedLetters = CharacterSet.uppercaseLetters
            let capitalizedLettersRange = updatedText.rangeOfCharacter(from: capitalizedLetters)
            if capitalizedLettersRange != nil {
                validationCapitalCaseLabel.textColor = .green
            } else {
                validationCapitalCaseLabel.textColor = .black
            }
            if updatedText.count >= 8 {
                validationMinLengthLabel.textColor = .green
            } else {
                validationMinLengthLabel.textColor = .black
            }
        }
        return true
    }
}
//MARK: constants
extension PasswordView {
    enum Constants {
        enum Constraints {
            static let topConstraint = 4
            static let topToViewConstraint = 7
            static let trailingConstraint = 16
            static let leadingConstraint = 8
            static let labelHeightConstraint = 20
            static let rulesLabelHeight = 15
            static let rulesViewLeading = 24
            static let viewHeightConstraint = 36
            static let textfieldHeightConstraint = 22
            static let rulesViewHeight = 120
        }
        enum LabelsSettings {
            static let lettersTextViewCornerRadius: CGFloat = 10
        }
        enum LabelsFonts {
            static let mainLabelFont = UIFont(name: "Rubik-Medium", size: 34)
            static let smallLabelFont = UIFont(name: "Rubik", size: 13)
        }
        enum LabelsTexts {
            static let validationLabelText = "Validation rules"
            static let validationMinLengthLabelText = "Min length 8 characters,"
            static let validationDigitLabelText = "Min 1 digit,"
            static let validationLowerCaseLabelText = "Min 1 lowercase,"
            static let validationCapitalCaseLabelText = "Min 1 capital required.\n"
            static let smallLabelTextColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1)
            static let validationRulesLabelTextColor = UIColor(red: 87/255, green: 87/255, blue: 87/255, alpha: 1)
        }
        enum TextFields {
            static let passwordTextFieldPlaceholderText = "Password"
            static let textFieldFont = UIFont(name: "Rubik", size: 17)
            static let textFieldTextColor = UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6)
            static let textFieldBackgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
        }
    }
}

