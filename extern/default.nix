{ lib }: let
  inherit (lib.std) Drv Null;
  inherit (lib.nixlib) options types;
  externModule = { config, pkgs, name, ... }: {
    options = {
      enable = options.mkEnableOption "extern entry" // {
        default = true;
      };
      name = options.mkOption {
        type = types.str;
        default = name;
      };
      value = options.mkOption {
        type = types.unspecified;
      };
    };
  };
  externType = types.submoduleWith {
    modules = [ externModule ];
  };
in {
  inherit externModule externType;

  __functor = self: { config, ... }: {
    options.extern = {
      enable = mkEnableOption "extern imports";
      entries = options.mkOption {
        type = types.attrsOf externType;
        default = { };
      };
    };
    config._module.args = {
      extern = {
        inherit (config.extern) enable;
      } // lib.extern.entryValues config.extern;
    };
  };
}
