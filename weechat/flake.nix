{
  description = "weechat";
  inputs = {
    flakelib.url = "github:flakelib/fl";
    nixpkgs.url = "github:NixOS/nixpkgs";
  };
  outputs = { flakelib, ... }@inputs: flakelib {
    inherit inputs;
    builders = import ./builders.nix;
    packages = import ./packages;
  };
}
