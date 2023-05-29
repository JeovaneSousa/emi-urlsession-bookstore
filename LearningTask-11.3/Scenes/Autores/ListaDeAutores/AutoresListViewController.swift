//
//  AutoresListViewController.swift
//  LearningTask-11.3
//
//  Created by rafael.rollo on 03/08/2022.
//

import UIKit

class AutoresListViewController: UITableViewController {
    
    private enum Segues: String {
        case verDetalhesDoAutor = "verDetalhesDoAutorSegue"
        case verFormNovoAutor = "verFormNovoAutorSegue"
    }

        
    var autorAPI: AutoresAPI?
    var livrosAPI: LivrosAPI?
    
    var autores: [Autor] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        // Do any additional setup after loading the view.
    
        setupViews()
        carregaAutores()
    }

    private func setupViews() {
        tableView.register(TableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: TableSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = TableSectionHeaderView.alturaBase
        tableView.sectionHeaderTopPadding = 0
    }
    
    private func carregaAutores() {
        guard let autorAPI = autorAPI else { return }
        
        autorAPI.getAll(fromUrl: autorAPI.uri) {[weak self] response in
            
            self?.autores = response
            
        } failureHandler: { error in
            guard let description = error.errorDescription else {return}

            UIAlertController.showError(description, in: self)
        }

    }

    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueId = segue.identifier,
              let expectedSegue = AutoresListViewController.Segues(rawValue: segueId) else { return }
    
        switch expectedSegue {
        case .verDetalhesDoAutor:
            prepareForDetalhesDoAutor(segue, sender)
        case .verFormNovoAutor:
            prepareForFormNovoAutor(segue, sender)
        }
    }
    
    private func prepareForDetalhesDoAutor(_ segue: UIStoryboardSegue, _ sender: Any?) {
        guard let celula = sender as? AutorTableViewCell,
              let autorViewController = segue.destination as? AutorViewController else {
            fatalError("Não foi possível executar segue \(segue.identifier!)")
        }
    
        autorViewController.livrosAPI = livrosAPI
        autorViewController.autor = celula.autor
    }
    
    private func prepareForFormNovoAutor(_ segue: UIStoryboardSegue, _ sender: Any?) {
        guard let novoAutorViewController = segue.destination as? NovoAutorViewController else {
            fatalError("Não foi possível executar segue \(segue.identifier!)")
        }
    
        novoAutorViewController.delegate = self
    }
    
}

// MARK: - NovoAutor delegation implementations
extension AutoresListViewController: NovoAutorViewControllerDelegate {
    func novoAutorViewController(_ controller: NovoAutorViewController, adicionou autor: Autor) {
        autores.append(autor)
    }
}

// MARK: - UITableViewDataSource Implementations
extension AutoresListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autores.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AutorTableViewCell", for: indexPath) as? AutorTableViewCell else {
            fatalError("Não foi possível obter celula para a lista de autores")
        }
        
        let autor = autores[indexPath.row]
        cell.autor = autor
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate Implementations
extension AutoresListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableSectionHeaderView.reuseId) as? TableSectionHeaderView else {
            fatalError("Não foi possível obter view de header para a lista de autores.")
        }
        
        headerView.titulo = "Todos os Autores"
        return headerView
    }
    
}
