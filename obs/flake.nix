{
  description = "obs-studio-plugins";
  inputs = {
    flakelib.url = "github:flakelib/fl";
    nixpkgs.url = "github:NixOS/nixpkgs";
    arcpkgs = {
      url = "../";
      inputs = {
        flakelib.follows = "flakelib";
        nixpkgs.follows = "nixpkgs";
      };
    };
  };
  outputs = { flakelib, ... }@inputs: flakelib {
    inherit inputs;
    packages = import ./packages;
  };
}
