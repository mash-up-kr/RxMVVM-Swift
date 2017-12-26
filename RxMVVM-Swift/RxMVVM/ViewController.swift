//
//  ViewController.swift
//  RxMVVM
//
//  Created by Lucas on 2017. 12. 23..
//  Copyright © 2017년 Lucas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: ListViewModel?
    var tableViewCellViewModels: [RepoItemViewModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel = RepoItemViewModel(repoService: Service())
        
        viewModel?.repoItems.subscribe(onNext: { (items) in
            self.tableViewCellViewModels = items
            self.tableView.reloadData()
        })
            
        viewModel?.loadRepoItems()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = tableViewCellViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? Cell ?? Cell()
    
        cell.viewModel = cellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCellViewModels.count
    }
    
}




class Cell: UITableViewCell {
    @IBOutlet weak var repoNameLabel: UILabel!
    
    var viewModel: RepoItemViewModel? {
        didSet {
            self.repoNameLabel.text = viewModel?.model?.name ?? ""
        }
    }
    

}

