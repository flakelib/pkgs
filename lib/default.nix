{ pkgs ? import <nixpkgs> { } }: let
  lib = pkgs.lib // import ./lib {
    nixpkgs = pkgs;
    inherit lib;
  };
in lib
