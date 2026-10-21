//
//  KoshAppRouterTests.swift
//  KoshApp
//
//  Created by Shubham Sahgal on 22/10/26.
//

import XCTest
@testable import KoshApp

@MainActor
final class AppRouterTests: XCTestCase {

    func test_push_selectsTab_andAppendsOnlyToThatStack() {
        let router = AppRouter()

        router.push(.cardControls, on: .settings)

        XCTAssertEqual(router.selectedTab, .settings)
        XCTAssertEqual(router.settingsPath, [.cardControls])
        XCTAssertTrue(router.homePath.isEmpty)
    }

    func test_popToRoot_clearsOnlyThatTab() {
        let router = AppRouter()
        let id = UUID()
        router.push(.expenseDetails(id), on: .home)
        router.push(.offers(campaign: "fuel"), on: .settings)

        router.popToRoot(.home)

        XCTAssertTrue(router.homePath.isEmpty)
        XCTAssertEqual(router.settingsPath, [.offers(campaign: "fuel")])
    }

    func test_presentAndDismissSheet() {
        let router = AppRouter()

        router.present(.addExpense)
        XCTAssertEqual(router.sheet, .addExpense)

        router.dismissSheet()
        XCTAssertNil(router.sheet)
    }
}
