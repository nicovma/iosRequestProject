//
//  RequestCellView.swift
//  RequestProject
//
//  Created by Nico Valentini Mac Adden on 06/12/2021.
//

import Foundation
import UIKit


class RequestCellView: UITableViewCell {
    
    @IBOutlet weak var apiTitle: UILabel!
    @IBOutlet weak var isHttps: UILabel!
    @IBOutlet weak var apiDescription: UILabel!
    @IBOutlet weak var goToApiButton: UIButton!
    private var apiURL:String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    func setApiInformation(information: CellAPIInformation){
        apiTitle.text = information.title
        apiDescription.text = information.description
        apiURL = information.url
        isHttps.text = information.isHttp ? "Yes" : "No"
        
    }
    
    @IBAction func goToApiButtonPressed(sender: UIButton) {
        guard let url = URL(string: apiURL) else {
          return
        }

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
}
