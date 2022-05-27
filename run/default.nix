{ lib }@args: let
  inherit (lib.std) Drv Null;
  inherit (lib.nixlib) options types;
  runModule = { config, pkgs, name, ... }: with lib; {
    options = {
      name = mkOption {
        type = types.str;
        default = name;
      };
      executable = mkOption {
        type = types.str;
        default = Null.match config.package {
          just = Drv.mainProgramName;
          nothing = name;
        };
      };
      command = options.mkOption {
        type = with types; nullOr lines;
        default = null;
      };
      package = options.mkOption {
        type = types.nullOr types.package;
        # TODO: std as an alternative to pkgs?
        default = Null.map (pkgs.writeShellScriptBin config.name) config.command;
      };
    };
  };
  runType = types.submoduleWith {
    modules = [ runModule ];
  };
in {
  inherit runModule runType;

  __functor = self: { ... }: {
    options.run = options.mkOption {
      type = types.attrsOf runType;
      default = { };
    };
  };
}
