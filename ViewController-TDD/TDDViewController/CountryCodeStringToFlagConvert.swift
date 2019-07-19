struct CountryCodeStringToFlagConvert {
    
    enum CountryCodeStringToFlagConvertError: Error {
        case flagNotFound
    }
    
    static func flag(country:String) throws -> String {
        let base = 127397
        var usv = String.UnicodeScalarView()
        for utfc in country.uppercased().utf16 {
            guard let us = UnicodeScalar(base + Int(utfc)) else {
                throw CountryCodeStringToFlagConvertError.flagNotFound
            }
            usv.append(us)
        }
        return String(usv)
    }
    
}
