/// Country is an enum with few static functions that provides the following functionality:
///
///  - get country code from phone number
///  - get country code from currency code
///  - get flag emoji from country code
///  - get flag emoji from currenty code
///  - get flag emoji from phone code
///
/// Example:
///
/// ```swift
/// Currency.countryCode(fromCurrencyCode: "usd")
/// ```
public enum Country {

    /// Country code from phone code
    /// - Parameters:
    ///   - fromPhoneCode: ``String`` phone code ("+49" for example)
    public static func countryCode(fromPhoneCode phoneCode: String) -> String? {
        let codeValue = phoneCode.replacingOccurrences(of: "+", with: "")
        guard let code = Constants.phonesToFlags[codeValue] else {
            return nil
        }
        return code
    }

    /// Country code from currency code
    /// - Parameters:
    ///   - fromCurrnecyCode: ``String`` phone code ("GBP" for example)
    public static func countryCode(fromCurrencyCode currencyCode: String) -> String? {
        let currencyCode = currencyCode.uppercased()
        if let code = Constants.currencyExceptions[currencyCode] {
            return code
        } else if !Constants.currencyFewOptions.contains(currencyCode) {
            return String(currencyCode.dropLast())
        }
        return nil
    }

    /// Emoji flag from country code
    /// - Parameters:
    ///   - forCountryCode: ``String`` phone code ("US" for example)
    public static func flagEmoji(forCountryCode countryCode: String) -> String {
        let countryCode = countryCode.uppercased()
        guard !countryCode.isEmpty else { return "🏳️" }
        let base: UInt32 = 127_397
        var code = ""
        for scalar in countryCode.unicodeScalars {
            if let unicode = UnicodeScalar(base + scalar.value) {
                code.unicodeScalars.append(unicode)
            }
        }
        return String(code)
    }

    /// Emoji flag from country code
    /// - Parameters:
    ///   - forCurrencyCode: ``String`` phone code ("USD" for example)
    public static func flagEmoji(forCurrencyCode currencyCode: String) -> String {
        let currencyCode = currencyCode.uppercased()
        return flagEmoji(forCountryCode: String(currencyCode.dropLast()))
    }

    /// Emoji flag from phone code
    /// - Parameters:
    ///   - fromPhoneCode: ``String`` phone code ("+49" for example)
    public static func flagEmoji(forPhoneCode phoneCode: String) -> String {
        guard let countryCode = Country.countryCode(fromPhoneCode: phoneCode) else {
            return "🏳️"
        }
        return flagEmoji(forCountryCode: countryCode)
    }
}

private extension Country {

