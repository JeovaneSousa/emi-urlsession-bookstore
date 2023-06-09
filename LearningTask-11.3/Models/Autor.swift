//
//  Autor.swift
//  LearningTask-11.3
//
//  Created by rafael.rollo on 03/08/2022.
//

import Foundation

struct Autor: Decodable {
    let id: Int?
    let fotoURI: String
    let nome: String
    let sobrenome: String
    let bio: String
    let tecnologias: [String]
    
    var nomeCompleto: String {
        return "\(nome) \(sobrenome)"
    }
    
    init(foto: String, nome: String, sobrenome: String, bio: String, tecnologias: [String]) {
        fotoURI = foto
        self.nome = nome
        self.sobrenome = sobrenome
        self.bio = bio
        self.tecnologias = tecnologias
        self.id = nil
    }
    
    enum CodingKeys: String, CodingKey {
        case bio, id
        case fotoURI = "profilePicturePath"
        case nome = "firstName"
        case sobrenome = "lastName"
        case tecnologias = "technologiesSHeWritesAbout"
    }
}

