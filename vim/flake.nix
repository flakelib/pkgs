{
  description = "vimPlugins";
  inputs = {
    flakelib.url = "github:flakelib/fl";
    nixpkgs.url = "github:NixOS/nixpkgs";
  };
  outputs = { flakelib, ... }@inputs: flakelib {
    inherit inputs;
    builders = import ./builders;
    packages = import ./packages.nix;
  };
}
