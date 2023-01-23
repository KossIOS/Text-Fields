//
//  LinkView.swift
//  Text Fields
//
//  Created by Konstantyn Koroban on 24/11/2022.
//

import UIKit
import SnapKit
import SafariServices

protocol LinkViewDelegate: AnyObject {
    func openUrl(_ url: URL)
}
final class LinkView: UIView {
    
    weak var delegate : LinkViewDelegate?
    
    //MARK: UI UIElements
   private let linkLabel: UILabel = {
        let label = UILabel()
        label.text = "Link"
        label.font = UIFont(name: "Rubik", size: 13)
        return label
    }()
    private let linkField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "www.example.com"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(red: 0.463, green: 0.463, blue: 0.502, alpha: 0.12)
        return textField
    }()
    
    //MARK: INITIALIZATION
    
    init() {
        super.init(frame: .zero)
        setupUIElements()
        linkField.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    //MARK: METHODS
    
    private func setupUIElements() {
        // ADD SUBVIEWS
        addSubview(linkLabel)
        addSubview(linkField)
        // ADD Constrains
        linkLabel.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
        }
        
        linkField.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
            make.top.equalTo(linkLabel.snp.bottom).offset(4)
        }
    }
    
    private func tryOpenUrl(input link: String ){
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        guard let strongDetector = detector,
              !link.isEmpty,
              strongDetector.numberOfMatches(
                in: link,
                options: NSRegularExpression.MatchingOptions(rawValue: 0),
                range: NSMakeRange(0, link.count)) > 0 else { return }
        if let url = URL(string: link){
            delegate?.openUrl(url)
            }
        }
    }

extension LinkView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        tryOpenUrl(input: updatedText)
        return true
    }
    
}
