# NSDataDetector

This project demonstrates a weird difference in behaviour between Xcodes 12.5.1 and 13.1 regarding `NSDataDetector`.
Try to run this app and its unit tests using these two Xcode versions and take a look at the different outputs:

## Xcode 12.5.1

```
SCENARIO: Original string
DATE + LINK: ["2020/11/16", "2020/11/16", "www.application.com", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "https://www.application.com/path/to/api?"]
DATE: ["2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16"]
LINK: ["www.application.com", "https://www.application.com/path/to/api?"]

SCENARIO: Without parenthesis
DATE + LINK: ["2020/11/16", "2020/11/16", "www.application.com", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "https://www.application.com/path/to/api?"]
DATE: ["2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16"]
LINK: ["www.application.com", "https://www.application.com/path/to/api?"]

SCENARIO: Without square brackets
DATE + LINK: ["2020/11/16", "2020/11/16", "www.application.com", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "https://www.application.com/path/to/api?"]
DATE: ["2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16"]
LINK: ["www.application.com", "https://www.application.com/path/to/api?"]

SCENARIO: Without parenthesis and square brackets
DATE + LINK: ["2020/11/16", "2020/11/16", "www.application.com", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "https://www.application.com/path/to/api?"]
DATE: ["2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16"]
LINK: ["www.application.com", "https://www.application.com/path/to/api?"]
```

## Xcode 13.1

```
SCENARIO: Original string
DATE + LINK: ["2020/11/16"]
DATE: ["2020/11/16"]
LINK: ["www.application.com", "https://www.application.com/path/to/api?"]

SCENARIO: Without parenthesis
DATE + LINK: ["2020/11/16", "2020/11/16", "www.application.com"]
DATE: ["2020/11/16", "2020/11/16"]
LINK: ["www.application.com", "https://www.application.com/path/to/api?"]

SCENARIO: Without square brackets
DATE + LINK: ["2020/11/16"]
DATE: ["2020/11/16"]
LINK: ["www.application.com", "https://www.application.com/path/to/api?"]

SCENARIO: Without parenthesis and square brackets
DATE + LINK: ["2020/11/16", "2020/11/16", "www.application.com", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "https://www.application.com/path/to/api?"]
DATE: ["2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16", "2020/11/16"]
LINK: ["www.application.com", "https://www.application.com/path/to/api?"]
```
