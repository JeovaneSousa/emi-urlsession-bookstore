//
//  LivroDoAutorTableViewCell.swift
//  LearningTask-11.3
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

class LivroDoAutorTableViewCell: UITableViewCell {

    @IBOutlet private weak var tituloLabel: UILabel!
    @IBOutlet private weak var capaImageView: UIImageView!
    
    var livro: Livro? {
        didSet {
            guard let livro = livro else {
                return
            }

            tituloLabel.text = livro.titulo
            
            let imagem = UIImage(named: livro.imagemDeCapaURI) != nil
                ? livro.imagemDeCapaURI
                : "Book"

            capaImageView.image = UIImage.init(imagem,
                                               aspectFillIn: capaImageView.frame)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = .texasRose.withAlphaComponent(0.3)
        selectedBackgroundView = bgColorView
    }
    
}

