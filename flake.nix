{
  description = "nix deployment modules";
  inputs = {
    flakelib.url = "github:flakelib/fl";
    nixpkgs.url = "github:arcnmx/nixpkgs-lib";
    std.url = "github:flakelib/std";
  };
  outputs = { flakelib, ... }@inputs: flakelib {
    inherit inputs;
    config = {
      name = "meta";
      inputs = {
        nixpkgs = {
          type = flakelib.lib.Fl.Type.Lib;
          lib.namespace = [ "nixlib" ];
        };
        std.lib.namespace = [ ];
      };
    };
    outputs.modules.value = { callPackageSet }: callPackageSet ./modules.nix { };
    outputs.homeModules.value = { outputs }: outputs.modules.home;
    nixosModules = { outputs }: outputs.modules.nixos;
    lib = ./lib;
  };
}
