{
  description = "linuxPackages";
  inputs = {
    flakelib.url = "github:flakelib/fl";
    nixpkgs.url = "github:NixOS/nixpkgs";
  };
  outputs = { flakelib, ... }@inputs: flakelib {
    inherit inputs;
    packages = import ./packages;
    legacyPackages = {
      kernelPatches = { lib, callPackage }: with lib;
        mapAttrs (_: flip callPackage { }) (import ./patches.nix);
    };
  };
}
