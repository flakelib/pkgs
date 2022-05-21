{
  description = "linuxPackages";
  inputs = {
    flakelib.url = "github:flakelib/fl";
    nixpkgs.url = "github:NixOS/nixpkgs";
  };
  outputs = { flakelib, ... }@inputs: flakelib {
    inherit inputs;
    config = {
      name = "pkgs-linux";
      packages.namespace = [ "linuxPackages" ];
      inputs = {
        self = {
          lib.namespace = [ ];
        };
      };
    };
    builders = import ./builders;
    packages = import ./packages;
    lib = import ./lib.nix;
    overlays = import ./overlays.nix;
    nixosModules = import ./nixos;
    legacyPackages = {
      kernelPatches = { lib, callPackage }: with lib;
        mapAttrs (_: flip callPackage { }) (import ./patches.nix);
    };
  };
}
