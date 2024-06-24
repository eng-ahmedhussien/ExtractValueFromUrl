 func ExtractValueFromUrl(url: URL) {
        let pattern = "Page_Name=([^&]+)&Page_Value=([^&?]+)"
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let nsString = "\(url)" as NSString
            let results = regex.matches(in:  "\(url)", options: [], range: NSRange(location: 0, length: nsString.length))
            
            if let match = results.first {
                let pageNameRange = match.range(at: 1)
                let pageValueRange = match.range(at: 2)
                
                let pageName = nsString.substring(with: pageNameRange)
                let pageValue = nsString.substring(with: pageValueRange)
                
                guard let pageName = DeepLinkPageNameEnum(rawValue: pageName) else {
                    print("Recipe name not found")
                    return
                }
                self.pageName = pageName
                self.pageValue = pageValue
                
                print("Page_Name: \(pageName)")
                print("Page_Value: \(pageValue)")
            } else {
                print("No match found")
            }
        } catch let error {
            print("Invalid regex: \(error.localizedDescription)")
        }
        
    }
