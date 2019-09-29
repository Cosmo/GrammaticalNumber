# GrammaticalNumber

Turning singular words to plural can be [very hard](https://en.wikipedia.org/wiki/English_plurals) in some spoken languages, while other languages have [simple rules](https://en.wikipedia.org/wiki/Turkish_grammar#Inflectional_suffixes).

`GrammaticalNumber` is heavily inspired by [`ActiveSupport::Inflector`](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/inflections.rb) known from the [Ruby on Rails](https://rubyonrails.org) web framework.


## Usage

### Turn singular words to plural

```swift
"person".pluralized()               // people
"center".pluralized()               // centers
"sheep".pluralized()                // sheep
"knife".pluralized()                // knives
"mouse".pluralized()                // mice
"money".pluralized()                // money
"axis".pluralized()                 // axes
"item".pluralized()                 // items
"status".pluralized()               // statuses
"fox".pluralized()                  // foxes
"move".pluralized()                 // moves
"tooth".pluralized()                // teeth
"foxes".pluralized()                // foxes
"millennium".pluralized()           // millennia
"child".pluralized()                // children
"matrix".pluralized()               // matrices
"man".pluralized()                  // men
"ox".pluralized()                   // oxen
"radius".pluralized()               // radii
"grandchild".pluralized()           // grandchildren
```

### Turn plural words to singular

```swift
"children".singularized()           // child
"tables".singularized()             // table
"computers".singularized()          // computer
"mice".singularized()               // mouse
"teeth".singularized()              // tooth
"axes".singularized()               // axis
"women".singularized()              // woman
"grandchildren".singularized()      // grandchild
```

### Case Sensitivity

`GrammaticalNumber` will try to match the letter casing of your input word.
Lowercased, uppercased and capitalized words are supported.

```swift
"tooth".pluralized()                // teeth
"TOOTH".pluralized()                // TOOTH
"Tooth".pluralized()                // Teeth
```

### Add count to words

Prepends the pluralized `String` with `count`.
If the `count` is `0`, the singular word will be used. 

```swift
"child".pluralized(count: 0)        // 0 children
"child".pluralized(count: 1)        // 1 child
"child".pluralized(count: 3)        // 3 children

"knife".pluralized(count: 0)        // 0 knives
"knife".pluralized(count: 1)        // 1 knife
"knife".pluralized(count: 3)        // 3 knives

"sheep".pluralized(count: 0)        // 0 sheep
"sheep".pluralized(count: 1)        // 1 sheep
"sheep".pluralized(count: 3)        // 3 sheep
```

## Define Custom Rules

### Uncountable Rule

```swift
let rule: GrammaticalNumberRule = .uncountable("money")
```

`money` will never change.

### Irregular Rule: Singular from plural

```swift
let rule: GrammaticalNumberRule = .irregular("tooth", "teeth")
```

Turns `tooth` to `teeth` when used with `pluralized()`.
Turns `teeth` to `tooth` when used with `singularized()`.

### Plural Rule: Plural from singular with regular expression

```swift
let rule: GrammaticalNumberRule = .plural(#"^(m|l)ouse$"#, #"$1ice"#)
```

`mouse` becomes `mice` and `louse` becomes `lice`.

### Singular Rule: Singular from plural with regular expression

```swift
let rule: GrammaticalNumberRule = .singular(#"(matr)ices$"#, #"$1ix"#)
```

Turns `matrices` to `matrix`.

### Apply rule, so it becomes available

```swift
GrammaticalNumberRule.add(rule)
```

## Support other languages

In order to support other languages, pass the `language` parameter to your custom rules.
Call `.pluralized(language: yourLanguage)` with the same `language` value — like so: `.pluralized(language: "tr")`

### Example for the turkish language (`tr`)

```swift
GrammaticalNumberRule.add(.plural(#"([aoıu][^aoıueöiü]{0,6})$"#, #"$1lar"#), language: "tr")
GrammaticalNumberRule.add(.plural(#"([eöiü][^aoıueöiü]{0,6})$"#, #"$1ler"#), language: "tr")
GrammaticalNumberRule.add(.singular(#"l[ae]r$"#, #""#), language: "tr")
```

```swift
"kitap".pluralized(language: "tr")              // kitaplar
"yemek".pluralized(language: "tr")              // yemekler
```

## Contact

* Devran "Cosmo" Uenal
* Twitter: [@maccosmo](http://twitter.com/maccosmo)
* LinkedIn: [devranuenal](https://www.linkedin.com/in/devranuenal)

## Other Projects

* [BinaryKit](https://github.com/Cosmo/BinaryKit) — BinaryKit helps you to break down binary data into bits and bytes and easily access specific parts.
* [Clippy](https://github.com/Cosmo/Clippy) — Clippy from Microsoft Office is back and runs on macOS! Written in Swift.
* [HackMan](https://github.com/Cosmo/HackMan) — Stop writing boilerplate code yourself. Let hackman do it for you via the command line.
* [ISO8859](https://github.com/Cosmo/ISO8859) — Convert ISO8859 1-16 Encoded Text to String in Swift. Supports iOS, tvOS, watchOS and macOS.
* [SpriteMap](https://github.com/Cosmo/SpriteMap) — SpriteMap helps you to extract sprites out of a sprite map. Written in Swift.
* [StringCase](https://github.com/Cosmo/StringCase) — Converts String to lowerCamelCase, UpperCamelCase and snake_case. Tested and written in Swift.
* [TinyConsole](https://github.com/Cosmo/TinyConsole) — TinyConsole is a micro-console that can help you log and display information inside an iOS application, where having a connection to a development computer is not possible.

## License

GrammaticalNumber is released under the [MIT License](http://www.opensource.org/licenses/MIT).
