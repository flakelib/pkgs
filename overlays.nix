{ outputs, lib }: let
in {
  default = final: prev: {
    linuxPackagesOverlays = prev.linuxPackagesOverlays or [ ] ++ [
      outputs.overlays.linuxPackages
    ];
  };

  # used by appending to `pkgs.linuxPackagesOverlays`
  zfsVersionOverride = final: prev: {
    zfs = prev.zfs.overrideAttrs (old: {
      meta = old.meta // {
        broken = false;
      };
    });
    zfsUnstable = prev.zfsUnstable.overrideAttrs (old: {
      meta = old.meta // {
        broken = false;
      };
    });
  };

  linuxPackages = final: prev: let
    callPackage = p: final.callPackage {
      linux = final.kernel;
      inherit lib;
    };
  in {
    forcefully-remove-bootfb = callPackage ./packages/bootfb.nix;
    ryzen-smu = callPackage ./ryzen-smu.nix;
    rtl8189es = callPackage ./rtl8189es.nix;
    nvidia-patch = callPackage ./nvidia-patch.nix;
  };
}
