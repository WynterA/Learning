//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Arie Myrmo on 8/30/18.
//  Copyright © 2018 Myrmo. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    @IBOutlet var celsiusLabel: UILabel!

    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        } else {
            celsiusLabel.text = "???"
        }
    }
}
