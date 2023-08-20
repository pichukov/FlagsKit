import XCTest
@testable import FlagsKit

final class FlagsKitTests: XCTestCase {

    func testCountryCodeFromPhoneCodeWithPlusSymbol() throws {
        // given
        let code = "+420"
        // when
        let countryCode = Country.countryCode(fromPhoneCode: code)
        // then
        XCTAssertEqual(countryCode, "CZ")
    }

    func testCountryCodeFromPhoneCodeWithoutPlusSymbol() throws {
        // given
        let code = "420"
        // when
        let countryCode = Country.countryCode(fromPhoneCode: code)
        // then
        XCTAssertEqual(countryCode, "CZ")
    }

    func testCountryCodeFromCurrencyCode() throws {
        // given
        let code = "USD"
        // when
        let countryCode = Country.countryCode(fromCurrencyCode: code)
        // then
        XCTAssertEqual(countryCode, "US")
    }

    func testEmojiFlagFromCountryCode() throws {
        // given
        let code = "US"
        // when
        let flag = Country.flagEmoji(forCountryCode: code)
        // then
        XCTAssertEqual(flag, "🇺🇸")
    }

    func testEmojiFlagFromCurrencyCode() throws {
        // given
        let code = "USD"
        // when
        let flag = Country.flagEmoji(forCurrencyCode: code)
        // then
        XCTAssertEqual(flag, "🇺🇸")
    }

    func testEmojiFlagFromPhoneCodeWithPlusSymbol() throws {
        // given
        let code = "+420"
        // when
        let flag = Country.flagEmoji(forPhoneCode: code)
        // then
        XCTAssertEqual(flag, "🇨🇿")
    }

    func testEmojiFlagFromPhoneCodeWithoutPlusSymbol() throws {
        // given
        let code = "420"
        // when
        let flag = Country.flagEmoji(forPhoneCode: code)
        // then
        XCTAssertEqual(flag, "🇨🇿")
    }

    func testEmojiFlagFromEmptyCountryCode() throws {
        // given
        let code = ""
        // when
        let flag = Country.flagEmoji(forCountryCode: code)
        // then
        XCTAssertEqual(flag, "🏳️")
    }

    func testEmojiFlagFromEmptyCurrencyCode() throws {
        // given
        let code = ""
        // when
        let flag = Country.flagEmoji(forCurrencyCode: code)
        // then
        XCTAssertEqual(flag, "🏳️")
    }

    func testEmojiFlagFromEmptyPhoneCode() throws {
        // given
        let code = ""
        // when
        let flag = Country.flagEmoji(forPhoneCode: code)
        // then
        XCTAssertEqual(flag, "🏳️")
    }
}
