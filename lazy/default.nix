{ lib }@args: let
  inherit (lib.nixlib) options types;
  lazyModule = { config, pkgs, name, ... }: {
    options = {
      nixRun = options.mkOption {
        type = types.listOf types.str;
        default = [ "${pkgs.nix_2_3 or pkgs.nix}/bin/nix" "run" ];
      };
      name = options.mkOption {
        type = types.str;
        default = name;
      };
      executable = options.mkOption {
        type = types.str;
        default = name;
      };
      file = options.mkOption {
        type = types.nullOr types.path;
        default = null;
      };
      attr = options.mkOption {
        type = types.str;
      };
      args = options.mkOption {
        type = types.listOf types.str;
      };
      set = options.mkOption {
        type = types.unspecified;
        readOnly = true;
      };
      out = {
        runArgs = options.mkOption {
          type = types.listOf types.str;
          readOnly = true;
        };
      };
    };
  };
  lazyType = types.submoduleWith {
    modules = [ lazyModule ];
  };
in {
  inherit lazyModule lazyType;

  __functor = self: { ... }: {
    options = {
      file = options.mkOption {
        type = types.nullOr types.path;
        default = null;
      };
      attrPrefix = options.mkOption {
        type = types.str;
        default = "";
      };
      args = options.mkOption {
        type = types.listOf types.str;
        default = [ ];
      };
      /*run = options.mkOption { # TODO
        type = types.attrsOf lazyRunType;
      };*/
      attrs = options.mkOption {
        type = types.attrsOf lazyType;
        default = { };
      };
    };
  };
}
