//
//  DataDetectorTests.swift
//  NSDataDetectorTests
//
//  Created by Vinicius Uzeda on 07/12/2021.
//

import XCTest
@testable import DataDetector

class DataDetectorTests: XCTestCase {
    let string = """
    2020/11/16 06:51:14:239  [INFO] Application SDK User Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 14\\_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 (Application SDK/1.2.3.4; com.application.bundleid/1.2.3.4)
    2020/11/16 06:51:14:276  [INFO] ====== Reset Launch Parameters: www.application.com [PAR: (not set)] [PA (not set)][PA 1] [ParameterWithLongName 0] [Param 1] [Param CompoundName 1] [Pa 1] [PA 1] [Pa 1] [PA 1] [Pa 1] [PA 1] [PAra 0] [PAra 0] [PArame 0] [PA 1] [Parameter with long description 0] [PA 1] [Param NAME 1] [Parameter Extended Name 24] [ParameterWithLongName 0] [ParameterWithLongName 0]
    2020/11/16 06:51:14:276  [INFO] ====== Application: [com.application.bundleid], Framework version: [@(#)PROGRAM:Application  PROJECT:ApplicationProject\\-1.2.3] [1.2.3] [4]
    2020/11/16 06:51:14:276  [INFO] \\*\\*\\*\\*\\* APNs Environment: [No TCMobileProvision]
    2020/11/16 06:51:14:306  [INFO] Application did launch
    2020/11/16 06:51:14:316  [INFO] [FEA T] someLogMessage
    2020/11/16 06:51:14:829  [INFO] —— https://www.application.com/path/to/api?
    """

    func testDateAndLink() throws {
        let matches = try DataDetector.matches(string: string, patterns: [.date, .link])

        XCTAssertEqual(matches, [
            "2020/11/16 06:51:14",
            "2020/11/16 06:51:14",
            "www.application.com",
            "2020/11/16 06:51:14",
            "2020/11/16 06:51:14",
            "2020/11/16 06:51:14",
            "2020/11/16 06:51:14",
            "2020/11/16 06:51:14",
            "https://www.application.com/path/to/api?",
        ])
    }

    func testDate() throws {
        let matches = try DataDetector.matches(string: string, patterns: [.date])

        XCTAssertEqual(matches, [
            "2020/11/16 06:51:14",
            "2020/11/16 06:51:14",
            "2020/11/16 06:51:14",
            "2020/11/16 06:51:14",
            "2020/11/16 06:51:14",
            "2020/11/16 06:51:14",
            "2020/11/16 06:51:14",
        ])
    }

    func testLink() throws {
        let matches = try DataDetector.matches(string: string, patterns: [.link])

        XCTAssertEqual(matches, [
            "www.application.com",
            "https://www.application.com/path/to/api?",
        ])
    }
}
