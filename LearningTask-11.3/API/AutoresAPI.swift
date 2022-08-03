//
//  AutoresAPI.swift
//  LearningTask-11.3
//
//  Created by rafael.rollo on 03/08/2022.
//

import Foundation

/**
 Componente cliente da api de autores da casa do código.
 Implementação atual apenas simula um carregamento.
 Integrações com serviços HTTP estão fora do escopo da atividade atual e será tema mais a frente
 */
class AutoresAPI {

    func listaTodos() -> [Autor] {
        return [
            Autor(foto: "https:s3.xpto.alberto.jpeg",
                  nome: "Alberto", sobrenome: "Souza",
                  bio: "Minha vida é andar por esse país pra ver se um dia descanso feliz, guardando as recordações das terras onde passei andando pelos sertões e dos amigos que lá deixei. Chuva e sol, poeira e carvão, longe de casa sigo o roteiro mais uma estação. E alegria no coração!",
                  tecnologias: ["Java", "Spring", "Spring Cloud", "Play", "Block Chain"]),
            Autor(foto: "https:s3.xpto.paula.jpeg",
                  nome: "Paula", sobrenome: "Santana",
                  bio: "Eu gosto de artes marciais, sou graduada em Judô e Kickboxing. Adoro participar de comunidades de tecnologia especialmente voltadas para minorias. Sou apaixonada por viajar, gosto de praia e surf. Sou Eclética em música, adoro Queen e Emicida.",
                  tecnologias: ["Java", "Spring", "Kotlin", "Micronaut"]),
            Autor(foto: "https:s3.xpto.rollo.jpeg",
                  nome: "Rafael", sobrenome: "Rollo",
                  bio: "Um desenvolvedor que adora o que faz tanto quanto a música e o futebol e admira qualquer outra manifestação através da qual pessoas apaixonadas expressam sua essência.",
                  tecnologias: ["Swift", "iOS", "React Native", "Java", "Spring"]),
            Autor(foto: "https:s3.xpto.ponte.jpeg",
                  nome: "Rafael", sobrenome: "Ponte",
                  bio: "Príncipe do Oceano, Marajá dos Legados e Rei das Gambiarras; Engenheiro de software cansado e crossfiteiro com 5 gatos. Também um podcaster frustrado no @devscansados.",
                  tecnologias: ["Java", "Spring", "Hibernate", "Kotlin", "Micronaut"]),
            Autor(foto: "https:s3.xpto.yuri.jpeg",
                  nome: "Yuri", sobrenome: "Matheus",
                  bio: "Eu sou apenas um rapaz latino-americano, sem dinheiro no banco, sem parentes importantes, e vindo do interior. Mas trago de cabeça uma canção do rádio em que um antigo compositor baiano me dizia: Tudo é divino tudo é maravilhoso!",
                  tecnologias: ["Java", "Spring", "Kotlin", "Micronaut"]),
            Autor(foto: "https:s3.xpto.lucas.jpeg",
                  nome: "Lucas", sobrenome: "Félix",
                  bio: "Prepare o seu coração pras coisas que eu vou contar. Eu venho lá do sertão e posso não lhe agradar. Aprendi a dizer não, ver a morte sem chorar. E a morte, o destino, tudo. Estava fora do lugar e eu vivo pra consertar.",
                  tecnologias: ["Java", "Spring", "Kotlin", "Micronaut"]),
            Autor(foto: "https:s3.xpto.jordi.jpeg",
                  nome: "Jordi", sobrenome: "Silva",
                  bio: "Eu sou terrível, vou lhe dizer, e ponho mesmo, pra derreter. Estou com a razão no que digo, não tenho medo nem do perigo, minha caranga é maquina quente. Eu sou terrível!",
                  tecnologias: ["Java", "Spring", "Kotlin", "Micronaut"]),
            Autor(foto: "https:s3.xpto.jackson.jpeg",
                  nome: "Jackson", sobrenome: "Mota",
                  bio: "Eu nasci há dez mil anos atrás e não tem nada nesse mundo que eu não saiba demais. Eu vi as velas se acenderem para o Papa, vi Babilônia ser riscada do mapa. Vi conde Drácula sugando o sangue novo e se escondendo atrás da capa.",
                  tecnologias: ["Java", "Spring", "Kotlin", "Micronaut"]),
            Autor(foto: "https:s3.xpto.matheus.jpeg",
                  nome: "Matheus", sobrenome: "Brandino",
                  bio: "Tem lugares que me lembram minha vida, por onde andei. As histórias, os caminhos, o destino que eu mudei... Cenas do meu filme em branco e preto que o vento levou e o tempo traz.",
                  tecnologias: ["Java", "Kotlin", "Android", "Flutter"]),
        ]
    }

}

