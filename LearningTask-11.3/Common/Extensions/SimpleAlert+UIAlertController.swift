//
//  Alert+UIViewController.swift
//  LearningTask-11.3
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

extension UIAlertController {
    
    static func showError(_ message: String, in controller: UIViewController) {
        let title = "Erro"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(cancel)
        
        controller.present(alert, animated: true)
    }
    
}
