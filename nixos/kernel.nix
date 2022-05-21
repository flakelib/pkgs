{ lib }: let
  inherit (lib) bleedingPackages;
in { pkgs, config, lib, ... }: with lib; let
  inherit (pkgs) hostPlatform;
  inherit (config.boot.kernelPackages) kernel;
  cfg = config.boot.kernel;
  more_uarches = pkgs.kernelPatches.more_uarches or (pkgs.callPackage (import ../patches.nix).more_uarches { });
  isGcc11 = kernel.stdenv.cc.isGNU && versionAtLeast kernel.stdenv.cc.version "11.1";
  defaultArch = if hostPlatform.isx86_64 && isGcc11 then "x86-64-v2" else null;
in {
  options.boot.kernel = {
    customBuild = mkOption {
      type = types.bool;
      default = false;
    };
    bleedingEdge = mkOption {
      type = types.bool;
      default = false;
    };
    arch = mkOption {
      type = with types; nullOr str;
      default = hostPlatform.linux-kernel.arch or hostPlatform.gcc.arch or defaultArch;
    };
    extraPatches = mkOption {
      type = with types; listOf attrs;
      default = [ ];
    };
  };

  config.boot = {
    kernel = {
      extraPatches = mkIf (hostPlatform.isx86 && cfg.arch != null) [ (more_uarches.override {
        linux = config.boot.kernelPackages.kernel;
        gccArch = cfg.arch;
      }) ];
    };
    kernelPackages = mkIf cfg.bleedingEdge (bleedingPackages pkgs);
    kernelPatches = mkIf cfg.customBuild cfg.extraPatches;
  };
}
