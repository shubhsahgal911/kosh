//
//  RootView.swift
//  KoshApp
//
//  Created by Shubham Sahgal on 21/10/26.
//

import SwiftUI
import DashboardFeature
import ExpensesFeature
import OffersFeature
import SettingsFeature
import MapFeature
import StatementFeature

struct RootView: View {
    let container: AppContainer
    
    @ObservedObject var router: AppRouter
    
    var body: some View {
        TabView (selection: $router.selectedTab) {
            NavigationStack(path:$router.homePath) {
                DashboardView(
                    viewModel:container.makeDashboardViewModel(),
                    onAddExpense:  router.present(.addExpense) ,
                    onSelectExpense: { router.push(.expenseDetails($0), on: .home) }
                ).navigationDestination(for: Route.self, destination: destination)
            }.tabItem {
                Label("Home", systemImage: "house")
            }.tag(AppTab.home)
            
            NavigationStack(path: $router.expensesPath) {
                ExpenseView().navigationDestination(for: Route.self, destination: destination)
            }.tabItem {
                Label("Expense", systemImage: "list.bullet.rectangle")
            }.tag(AppTab.expenses)
            
            NavigationStack {
                ATMMapView()
            }.tabItem {
                Label("ATMs", systemImage: "mappin.and.ellipse")
            }.tag(AppTab.atms)
            
            NavigationStack {
                StatementView()
            }.tabItem {
                Label("Statments", systemImage: "doc.richtext")
            }.tag(AppTab.statements)
            
            NavigationStack (path: $router.settingsPath) {
                SettingsView {
                    router.push(.cardControls,on: .settings)
                } onOpenOffers: {
                    router.push(.offers(campaign: nil),on: .settings)
                }.navigationDestination(for: Route.self, destination: destination)
            }.tabItem {
                Label("Settings", systemImage:"gearshape" )
            }.tag(AppTab.settings)
        }.tint(Color("BrandPrimary")).sheet(item: $router.sheet) { sheet in
            switch sheet {
            case .addExpense:
                AddExpenseView(onClose: { router.dismissSheet() })
            }
        }
    }
    
    @ViewBuilder
    private func destination(for route:Route) -> some View {
        switch route {
        case .expenseDetails(let id):
            ExpenseDetailView(expenseID: id)
        case .offers(campaign: let campaign):
            OffersView()
        case .cardControls:
            SettingsView(onOpenCardsControl: {}, onOpenOffers: {})
        }
        
    }
}

