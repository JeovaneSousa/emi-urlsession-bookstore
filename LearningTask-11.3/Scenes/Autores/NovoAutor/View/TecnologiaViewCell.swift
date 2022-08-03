//
//  TecnologiaViewCell.swift
//  LearningTask-11.3
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

class TecnologiaViewCell: UITableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    
    var tecnologia: String? {
        didSet {
            tituloLabel.text = tecnologia
        }
    }
    
}
