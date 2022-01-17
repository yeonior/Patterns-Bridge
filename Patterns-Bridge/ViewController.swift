//
//  ViewController.swift
//  Patterns-Bridge
//
//  Created by Ruslan on 17.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayPicker: DayPickerView!
    private let days = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayPicker.dataSource = self
    }
}

extension ViewController: DayPickerViewDataSource {
    
    func dayPickerCount(_ dayPicker: DayPickerView) -> Int {
        days.count
    }
    
    func dayPickerTitle(_ dayPicker: DayPickerView, indexPath: IndexPath) -> String {
        days[indexPath.row]
    }
}
