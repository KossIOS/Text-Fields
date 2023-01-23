//
//  ValidationRulesView.swift
//  Text Fields
//
//  Created by Konstantyn Koroban on 24/11/2022.
//

import UIKit
import SnapKit

final class ValidationRulesView: UIView {
    //MARK: UI UIElements
    let validationRuleslabel: UILabel = {
        let label = UILabel()
        label.text = "Validation Rules"
        label.font = UIFont(name: "Rubik", size: 13)
        return label
    }()
    let validationRulesField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(red: 0.463, green: 0.463, blue: 0.502, alpha: 0.12)
        return textField
    }()
    let listOfRunningValidationRules: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Min length 8 characters.\nMin 1 digit, \nMin 1 lowercase, \nMin 1 capital required."
        label.frame = CGRect(x: 0, y: 0, width: 138, height: 88)
        label.font = UIFont(name: "Rubik", size: 13)
        return label
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
        addSubview(validationRuleslabel)
        addSubview(validationRulesField)
        addSubview(listOfRunningValidationRules)
        // ADD Constrains
        validationRuleslabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
        }
        
        validationRulesField.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(validationRuleslabel.snp.bottom).offset(4)
        }
        listOfRunningValidationRules.snp.makeConstraints { make in
            make.top.equalTo(validationRulesField.snp.bottom).offset(4)
            
            
        }
    }
}
