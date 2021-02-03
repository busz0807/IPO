//
//  FundAnslystReportModels.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 28/1/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum FundAnslystReport
{
  // MARK: Use cases
  
  enum Something {
    struct Request {
        
    }
    struct Response {
        var analystReportData: AnalystReportModel?
    }
    struct ViewModel {
        var analystReportData: AnalystReportModel?
    }
  }
    enum MonthlyData {
      struct Request {
          
      }
      struct Response {
          var analystReportMonthlyData: [AnalystReportMonthlyModel]?
        var error: Error?
      }
      struct ViewModel {
          var analystReportMonthlyData: [AnalystReportMonthlyModel]?
        var error: Error?
      }
    }
    enum WeeklyData {
      struct Request {
          
      }
      struct Response {
          var analystReportWeeklyData: [AnalystReportWeeklyModel]?
        var error: Error?
      }
      struct ViewModel {
          var analystReportWeeklyData: [AnalystReportWeeklyModel]?
        var error: Error?
      }
    }
    enum AnalystTalk {
        struct Request {
            
        }
        struct Response {
            var analystTalkData: [AnalystTalksModel]?
          var error: Error?
        }
        struct ViewModel {
            var analystTalkData: [AnalystTalksModel]?
          var error: Error?
        }
    }
}