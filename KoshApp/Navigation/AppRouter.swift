//
//  AppRouter.swift
//  KoshApp
//
//  Created by Shubham Sahgal on 16/10/26.
//

import Foundation
import Combine

public enum AppTab: Hashable {
    case home, expenses, atms, statements, settings
}

public enum Route: Hashable {
    case expenseDetails(UUID)
    case offers(campaign: String?)
    case cardControls
}

enum Sheet: String, Identifiable {
    var id: String {
        rawValue
    }
    case addExpense
}

@MainActor
public final class AppRouter: ObservableObject {
    @Published public var selectedTab: AppTab = .home
    @Published public var homePath: [Route] = []
    @Published public var expensesPath: [Route] = []
    @Published public var settingsPath: [Route] = []
    @Published var sheet: Sheet?
    
    func push(_ route:Route,on tab:AppTab) {
        selectedTab = tab
        switch tab {
        case .home: homePath.append(route)
        case .expenses: expensesPath.append(route)
        case .settings: settingsPath.append(route)
        case .atms, .statements: break
        }
    }
    
    func popToRoot(_ tab: AppTab) {
            switch tab {
            case .home: homePath.removeAll()
            case .expenses: expensesPath.removeAll()
            case .settings: settingsPath.removeAll()
            case .atms, .statements: break
            }
        }

        func present(_ sheet: Sheet) { self.sheet = sheet }
        func dismissSheet() { sheet = nil }
}
