{
  description = "kakounePlugins";
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
  outputs = { self, flakelib, ... }@inputs: flakelib {
    inherit inputs;
    config = {
      name = "kakounePlugins";
      packages.namespace = self.flakes.config.name;
    };
    builders = import ./builders.nix;
    packages = import ./packages.nix;
  };
}
