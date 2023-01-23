
//  OnlyCharactersView.swift
//  Text Fields
//
//  Created by Konstantyn Koroban on 24/11/2022.


import UIKit
import SnapKit
import JMMaskTextField_Swift

final class OnlyCharactersView: UIView {
    //MARK: UI UIElements
    let onlyCharactersLabel: UILabel = {
        let label = UILabel()
        label.text = "Only characters"
        label.font = UIFont(name: "Rubik", size: 13)
        return label
    }()
    let onlyCharactersField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(red: 0.463, green: 0.463, blue: 0.502, alpha: 0.12)
        return textField
    }()
    let maskOnlyCharacterAndDigitsField: JMMaskTextField = {
        let maskTextfield = JMMaskTextField(frame:CGRect.zero)
        maskTextfield.maskString = "AAAAA-00000"
        maskTextfield.placeholder = "wwwww-ddddd"
        return maskTextfield
    }()
   
    //MARK: INITIALIZATION

    init() {
        super.init(frame: .zero)
        setupUIElements()
    }

    required init?(coder: NSCoder) {
        return nil
    }

    //MARK: METHODS

    private func setupUIElements() {
        // ADD SUBVIEWS
        addSubview(onlyCharactersLabel)
        addSubview(onlyCharactersField)
        addSubview(maskOnlyCharacterAndDigitsField)
        // ADD Constrains
        onlyCharactersLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
        }

        onlyCharactersField.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(onlyCharactersLabel.snp.bottom).offset(4)
        }
        maskOnlyCharacterAndDigitsField.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(onlyCharactersLabel.snp.bottom).offset(4)
        }
    }
}
