# The Rust book

## Ownership rules
  1. Each value in Rust has a variable that’s called its owner.
  2. There can only be one owner at a time.
  3. When the owner goes out of scope, the value will be dropped.

## Dangling references

```rust
fn main() {
let reference_to_nothing = dangle();
}

fn dangle() -> &String {
  let s = String::from("hello");
  s
}
```
