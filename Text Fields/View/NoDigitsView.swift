//
//  NoDigitsView.swift
//  Text Fields
//
//  Created by Konstantyn Koroban on 24/11/2022.
//

import UIKit
import SnapKit

final class NoDigitsView: UIView {
    
    // MARK: UIElements
    
     private let noDigitsLabel: UILabel = {
        let label = UILabel()
        label.text = "No digits field"
        label.font = UIFont(name: "Rubik", size: 13)
        return label
    }()
     private let noDigitsInputField: UITextField = {
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
        noDigitsInputField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    //MARK: METHODS
    
    private func setupUIElements() {
        
    // ADD SUBVIEWS
        
        addSubview(noDigitsLabel)
        addSubview(noDigitsInputField)
        
    // ADD Constrains
        
        noDigitsLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
        }
        
        noDigitsInputField.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(noDigitsLabel.snp.bottom).offset(4)
            
        }
    }
    
    private func isNoDigits(inString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits.inverted
           let characterSet = CharacterSet(charactersIn: string)
           return allowedCharacters.isSuperset(of: characterSet)
    }
}
extension NoDigitsView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return isNoDigits(inString: string)
    }
}

