fn main() {
    let a = 1;
    println!("{}", greet());
    // place holder for didChange test.
}


fn greet() -> i32 {
    42
}

// place holder for didChange test.

mod libs;
use libs::yo;
fn ref_in_main() -> i32 {
    yo() + 1
}
