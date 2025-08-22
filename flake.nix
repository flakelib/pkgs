{
  description = "arclib";
  inputs = {
    flakelib.url = "github:flakelib/fl";
    nixpkgs.url = "github:arcnmx/nixpkgs-lib";
    #nixpkgs.url = "github:NixOS/nixpkgs";
  };
  outputs = { flakelib, ... }@inputs: flakelib {
    inherit inputs;
    config = {
      name = "arclib";
      lib.namespace = [ ];
    };
    lib = import ./lib;
  };
}
