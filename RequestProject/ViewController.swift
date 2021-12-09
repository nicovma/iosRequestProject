//
//  ViewController.swift
//  RequestProject
//
//  Created by Nico Valentini Mac Adden on 06/12/2021.
//

import UIKit
import Alamofire

class RequestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TableViewStateDelegate {
   
    var aPISInformation: [CellAPIInformation] = []
    
    let requestCellReuseIdentifier = "RequestItemCell"

    @IBOutlet weak var tableView: UITableView!
    
    private var requestInfoViewModel: RequestInformationViewModel = RequestInformationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "RequestCellView", bundle: nil), forCellReuseIdentifier: requestCellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        requestInfoViewModel.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aPISInformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: RequestCellView = self.tableView.dequeueReusableCell(withIdentifier: requestCellReuseIdentifier) as! RequestCellView
        let cellModel = aPISInformation[indexPath.row]
        cell.setApiInformation(information: cellModel)
        
        return cell
        
        
    }
    
    func fetchFinish(items: [CellAPIInformation]) {
        aPISInformation = items
        self.tableView.reloadData()
    }
}

protocol TableViewStateDelegate: class {
    func fetchFinish(items: [CellAPIInformation])
}
