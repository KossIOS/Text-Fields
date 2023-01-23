//
//  InputLimitView.swift
//  Text Fields
//
//  Created by Konstantyn Koroban on 24/11/2022.
//

import UIKit
import SnapKit


final class InputLimitView : UIView {
    
    // MARK: UIElements
    
    let inputLimitLabel: UILabel = {
        let label = UILabel()
        label.text = "Input limit label"
        label.font = UIFont(name: "Rubik", size: 13)
        return label
    }()
    let counterInputLimitLabel: UILabel = {
        let label = UILabel()
        label.text = "0/10"
        label.font = UIFont(name: "Rubik", size: 13)
        return label
    }()
    let inputLimitField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type here"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(red: 0.463, green: 0.463, blue: 0.502, alpha: 0.12)
        return textField
    }()
    
    //MARK: INITIALIZATION
    
    init() {
        super.init(frame: .zero)
        setupUIElements()
        inputLimitField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    //MARK: METHODS
    
    private func setupUIElements() {
        // ADD SUBVIEWS
        addSubview(inputLimitLabel)
        addSubview(counterInputLimitLabel)
        addSubview(inputLimitField)
        // ADD Constrains
        inputLimitLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
        }
        
        inputLimitField.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(inputLimitLabel.snp.bottom).offset(4)
        }
        
        counterInputLimitLabel.snp.makeConstraints { make in
            make.trailing.top.equalToSuperview()
        }
    }
}
extension InputLimitView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        counterInputLimitLabel.text = "\(updatedText.count)/10"
        return updatedText.count < 10
    }
}
