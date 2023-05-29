//
//  LivrosAPI.swift
//  LearningTask-11.3
//
//  Created by rafael.rollo on 03/08/2022.
//

import Foundation

class LivrosAPI {
    var dataTask: URLSessionDataTask?
    var session: URLSession?
    var decoder: JSONDecoder?
    
    init(session: URLSession = .shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    func getBooks(by autor: Autor, completionHandler: @escaping ([Livro]) -> Void,
                                failureHandler: @escaping (AutoresAPI.Error) -> Void) {
        
        guard let id = autor.id else {return}
        
        let uri = URL(string: "https://casadocodigo-api.herokuapp.com/api/author/\(id)/books")!
        
        dataTask?.cancel()
        dataTask = session?.dataTask(with: uri, completionHandler: { [weak self] data, response, error in
            
            defer {
                self?.dataTask = nil
            }
            
            if let error = error {
                DispatchQueue.main.async {
                    failureHandler(.requestFailed(error))
                    return
                }
            }
            
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                DispatchQueue.main.async {
                    failureHandler(.failedToFetch)
                }
                return
            }
            
            do {
                guard let self = self else {return}
                
                let response = try self.decoder?.decode([Livro].self, from: data)
                
                DispatchQueue.main.async {
                    guard let response = response else {return}
                    
                    completionHandler(response)
                }
                
            } catch {
                DispatchQueue.main.async {
                    print(error)
                    failureHandler(.invalidData)
                }
            }
    })
    dataTask?.resume()
}