    enum Constants {
        static let currencyExceptions = [
            "RMB": "CN",
            "CU": "CU",
            "NID": "IQ"
        ]
        // The list of currencies that can't be used for getting the exact Flag for
        static let currencyFewOptions: Set<String> = [
            "ANG",
            "XPF",
            "XAF",
            "XOF",
            "XCD"
        ]
        static let nonUniqPhonesToFlags: [String: [String]] = [
            "1": ["AS", "AI", "AG", "BS", "BB", "BM", "CA", "DM", "DO", "GD", "GU", "JM", "MP", "MS", "PR", "TT", "US", "KN", "LC", "VC"],
            "262": ["YT", "RE"],
            "44": ["GB", "GG", "IM", "JE"],
            "47": ["NO", "SJ"],
            "500": ["GS", "FK"],
            "590": ["BL", "GP", "MF"],
            "595": ["GY", "PY"],
            "61": ["AU", "CX", "CC"]
        ]
        static let phonesToFlags: [String: String] = [
            "1": "US",
            "262": "YT",
            "44": "GB",
            "47": "NO",
            "500": "GS",
            "590": "BL",
            "595": "GY",
            "61": "AU",
            "93": "AF",
            "355": "AL",
            "213": "DZ",
            "376": "AD",
            "244": "AO",
            "54": "AR",
            "374": "AM",
            "297": "AW",
            "43": "AT",
            "994": "AZ",
            "973": "BH",
            "880": "BD",
            "375": "BY",
            "32": "BE",
            "501": "BZ",
            "229": "BJ",
            "975": "BT",
            "387": "BA",
            "267": "BW",
            "55": "BR",
            "246": "IO",
            "359": "BG",
            "226": "BF",
            "257": "BI",
            "855": "KH",
            "237": "CM",
            "238": "CV",
            "345": "KY",
            "236": "CF",
            "235": "TD",
            "56": "CL",
            "86": "CN",
            "57": "CO",
            "269": "KM",
            "242": "CG",
            "682": "CK",
            "506": "CR",
            "385": "HR",
            "53": "CU",
            "537": "CY",
            "420": "CZ",
            "45": "DK",
            "253": "DJ",
            "593": "EC",
            "20": "EG",
            "503": "SV",
            "240": "GQ",
            "291": "ER",
            "372": "EE",
            "251": "ET",
            "298": "FO",
            "679": "FJ",
            "358": "FI",
            "33": "FR",
            "594": "GF",
            "689": "PF",
            "241": "GA",
            "220": "GM",
            "995": "GE",
            "49": "DE",
            "233": "GH",
            "350": "GI",
            "30": "GR",
            "299": "GL",
            "502": "GT",
            "224": "GN",
            "245": "GW",
            "509": "HT",
            "504": "HN",
            "36": "HU",
            "354": "IS",
            "91": "IN",
            "62": "ID",
            "964": "IQ",
            "353": "IE",
            "972": "IL",
            "39": "IT",
            "81": "JP",
            "962": "JO",
            "77": "KZ",
            "254": "KE",
            "686": "KI",
            "965": "KW",
            "996": "KG",
            "371": "LV",
            "961": "LB",
            "266": "LS",
            "231": "LR",
            "423": "LI",
            "370": "LT",
            "352": "LU",
            "261": "MG",
            "265": "MW",
            "60": "MY",
            "960": "MV",
            "223": "ML",
            "356": "MT",
            "692": "MH",
            "596": "MQ",
            "222": "MR",
            "230": "MU",
            "52": "MX",
            "377": "MC",
            "976": "MN",
            "382": "ME",
            "212": "MA",
            "95": "MM",
            "264": "NA",
            "674": "NR",
            "977": "NP",
            "31": "NL",
            "599": "AN",
            "687": "NC",
            "64": "NZ",
            "505": "NI",
            "227": "NE",
            "234": "NG",
            "683": "NU",
            "672": "NF",
            "968": "OM",
            "92": "PK",
            "680": "PW",
            "507": "PA",
            "675": "PG",
            "51": "PE",
            "63": "PH",
            "48": "PL",
            "351": "PT",
            "974": "QA",
            "40": "RO",
            "250": "RW",
            "685": "WS",
            "378": "SM",
            "966": "SA",
            "221": "SN",
            "381": "RS",
            "248": "SC",
            "232": "SL",
            "65": "SG",
            "421": "SK",
            "386": "SI",
            "677": "SB",
            "27": "ZA",
            "34": "ES",
            "94": "LK",
            "249": "SD",
            "597": "SR",
            "268": "SZ",
            "46": "SE",
            "41": "CH",
            "992": "TJ",
            "66": "TH",
            "228": "TG",
            "690": "TK",
            "676": "TO",
            "216": "TN",
            "90": "TR",
            "993": "TM",
            "688": "TV",
            "256": "UG",
            "380": "UA",
            "971": "AE",
            "598": "UY",
            "998": "UZ",
            "678": "VU",
            "681": "WF",
            "967": "YE",
            "260": "ZM",
            "263": "ZW",
            "591": "BO",
            "673": "BN",
            "243": "CD",
            "225": "CI",
            "379": "VA",
            "852": "HK",
            "98": "IR",
            "850": "KP",
            "82": "KR",
            "856": "LA",
            "218": "LY",
            "853": "MO",
            "389": "MK",
            "691": "FM",
            "373": "MD",
            "258": "MZ",
            "970": "PS",
            "872": "PN",
            "7": "RU",
            "290": "SH",
            "508": "PM",
            "239": "ST",
            "252": "SO",
            "963": "SY",
            "886": "TW",
            "255": "TZ",
            "670": "TL",
            "58": "VE",
            "84": "VN",
            "284": "VG",
            "340": "VI"
        ]
    }
}
