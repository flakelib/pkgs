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
    arcpkgs-linux = {
      url = "./linux";
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
    builders = import ./builders;
    packages = import ./packages;
    devShells = import ./ci/shells.nix;
    devShell = { inputs, buildConfig }: inputs.self.devShells.${buildConfig.localSystem.system}.maintenance;
  };
}
