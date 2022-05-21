{ lib }: {
  moduleMakeFlags = linux: [
    "-C" "${linux.dev}/lib/modules/${linux.modDirVersion}/build" "modules"
    "CROSS_COMPILE=${linux.stdenv.cc.targetPrefix or ""}"
    "M=$(NIX_BUILD_TOP)/$(sourceRoot)"
    "VERSION=$(version)"
  ] ++ (if linux.stdenv.hostPlatform ? linuxArch then [
    "ARCH=${linux.stdenv.hostPlatform.linuxArch}"
  ] else [ ]);

  moduleName = { pname, linux }: let
    kernel-name = builtins.tryEval "${pname}-${linux.version}";
  in if kernel-name.success then kernel-name.value else pname;

  bleedingPackages = pkgs: with lib; let
    nonNullPackages = filter (p: p != null) [
      pkgs.linuxPackages_latest
      pkgs.linuxPackages_5_18 or null
      pkgs.linuxPackages_5_17 or null
      pkgs.linuxPackages_5_10 or null
      pkgs.linuxPackages_5_4 or null
      pkgs.linuxPackages_testing or null
    ];
    stripVersion = ver: head (splitString "-rc" ver);
    compareVersions = l: r: versionOlder (stripVersion r.kernel.version) (stripVersion l.kernel.version);
    sortedPackages = sort compareVersions nonNullPackages;
    linuxPackages = head sortedPackages;
  in linuxPackages;
}
