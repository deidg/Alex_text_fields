//
//  NoDigitsView.swift
//  V2 textFields var 3
//
//  Created by Alex on 05.03.2023.
//


import UIKit
import SnapKit

final class NoDigitsView: UIView {
    
    //MARK: UI Elements
    private let noDigitLabel: UILabel = {
        let noDigitsLabel = UILabel()
        noDigitsLabel.text = Constants.LabelsTexts.noDigitLabelText
        noDigitsLabel.backgroundColor = Constants.LabelsBackgroundColors.labelBackgoundColors
        noDigitsLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        noDigitsLabel.font = Constants.LabelsFonts.smallLabelFont
        return noDigitsLabel
    }()
    private let noDigitsView: UIView = {
        let noDigitsView = UIView()
        noDigitsView.backgroundColor = Constants.TextFields.viewBackgroundColor
        noDigitsView.layer.cornerRadius = Constants.LabelsSettings.lettersTextViewCornerRadius
        return noDigitsView
    }()
    private let noDigitsTextField: UITextField = {
        let noDigitsTextField = UITextField()
        noDigitsTextField.placeholder = Constants.TextFields.lettersTextFieldPlaceholderText
        noDigitsTextField.textColor = Constants.TextFields.textFieldTextColor
        noDigitsTextField.font = Constants.TextFields.textFieldFont
        noDigitsTextField.isEnabled = true
        noDigitsTextField.keyboardType = .alphabet
        noDigitsTextField.becomeFirstResponder()
        return noDigitsTextField
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
        addSubview(noDigitLabel)
        noDigitLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        addSubview(noDigitsView)
        noDigitsView.snp.makeConstraints { make in
            make.top.equalTo(noDigitLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(36)
        }
        addSubview(noDigitsTextField)
        noDigitsTextField.snp.makeConstraints { make in
            make.top.equalTo(noDigitsView.snp.top).offset(7)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(22)
        }
    }
    
    private func defaultConfiguration() {
        backgroundColor = .white
        noDigitsTextField.delegate = self
    }
}

//MARK: TextFieldDelegate
extension  NoDigitsView: UITextFieldDelegate  {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits.inverted
        let charSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: charSet)
    }
}

//MARK: constants
extension  NoDigitsView {
    enum Constants {
        enum LabelsSettings {
            static let lettersTextViewCornerRadius: CGFloat = 10
        }
        enum LabelsFonts {
            static let smallLabelFont = UIFont(name: "Rubik", size: 13)
        }
        enum LabelsTexts {
            static let noDigitLabelText = "NO digits field"
            static let smallLabelTextColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1)
        }
        enum LabelsBackgroundColors {
            static let labelBackgoundColors = UIColor.white
        }
        enum TextFields {
            static let lettersTextFieldPlaceholderText = "Type here"
            static let textFieldFont = UIFont(name: "Rubik", size: 17)
            static let textFieldTextColor = UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6)
            static let viewBackgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
        }
    }
}


