{ config, lib, pkgs, ... }: with lib; let
  cfg = config.hardware.alsa;
  inherit (config.lib.meta.alsa) alsaConf alsaDirectiveType;
  mappingType = { config, name, ... }: {
    device-strings = mkOption {
      type = types.str;
      default = "${name}:%f";
    };
    exact-channels = mkOption {
      type = types.bool;
      default = false;
    };
    channel-map = mkOption {
      type = with types; listOf str;
      default = [ ];
    };
    description = mkOption {
      type = types.str;
      default = name;
    };
    paths-input = mkOption {
      type = with types; listOf str;
      default = [ ];
    };
    paths-output = mkOption {
      type = with types; listOf str;
      default = [ ];
    };
    direction = mkOption {
      type = types.enum [ null "input" "output" ];
      default = null;
    };
  };
  profileType = { config, name, ... }: {
    description = mkOption {
      type = types.str;
      default = name;
    };
  };
  pathType = { config, name, ... }: {
  };
in {
  options.hardware.alsa = {
    enable = mkEnableOption "alsa" // {
      default = config.sound.enable;
    };
    mappings = mkOption {
      type = with types; attrsOf (submodule mappingType);
      default = { };
    };
    profiles = mkOption {
      type = with types; attrsOf (submodule profileType);
      default = { };
    };
    paths = mkOption {
      type = with types; attrsOf (submodule pathType);
      default = { };
    };
    config = mkOption {
      type = types.attrsOf alsaDirectiveType;
      default = { };
    };
    extraConfig = mkOption {
      type = types.lines;
      default = "";
    };
  };
  config = {
    environment = mkIf cfg.enable {
      systemPackages = singleton pkgs.alsaUtils;
      etc = {
        "alsa/conf.d/99-config.conf" = mkIf (cfg.config != { }) {
          text = alsaConf cfg.config;
        };
        "alsa/conf.d/99-extra.conf" = mkIf (cfg.extraConfig != "") {
          text = cfg.extraConfig;
        };
      };
    };
  };
}
