//
//  ViewController.swift
//  Meal Munch
//
//  Created by Marie Harmsen on 22/01/2023.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate {
    private var recipies = Recipe()
    private let viewModel: HomeViewModel

    private lazy var tableView = TableView().customTable
    private lazy var searchBar = SearchBarView().customSearchBar
    
    init(viewModel: HomeViewModel) {
         self.viewModel = viewModel
         super.init(nibName: nil, bundle: nil)
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.becomeFirstResponder()

        setupUI()
        getData()
    }
    
    private func setupUI() {
        title = "Meal Munch"
        view.backgroundColor = .white
        tableView.tableHeaderView = searchBar
        tableView.bounces = false
        tableView.register(ImageTextCell.self, forCellReuseIdentifier: "ImageTextCell")
        view.addSubview(tableView)
    }
    
    private func getData() {        
        viewModel.getRecipeData(baseURL: "https://api.spoonacular.com/recipes/complexSearch?", query: searchBar.text ?? "Pasta", apiKey: APIKeys().getSpoonfulAPIKey()) { [weak self] result in
            switch result {
            case .success(let recipies):
                self?.recipies = recipies
                self?.displayData()
            case .failure(let error):
                self?.displayError(message: "\(error)")
            }
        }
    }
    
    private func displayData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func displayError(message: String) {
        DispatchQueue.main.async {
            let alertPopUp = UIAlertController(title: "Error occurred", message: message, preferredStyle: .alert)
            alertPopUp.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertPopUp, animated: true)
        }
    }
}

// MARK: UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTextCell") as! ImageTextCell
        if let urlName = recipies.meals?[indexPath.row].image {
            cell.setupValues(title: recipies.meals?[indexPath.row].title ?? "",
                             imageURL: urlName)
        }
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipies.meals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: UISearchBarDelegate

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        getData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}
