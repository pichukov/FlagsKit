<div align="center">
  <img width="400" src="https://raw.githubusercontent.com/pichukov/PublicAssets/master/FlagsKit/FlagsKitLogo.png">
</div>

**FlagsKit** is a swift package that contains more than 200 country flag `png` images. All the images are in low resulution (most of them are 250 x 125) what makes them together have a weight that less than 750 KB. Package provides a very simple way of getting a `SwiftUI` view with the flag you need. You can use it when you need a small image of the flag like in example below.

<div align="left">
  <img width="100" src="https://raw.githubusercontent.com/pichukov/PublicAssets/master/FlagsKit/FlagCurrencyExample.png">
</div>

It also has mechanisms of converting Phone Code or Currency Code to Country code and getting Emoji flags based on Country, Phone or Currency code.

## Installation

It's a Swift Package, so you need to do the following:

- Open `File` in Xcode menu
- Open `Swift Packages`
- Choose `Add Package Dependency...` option
- In the `Enter package repository URL` field paste this URL: `https://github.com/pichukov/FlagsKit`
- Choose any existing version or take it from `main` branch

## Usage

Add `import FlagsKit` to your swift file.

### Country, Currency, Phone codes

By using `Country` enum you will be able to get a country code or Emoji flag of the country from Currency or Phone code.
The following code example will print you `CZ` country code

```swift
let countryCode = Country.countryCode(fromPhoneCode: "+420")
print(countryCode)
```

If you need to get a country code from Currency code, you can do it like this:

```swift
let countryCode = Country.countryCode(fromCurrencyCode: "USD")
print(countryCode)
```

In that case `US` will be prented

### Emoji flags

To get an Emoji flag you can use one of the followint methods:

```swift
Country.flagEmoji(forCountryCode: "US")     // -> 🇺🇸
Country.flagEmoji(forCurrencyCode: "USD")   // -> 🇺🇸
Country.flagEmoji(forPhoneCode: "+420")     // -> 🇨🇿
```

### FlagView

If you need a `SwiftUI` view with country flag, use the following code:

```swift
FlagView(countryCode: "US")
```

If you need a circle flag or the one with rounded corners, use `style` parameter:

```swift
 FlagView(countryCode: "ro", style: .circle)
    .frame(width: 50, height: 50)
```

In this example you will have a circle 50 by 50 flag.
