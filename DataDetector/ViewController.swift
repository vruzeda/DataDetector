//
//  ViewController.swift
//  NSDataDetector
//
//  Created by Vinicius Uzeda on 07/12/2021.
//

import UIKit

class ViewController: UIViewController {
    private static let originalString = """
        2020/11/16 06:51:14:239  [INFO] Application SDK User Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 14\\_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 (Application SDK/1.2.3.4; com.application.bundleid/1.2.3.4)
        2020/11/16 06:51:14:276  [INFO] ====== Reset Launch Parameters: www.application.com [PAR: (not set)] [PA (not set)][PA 1] [ParameterWithLongName 0] [Param 1] [Param CompoundName 1] [Pa 1] [PA 1] [Pa 1] [PA 1] [Pa 1] [PA 1] [PAra 0] [PAra 0] [PArame 0] [PA 1] [Parameter with long description 0] [PA 1] [Param NAME 1] [Parameter Extended Name 24] [ParameterWithLongName 0] [ParameterWithLongName 0]
        2020/11/16 06:51:14:276  [INFO] ====== Application: [com.application.bundleid], Framework version: [@(#)PROGRAM:Application  PROJECT:ApplicationProject\\-1.2.3] [1.2.3] [4]
        2020/11/16 06:51:14:276  [INFO] \\*\\*\\*\\*\\* APNs Environment: [No TCMobileProvision]
        2020/11/16 06:51:14:306  [INFO] Application did launch
        2020/11/16 06:51:14:316  [INFO] [FEA T] someLogMessage
        2020/11/16 06:51:14:829  [INFO] —— https://www.application.com/path/to/api?
        """

    @IBOutlet weak var parenthesisSwitch: UISwitch!
    @IBOutlet weak var squareBracketsSwitch: UISwitch!
    @IBOutlet weak var scenarioTextView: UITextView!
    @IBOutlet weak var detectedMatchesTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        detectMatches()
    }

    @IBAction func scenarioDidChange(_ sender: Any) {
        detectMatches()
    }

    private func detectMatches() {
        var scenarioText = ViewController.originalString
        if !parenthesisSwitch.isOn {
            scenarioText = scenario(with: scenarioText, escaping: "\\(.*?\\)")
        }
        if !squareBracketsSwitch.isOn {
            scenarioText = scenario(with: scenarioText, escaping: "\\[.*?\\]")
        }

        scenarioTextView.text = scenarioText
        detectedMatchesTextView.text = """
            DATE + LINK: \(try! DataDetector.matches(string: scenarioText, patterns: [.date, .link]))
            DATE: \(try! DataDetector.matches(string: scenarioText, patterns: [.date]))
            LINK: \(try! DataDetector.matches(string: scenarioText, patterns: [.link]))
            """
    }

    private func scenario(with string: String, escaping pattern: String) -> String {
        try! NSRegularExpression(pattern: pattern).stringByReplacingMatches(
            in: string,
            options: [],
            range: NSRange(location: 0, length: string.count),
            withTemplate: "ESCAPE"
        )
    }
}
