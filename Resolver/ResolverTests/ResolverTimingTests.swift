//
//  ResolverTimingTEsts.swift
//  ResolverTests
//
//  Created by Jon Lazar on 10/31/19.
//  Copyright © 2019 com.hmlong. All rights reserved.
//

import XCTest
@testable import Resolver

class ResolverTimingTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testResolverRegisteringImplementationAndLocallyRegisteringOrdering() {
        struct LocalTimerService: TimingProtocol { }

        /// RegisteredTimerService is registered in the global implementation of ResolverRegistering
        Resolver.register { LocalTimerService() }.implements(TimingProtocol.self)

        let consumer: TimerConsumer = Resolver.resolve(TimerConsumer.self)

        XCTAssertNotNil(consumer.timer)
        XCTAssertTrue(consumer.timer is RegisteredTimerService)
        XCTAssertFalse(consumer.timer is LocalTimerService)
    }
}
