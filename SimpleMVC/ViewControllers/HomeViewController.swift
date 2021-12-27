//
//  HomeViewController.swift
//  SimpleMVC
//
//  Created by 𝙷𝚘𝚜𝚎𝚒𝚗 𝙹𝚊𝚗𝚊𝚝𝚒  on 12/27/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var pageNumber = 1
    private var responseArraySearch = [Search]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchData("run")
    }
    
    private func fetchData(_ StringSearch : String) {
        RequestHelper.dataRequest(with: "http://www.omdbapi.com/?s=\(StringSearch)&apikey=6ca8df0&page=\(pageNumber)", objectType: GeneralSearch.self) { [weak self] (result: Result) in
            switch result {
            case .success(let object):
                self?.searchModeValid(object)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func searchModeValid(_ object : GeneralSearch) {
        if pageNumber == 1  {
            responseArraySearch = object.search
        }
        else {
            responseArraySearch.append(contentsOf: object.search)
        }

    }
}
//MARK: - UITableViewDataSource
extension HomeViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseArraySearch.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
        cell.configuration(NameMovie: "\(responseArraySearch[indexPath.row].title!)",
                           imdbMovie: "Type:\(responseArraySearch[indexPath.row].type)",
                           yearMovie: "Year:\(responseArraySearch[indexPath.row].year!)",
                           imageURL: "\(responseArraySearch[indexPath.row].poster)")
        return cell
        
    }
    
}
//MARK: - UITableViewDelegate
extension HomeViewController : UITableViewDelegate {
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let indexP = indexPath.row
        let dataCount = responseArraySearch.count
        if indexP == dataCount - 1 { 
            pageNumber += 1
            fetchData("run")
        }
    }
}
