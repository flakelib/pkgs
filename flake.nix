{
  description = "nixexprs";
  inputs = {
    flakelib.url = "github:flakelib/fl";
    nixpkgs.url = "github:NixOS/nixpkgs";
    arclib = {
      url = "./lib";
      inputs = {
        flakelib.follows = "flakelib";
        nixpkgs.follows = "nixpkgs";
      };
    };
    rust = {
      url = "github:arcnmx/nixexprs-rust";
      flake = false;
    };
  };
  outputs = { flakelib, ... }@inputs: flakelib {
    inherit inputs;
    systems = flakelib.lib.System.Supported.tier2 ++ [
      {
        name = "mingwW64-linux64";
        localSystem = "x86_64-linux";
        crossSystem = inputs.nixpkgs.lib.systems.elaborate inputs.nixpkgs.lib.systems.examples.mingwW64;
      }
    ];

    builders = import ./builders;
    packages = import ./packages;
    devShells = import ./ci/shells.nix;
  };
}
