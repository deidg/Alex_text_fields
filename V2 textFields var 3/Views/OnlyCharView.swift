//
//  MaskView.swift
//  V2 textFields var 3
//
//  Created by Alex on 05.03.2023.
//


import UIKit
import SnapKit
import JMMaskTextField_Swift

final class OnlyCharView: UIView {
    //MARK: UI Elements
    private let onlyCharLabel: UILabel = {
        let onlyCharLabel = UILabel()
        onlyCharLabel.text = Constants.LabelsTexts.onlyCharectersLabelText
        onlyCharLabel.backgroundColor = .white
        onlyCharLabel.textColor = Constants.LabelsTexts.smallLabelTextColor
        onlyCharLabel.font = Constants.LabelsFonts.smallLabelFont
        return onlyCharLabel
    }()
    private let onlyCharTextView: UIView = {
        let onlyCharTextView = UIView()
        onlyCharTextView.backgroundColor = Constants.TextFields.textFieldBackgroundColor
        onlyCharTextView.layer.cornerRadius = Constants.LabelsSettings.lettersTextViewCornerRadius
        return onlyCharTextView
    }()
    private let onlyCharTextField: JMMaskTextField = {
        let onlyCharTextField = JMMaskTextField(frame:CGRect.zero)
        onlyCharTextField.maskString = Constants.onlyCharTFSetup.onlyCharTFMaskString
        onlyCharTextField.placeholder = Constants.onlyCharTFSetup.onlyCharTFPlaceHolder
        return onlyCharTextField
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
        addSubview(onlyCharLabel)
        onlyCharLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        addSubview(onlyCharTextView)
        onlyCharTextView.snp.makeConstraints { make in
            make.top.equalTo(onlyCharLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(36)
        }
        addSubview(onlyCharTextField)
        onlyCharTextField.snp.makeConstraints { make in
            make.top.equalTo(onlyCharTextView.snp.top).offset(7)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(22)
        }
    }
    private func defaultConfiguration() {
        backgroundColor = .white
    }
}

//MARK: TextFieldDelegate
extension  OnlyCharView: UITextFieldDelegate  {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits.inverted
        let charSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: charSet)
    }
}
//MARK: constants
extension  OnlyCharView {
    enum Constants {
        enum LabelsSettings {
            static let lettersTextViewCornerRadius: CGFloat = 10
        }
        enum LabelsFonts {
            static let smallLabelFont = UIFont(name: "Rubik", size: 13)
        }
        enum onlyCharTFSetup {
            static let onlyCharTFMaskString = "AAAAA-00000"
            static let onlyCharTFPlaceHolder = "wwwww-ddddd"
            
        }
        enum LabelsTexts {
            static let onlyCharectersLabelText = "Only characters"
            static let smallLabelTextColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1)
        }
        
        enum TextFields {
            static let textFieldBackgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
        }
    }
}


