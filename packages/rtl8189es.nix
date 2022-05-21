{ stdenv, lib, fetchFromGitHub, linux }: stdenv.mkDerivation rec {
  version = "2021-10-01";
  pname = lib.moduleName {
    inherit linux;
    pname = "rtl8189es";
  };

  src = fetchFromGitHub {
    owner = "jwrdegoede";
    repo = "rtl8189ES_linux";
    rev = "be378f47055da1bae42ff6ec1d62f1a5052ef097";
    sha256 = "1szayxl5chvmylcla13s9dnfwd0g2k6zmn5bp7m1in5igganlpzv";
  };
  sourceRoot = "source";

  kernelVersion = linux.modDirVersion;
  modules = [ "8189es" ];
  makeFlags = lib.moduleMakeFlags linux ++ [
    "CONFIG_RTL8189ES=m"
  ];
  enableParallelBuilding = true;

  installPhase = ''
    install -Dm644 -t $out/lib/modules/$kernelVersion/kernel/drivers/net/wireless 8189es.ko
  '';

  meta.platforms = lib.platforms.linux;
}
