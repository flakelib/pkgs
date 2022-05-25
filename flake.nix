{
  description = "base16";
  inputs = {
    flakelib = {
      url = "github:flakelib/fl";
      inputs.std.follows = "std";
    };
    nixpkgs.url = "github:NixOS/nixpkgs";
    std.url = "github:flakelib/std";
  };
  outputs = { flakelib, ... }@inputs: flakelib {
    inherit inputs;
    config = {
      name = "base16";
      packages.namespace = [ "base16" ];
      inputs = {
        std.lib.namespace = [ "std" ];
      };
    };
    lib = import ./lib;
    builders = import ./builders.nix;
    packages = import ./packages;
    defaultPackage = "base16-shell-preview";
    legacyPackages = { callPackage }: {
      templates = callPackage ./packages/templates.nix { };
    };
    nixosModules = { callPackageSet }: {
      base16 = callPackageSet ./nixos.nix { };
    };
    nixosModule = "base16";
    outputs.homeModules = {
      value = { callPackageSet }: {
        base16 = callPackageSet ./home.nix { };
      };
      default = "base16";
    };
    outputs.modules.value = { callPackageSet }: {
      base16 = callPackageSet ./module.nix { };
    };
  };
}
