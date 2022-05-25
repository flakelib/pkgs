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
    nixosModules = import ./nixos.nix;
    outputs.homeModules.value = import ./home.nix;
    outputs.modules.value.base16 = import ./module.nix;
    legacyPackages = {
      base16-templates = import ./packages/templates.nix;
    };
  };
}
