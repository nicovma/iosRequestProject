//
//  RequestInformationViewModel.swift
//  RequestProject
//
//  Created by Nico Valentini Mac Adden on 06/12/2021.
//

import Foundation
import Alamofire

class RequestInformationViewModel : NSObject {
    

    weak var delegate: TableViewStateDelegate?
    
    
    override init() {
        super.init()
        self.fetchAPIsData()
    
    }
    
    func fetchAPIsData() {
        AF.request("https://api.publicapis.org/entries", method: .get, parameters: nil, encoding: URLEncoding.default)
                .responseData { response in
                    switch response.result {
                    case .failure(let error):
                        print(error)
                    case .success(let data):
                        do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let result = try decoder.decode(APIApisInformationResponse.self, from: data)
                            var apisInfotmation: [CellAPIInformation] = []
                            for apiItem in result.entries {
                                apisInfotmation.append(CellAPIInformation(title: apiItem.API, description: apiItem.Description, isHttp: apiItem.HTTPS, url: apiItem.Link))
                            }
                            self.delegate?.fetchFinish(items: apisInfotmation)
                        } catch { print(error) }
                    }
            }
        
      }
}

