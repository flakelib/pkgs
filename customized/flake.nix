{
  description = "arc's overridden packages";
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
    arcpkgs-weechat = {
      url = "../weechat";
      inputs = {
        flakelib.follows = "flakelib";
        nixpkgs.follows = "nixpkgs";
      };
    };
    rxvt-unicode-plugins = {
      url = "../urxvt";
      inputs = {
        flakelib.follows = "flakelib";
        nixpkgs.follows = "nixpkgs";
      };
    };
    arcpkgs = {
      url = "../";
      inputs = {
        flakelib.follows = "flakelib";
        nixpkgs.follows = "nixpkgs";
        arclib.follows = "arclib";
      };
    };
  };
  outputs = { flakelib, ... }@inputs: flakelib {
    inherit inputs;
    packages = import ./packages;
  };
}
