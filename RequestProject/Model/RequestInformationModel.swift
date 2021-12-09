//
//  RequestInformationModel.swift
//  RequestProject
//
//  Created by Nico Valentini Mac Adden on 06/12/2021.
//

import Foundation
import UIKit

struct CellAPIInformation: Decodable { //UIITEM
  let title: String
  let description: String
  let isHttp: Bool
  let url: String
}

struct APIInformation: Decodable {
  let API: String
  let Auth: String
  let Description: String
  let HTTPS: Bool
  let Category: String
  let Cors: String
  let Link: String
}

struct APIApisInformationResponse: Decodable {
  let entries: [APIInformation]
  let count: Int
}
