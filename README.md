# GrammaticalNumber

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

### Add count to words

Prepends the given `String` with `count`.
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
