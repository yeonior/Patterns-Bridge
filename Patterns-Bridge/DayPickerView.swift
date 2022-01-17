//
//  DayPickerView.swift
//  Patterns-Bridge
//
//  Created by Ruslan on 18.01.2022.
//

import UIKit

protocol DayPickerViewDataSource {
    func dayPickerCount(_ dayPicker: DayPickerView) -> Int
    func dayPickerTitle(_ dayPicker: DayPickerView, indexPath: IndexPath) -> String
}

class DayPickerView: UIControl {
    
    public var dataSource: DayPickerViewDataSource? {
        didSet {
            setupView()
        }
    }
    private var buttons = [UIButton]()
    var stackView: UIStackView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
    func setupView() {
        let count = dataSource?.dayPickerCount(self)
        guard let count = count else { fatalError("Cannot set up view!")}
        
        for item in 0..<count {
            let indexPath = IndexPath(row: item, section: 0)
            let title = dataSource?.dayPickerTitle(self, indexPath: indexPath)
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.tag = item
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(buttonDidSelected), for: .touchUpInside)
        }
        
        stackView = UIStackView(arrangedSubviews: buttons)
        
        self.addSubview(stackView)
        
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    
    @objc
    func buttonDidSelected(sender: UIButton) {
        print(#function)
    }
}
