{
  description = "zsh-plugins";
  inputs = {
    flakelib.url = "github:flakelib/fl";
    nixpkgs.url = "github:NixOS/nixpkgs";
    arclib = {
      url = "../lib";
      inputs = {
        flakelib.follows = "flakelib";
        nixpkgs.follows = "nixpkgs";
      };
    };
  };
  outputs = { flakelib, ... }@inputs: flakelib {
    inherit inputs;
    builders = import ./builders.nix;
    packages = import ./packages;
  };
}
