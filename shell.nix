{}:
let
  rust-overlay = (import (builtins.fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz"));
  pkgs = (import <nixpkgs> {
    overlays = [ rust-overlay ];
  });
in
pkgs.mkShell {
  buildInputs = [
    (pkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml
    # {
    #   extensions = ["rust-src"];
    # }
    )

    pkgs.cargo-insta
    # keep this line if you use bash
    pkgs.bashInteractive
  ];
}
