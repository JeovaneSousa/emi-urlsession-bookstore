//
//  Livro.swift
//  LearningTask-11.3
//
//  Created by rafael.rollo on 03/08/2022.
//

import Foundation

enum TipoDeLivro: String, CaseIterable, Decodable {
    case ebook = "EBOOK"
    case impresso = "HARDCOVER"
    case combo = "COMBO"
    
    var indice: Int {
        switch self {
        case .ebook:
            return 0
        case .impresso:
            return 1
        case .combo:
            return 2
        }
    }
    
    var titulo: String {
        switch self {
        case .ebook:
            return "E-book"
        case .impresso:
            return "Impresso"
        case .combo:
            return "E-book + impresso"
        }
    }
}

struct Preco: Decodable {
    let valor: Decimal
    var tipoDeLivro: TipoDeLivro?
    
    init(valor: Decimal, tipoDeLivro: TipoDeLivro) {
        self.valor = valor
        self.tipoDeLivro = tipoDeLivro
    }
    
    enum CodingKeys: String, CodingKey {
        case tipoDeLivro = "bookType"
        case valor = "value"
    }
}

struct Livro: Decodable {
    let id: Int?
    let titulo: String
    let subtitulo: String
    let imagemDeCapaURI: String
    let autor: Autor
    let precos: [Preco]
    
    init(titulo: String, subtitulo: String, imagemDeCapaURI: String, autor: Autor, precos: [Preco]) {
        self.titulo = titulo
        self.subtitulo = subtitulo
        self.imagemDeCapaURI = imagemDeCapaURI
        self.autor = autor
        self.precos = precos
        self.id = nil
    }
    
    enum CodingKeys: String, CodingKey {
        case precos = "prices"
        case id = "id"
        case titulo = "title"
        case subtitulo = "subtitle"
        case imagemDeCapaURI = "coverImagePath"
        case autor = "author"
    }
}
