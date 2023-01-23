//
//  ViewController.swift
//  Text Fields
//
//  Created by Konstantyn Koroban on 11/11/2022.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Text Fields"
        label.textAlignment = .center
        label.font = UIFont.init(name: "Rubik", size: 34)
        return label
    }()
    
    private let noDigitsView = NoDigitsView()
    private let inputLimitView = InputLimitView()
    private let onlyCharacters = OnlyCharactersView()
    private let linkView = LinkView()
    private let validationRulesView = ValidationRulesView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        linkView.delegate = self
    }
    // MARK: ADD Methods
    private func setupUI() {
        //ScrollView
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.height.width.equalTo(scrollView)
            make.edges.equalTo(scrollView)
        }
        //Header view
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentView).inset(16)
            make.top.equalTo(contentView.snp.top).offset(92)
        }
        //No digits view
        contentView.addSubview(noDigitsView)
        noDigitsView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentView).inset(16)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
        }
        //Input limits view
        contentView.addSubview(inputLimitView)
        inputLimitView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(noDigitsView.snp.bottom).offset(30)
        }
        //OnlynCharacters view
        contentView.addSubview(onlyCharacters)
        onlyCharacters.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(inputLimitView.snp.bottom).offset(30)
        }
        //Link View
        contentView.addSubview(linkView)
        linkView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(onlyCharacters.snp.bottom).offset(30)
        }
        //Validation Rules View
        contentView.addSubview(validationRulesView)
        validationRulesView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(linkView.snp.bottom).offset(30)
        }
    }
}
extension ViewController : LinkViewDelegate {
    func openUrl(_ url: URL) {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let vc = SFSafariViewController(url: url, configuration: config)
        present(vc, animated: true)
    }
}


