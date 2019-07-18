struct Country {
    let name: String
    let code: String
    
    func flag() -> String? {
        do {
            return try CountryCodeStringToFlagConvert.flag(country: code)
        } catch {
            return ""
        }
    }
}

