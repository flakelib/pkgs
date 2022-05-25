{
  description = "base16";
  inputs = {
    flakelib.url = "github:flakelib/fl";
    nixpkgs.url = "github:NixOS/nixpkgs";
  };
  outputs = { flakelib, ... }@inputs: flakelib {
    inherit inputs;
    config = {
      name = "base16";
    };
    lib = import ./lib;
    builders = import ./builders.nix;
    packages = import ./packages;
    legacyPackages = {
      base16-templates = import ./packages/templates.nix;
    };
    nixosModules.base16 = import ./nixos.nix;
    nixosModule = "base16";
    outputs.homeModules = {
      value.base16 = import ./home.nix;
      default = "base16";
    };
    outputs.modules.value.base16 = import ./module.nix;
  };
}
