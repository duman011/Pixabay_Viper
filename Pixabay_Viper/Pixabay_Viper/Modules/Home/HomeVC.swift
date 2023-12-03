//
//  HomeView.swift
//  Pixabay_Viper
//
//  Created by Yaşar Duman on 3.12.2023.
//


import UIKit


final class HomeVC: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterHomeProtocol?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 70
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
}

// MARK: - UI Setup
extension HomeVC {
    private func setupUI() {
        navigationItem.title = "Pixabay API"
        view.backgroundColor = .purple
        
        view.addSubview(tableView)
        tableView.fillSuperview()
    }
    
    //MARK: - Register Custom Cell
    private func collectionCellRegister() {
        
    }
    
    //MARK: - Setup Delegates
    private func setupDelegates() {
        
    }
}

// MARK: - UITableView Delegate & Data Source
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter?.imagesList?[indexPath.row].tags
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(at: indexPath.row)
    }
}

extension HomeVC : PresenterToViewHomeProtocol {
    func onDataFetchSuccess() {
        print("View receives the response from Presenter and updates itself.")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func onDataFetchFailure(_ error: Error?) {
        print("View receives the response from Presenter with error: \(String(describing: error))")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
