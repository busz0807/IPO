//
//  IPORolloverRequests.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 1/2/21.
//

import Foundation
import Alamofire


enum Funds: URLRequestConvertible {
    case analystReport, iPO

    var  method: HTTPMethod {
        switch self {
        case .analystReport: return .get
        case .iPO: return .post
            
        }
    }
    var path: String {
        switch self {
        case .analystReport: return "https://servicebeta.poems.in.th/FundSmart/api/funds/reports"
        case .iPO: return "https://www.fame.in.th/FAMEMvc/api/DashUnAuthor/IPO"
            
        }
    }
    
    func asURLRequest() ->  URLRequest {
        let urlString = "\(path)"
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}



