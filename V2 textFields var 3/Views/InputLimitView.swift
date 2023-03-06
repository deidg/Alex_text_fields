//
//  CounterView.swift
//  V2 textFields var 3
//
//  Created by Alex on 05.03.2023.
//


import UIKit
import SnapKit

final class InputLimitView: UIView {
    //MARK: UI Elements
    private let inputLimitLabel: UILabel = {
        let inputLimitLabel = UILabel()
        inputLimitLabel.text = Constants.LabelsTexts.inputLimitLabelText
        inputLimitLabel.backgroundColor = .white
        inputLimitLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        inputLimitLabel.font = Constants.LabelsFonts.smallLabelFont
        return inputLimitLabel
    }()
    private var charactersCounter: UILabel = {
        let charactersCounter = UILabel()
        charactersCounter.backgroundColor = .white
        charactersCounter.textAlignment = .right
        charactersCounter.textColor = Constants.LabelsTexts.smallLabelTextColor
        charactersCounter.font = Constants.LabelsFonts.smallLabelFont
        charactersCounter.text = Constants.LabelsTexts.charactersCounterText
        return charactersCounter
    }()
    private let inputLimitView: UIView = {
        let inputLimitView = UIView()
        inputLimitView.backgroundColor = .yellow
        inputLimitView.backgroundColor = Constants.TextFields.viewBackgroundColor
        inputLimitView.layer.cornerRadius = Constants.LabelsSettings.lettersTextViewCornerRadius
        return inputLimitView
    }()
    private let inputLimitTextField: UITextField = {
        let inputLimitTextField = UITextField()
        inputLimitTextField.placeholder = Constants.TextFields.lettersTextFieldPlaceholderText
        inputLimitTextField.textColor = Constants.TextFields.textFieldTextColor
        inputLimitTextField.font = Constants.TextFields.textFieldFont
        return inputLimitTextField
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
        addSubview(inputLimitLabel)
        inputLimitLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        addSubview(charactersCounter)
        charactersCounter.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(22)
        }
        addSubview(inputLimitView)
        inputLimitView.snp.makeConstraints { make in
            make.top.equalTo(inputLimitLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(36)
        }
        addSubview(inputLimitTextField)
        inputLimitTextField.snp.makeConstraints { make in
            make.top.equalTo(inputLimitView.snp.top).offset(7)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(22)
        }
    }
    
    private func defaultConfiguration() {
        backgroundColor = .white
        inputLimitTextField.delegate = self
    }
}

//MARK: TextFieldDelegate
extension  InputLimitView: UITextFieldDelegate  {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        let lengthToAdd = updatedText.count
        charactersCounter.text = "\(lengthToAdd)/10"
        if lengthToAdd <= 10 {
            charactersCounter.textColor = .black
        } else {
            charactersCounter.textColor = .red
            charactersCounter.text = "10/10"
        }
        return lengthToAdd <= 10
    }
}

//MARK: constants
    extension  InputLimitView {
    enum Constants {
        enum LabelsSettings {
            static let lettersTextViewCornerRadius: CGFloat = 10
        }
        enum LabelsFonts {
            static let smallLabelFont = UIFont(name: "Rubik", size: 13)
        }
        enum LabelsTexts {
            static let noDigitLabelText = "NO digit field"
            static let inputLimitLabelText = "Input limit"
            static let charactersCounterText = "0/10"
            static let smallLabelTextColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1)
        }
        enum TextFields {
            static let lettersTextFieldPlaceholderText = "Type here"
            static let textFieldFont = UIFont(name: "Rubik", size: 17)
            static let textFieldTextColor = UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.6)
            static let viewBackgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
        }
    }
}