    func carregaTodos() -> [Livro] {
        return [
            Livro(titulo: "Orientação a Objetos",
                  subtitulo: "Aprenda seus conceitos e suas aplicabilidades de forma efetiva",
                  imagemDeCapaURI: "https:s3.xpto.oo.jpeg",
                  autor: Autor(foto: "https:s3.xpto.alberto.jpeg",
                               nome: "Alberto", sobrenome: "Souza",
                               bio: "Minha vida é andar por esse país pra ver se um dia descanso feliz, guardando as recordações das terras onde passei andando pelos sertões e dos amigos que lá deixei. Chuva e sol, poeira e carvão, longe de casa sigo o roteiro mais uma estação. E alegria no coração!",
                               tecnologias: ["Java", "Spring", "Spring Cloud", "Play", "Block Chain"]),
                 precos: [
                    Preco(valor: 19.9, tipoDeLivro: .ebook),
                    Preco(valor: 29.9, tipoDeLivro: .impresso),
                    Preco(valor: 39.9, tipoDeLivro: .combo),
                 ]),
            Livro(titulo: "ECMAScript 6",
                  subtitulo: "Descubra as novas features desta versão e entre de cabeça no futuro do JavaScript",
                  imagemDeCapaURI: "https:s3.xpto.ecmascript.jpeg",
                  autor: Autor(foto: "https:s3.xpto.paula.jpeg",
                               nome: "Paula", sobrenome: "Santana",
                               bio: "Eu gosto de artes marciais, sou graduada em Judô e Kickboxing. Adoro participar de comunidades de tecnologia especialmente voltadas para minorias. Sou apaixonada por viajar, gosto de praia e surf. Sou Eclética em música, adoro Queen e Emicida.",
                               tecnologias: ["Java", "Spring", "Kotlin", "Micronaut"]),
                  precos: [
                     Preco(valor: 19.9, tipoDeLivro: .ebook),
                     Preco(valor: 29.9, tipoDeLivro: .impresso),
                     Preco(valor: 39.9, tipoDeLivro: .combo),
                  ]),
            Livro(titulo: "React Native",
                  subtitulo: "Desenvolvimento de aplicativos mobile com React",
                  imagemDeCapaURI: "https:s3.xpto.reactNative.jpeg",
                  autor: Autor(foto: "https:s3.xpto.rollo.jpeg",
                               nome: "Rafael", sobrenome: "Rollo",
                               bio: "Um desenvolvedor que adora o que faz tanto quanto a música e o futebol e admira qualquer outra manifestação através da qual pessoas apaixonadas expressam sua essência.",
                               tecnologias: ["Swift", "iOS", "React Native", "Java", "Spring"]),
                  precos: [
                     Preco(valor: 19.9, tipoDeLivro: .ebook),
                     Preco(valor: 29.9, tipoDeLivro: .impresso),
                     Preco(valor: 39.9, tipoDeLivro: .combo),
                  ]),
            Livro(titulo: "Orientação a Objetos e SOLID para Ninjas",
                  subtitulo: "Projetando classes flexíveis",
                  imagemDeCapaURI: "https:s3.xpto.ooSolid.jpeg",
                  autor: Autor(foto: "https:s3.xpto.ponte.jpeg",
                               nome: "Rafael", sobrenome: "Ponte",
                               bio: "Príncipe do Oceano, Marajá dos Legados e Rei das Gambiarras; Engenheiro de software cansado e crossfiteiro com 5 gatos. Também um podcaster frustrado no @devscansados.",
                               tecnologias: ["Java", "Spring", "Hibernate", "Kotlin", "Micronaut"]),
                  precos: [
                     Preco(valor: 19.9, tipoDeLivro: .ebook),
                     Preco(valor: 29.9, tipoDeLivro: .impresso),
                     Preco(valor: 39.9, tipoDeLivro: .combo),
                  ]),
            Livro(titulo: "Play Framework",
                  subtitulo: "Java para web sem Servlets e com diversão",
                  imagemDeCapaURI: "https:s3.xpto.play.jpeg",
                  autor: Autor(foto: "https:s3.xpto.yuri.jpeg",
                               nome: "Yuri", sobrenome: "Matheus",
                               bio: "Eu sou apenas um rapaz latino-americano, sem dinheiro no banco, sem parentes importantes, e vindo do interior. Mas trago de cabeça uma canção do rádio em que um antigo compositor baiano me dizia: Tudo é divino tudo é maravilhoso!",
                               tecnologias: ["Java", "Spring", "Kotlin", "Micronaut"]),
                  precos: [
                     Preco(valor: 19.9, tipoDeLivro: .ebook),
                     Preco(valor: 29.9, tipoDeLivro: .impresso),
                     Preco(valor: 39.9, tipoDeLivro: .combo),
                  ]),
            Livro(titulo: "Spring MVC",
                  subtitulo: "Domine o principal framework web Java",
                  imagemDeCapaURI: "https:s3.xpto.spring.jpeg",
                  autor: Autor(foto: "https:s3.xpto.lucas.jpeg",
                               nome: "Lucas", sobrenome: "Félix",
                               bio: "Prepare o seu coração pras coisas que eu vou contar. Eu venho lá do sertão e posso não lhe agradar. Aprendi a dizer não, ver a morte sem chorar. E a morte, o destino, tudo. Estava fora do lugar e eu vivo pra consertar.",
                               tecnologias: ["Java", "Spring", "Kotlin", "Micronaut"]),
                  precos: [
                     Preco(valor: 19.9, tipoDeLivro: .ebook),
                     Preco(valor: 29.9, tipoDeLivro: .impresso),
                     Preco(valor: 39.9, tipoDeLivro: .combo),
                  ]),
            Livro(titulo: "Kotlin com Android",
                  subtitulo: "Crie aplicativos de maneira fácil e divertida",
                  imagemDeCapaURI: "https:s3.xpto.androidKotlin.jpeg",
                  autor: Autor(foto: "https:s3.xpto.jordi.jpeg",
                               nome: "Jordi", sobrenome: "Silva",
                               bio: "Eu sou terrível, vou lhe dizer, e ponho mesmo, pra derreter. Estou com a razão no que digo, não tenho medo nem do perigo, minha caranga é maquina quente. Eu sou terrível!",
                               tecnologias: ["Java", "Spring", "Kotlin", "Micronaut"]),
                  precos: [
                     Preco(valor: 19.9, tipoDeLivro: .ebook),
                     Preco(valor: 29.9, tipoDeLivro: .impresso),
                     Preco(valor: 39.9, tipoDeLivro: .combo),
                  ]),
            Livro(titulo: "Entrega contínua em Android",
                  subtitulo: "Como automatizar a distribuição de apps",
                  imagemDeCapaURI: "https:s3.xpto.androidcd.jpeg",
                  autor: Autor(foto: "https:s3.xpto.jackson.jpeg",
                               nome: "Jackson", sobrenome: "Mota",
                               bio: "Eu nasci há dez mil anos atrás e não tem nada nesse mundo que eu não saiba demais. Eu vi as velas se acenderem para o Papa, vi Babilônia ser riscada do mapa. Vi conde Drácula sugando o sangue novo e se escondendo atrás da capa.",
                               tecnologias: ["Java", "Spring", "Kotlin", "Micronaut"]),
                  precos: [
                     Preco(valor: 19.9, tipoDeLivro: .ebook),
                     Preco(valor: 29.9, tipoDeLivro: .impresso),
                     Preco(valor: 39.9, tipoDeLivro: .combo),
                  ]),
            Livro(titulo: "Flutter Framework",
                  subtitulo: "Desenvolva aplicações móveis no Dart Side!",
                  imagemDeCapaURI: "https:s3.xpto.flutter.jpeg",
                  autor: Autor(foto: "https:s3.xpto.matheus.jpeg",
                               nome: "Matheus", sobrenome: "Brandino",
                               bio: "Tem lugares que me lembram minha vida, por onde andei. As histórias, os caminhos, o destino que eu mudei... Cenas do meu filme em branco e preto que o vento levou e o tempo traz.",
                               tecnologias: ["Java", "Kotlin", "Android", "Flutter"]),
                  precos: [
                     Preco(valor: 19.9, tipoDeLivro: .ebook),
                     Preco(valor: 29.9, tipoDeLivro: .impresso),
                     Preco(valor: 39.9, tipoDeLivro: .combo),
                  ]),
        ]
    }
    
}

