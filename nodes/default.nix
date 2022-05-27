{ lib, inputs }@args: let
  inherit (lib.nixlib) options types;
  nixosType = {
    modules ? [ ]
  , specialArgs ? { }
  , extraModules ? [ ]
  , baseModules ? self.baseModules { inherit modulesPath; }
  , modulesPath ? self.modulesPath { inherit (inputs) nixpkgs; }
  }: let
    nixosModule = { ... }: rec {
      _file = ./default.nix;
      key = _file;
      config = {
        _module.args = {
          inherit baseModules extraModules modules;
          # TODO: inherit noUserModules;
        };
      };
    };
  in types.submoduleWith {
    modules = baseModules ++ [ nixosModule ] ++ extraModules ++ modules;
    specialArgs = {
      inherit baseModules modulesPath;
    } // specialArgs;
  };
  self = {
    nixosType = nixosType { } // {
      __functor = _: nixosType;
    };

    baseModules = { modulesPath ? self.modulesPath { } }: import (modulesPath + "/module-list.nix");
    modulesPath = { nixpkgs ? inputs.nixpkgs }: toString (nixpkgs + "/nixos/modules");
  };
  module = self: { config, ... }: {
    _file = ./default.nix;
    options = {
      nixos = {
        extraModules = options.mkOption {
          type = with types; listOf unspecified;
          default = [ ];
        };
        specialArgs = options.mkOption {
          type = with types; attrsOf unspecified;
          default = { };
        };
        modulesPath = options.mkOption {
          type = types.path;
          default = self.modulesPath { };
        };
        baseModules = options.mkOption {
          type = with types; listOf unspecified;
          default = self.baseModules { inherit (config.nixos) modulesPath; };
        };
      };
      nodes = options.mkOption {
        type = types.attrsOf (self.nixosType {
          inherit (config.nixos) extraModules specialArgs modulesPath baseModules;
        });
        default = { };
      };
    };
  };
in self // {
  __functor = module;
}
