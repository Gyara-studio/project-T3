#[cfg(feature = "gd")]
use gd::init;
#[cfg(feature = "gd")]
use gdnative::godot_init;

mod algorithm;

#[cfg(feature = "gd")]
mod gd {
    use gdnative::prelude::*;
    #[derive(NativeClass)]
    #[inherit(Node)]
    pub struct Solver;

    #[methods]
    impl Solver {
        fn new(_owner: &Node) -> Self {
            Self
        }

        #[export]
        fn solver(&self, _owner: &Node, input: Vec<String>) -> String {
            crate::algorithm::solve(input)
        }

        #[export]
        fn player_name(&self, _owner: &Node) -> String {
            format!("Player {}", std::env!("CARGO_PKG_VERSION"))
        }
    }

    pub(super) fn init(handle: InitHandle) {
        handle.add_class::<Solver>();
    }
}

#[cfg(feature = "gd")]
godot_init!(init);

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
}
