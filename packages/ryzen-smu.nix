{ stdenv, lib, fetchFromGitLab, linux }: stdenv.mkDerivation rec {
  version = "2021-04-21";
  pname = lib.moduleName {
    inherit linux;
    pname = "ryzen-smu";
  };

  src = fetchFromGitLab {
    owner = "leogx9r";
    repo = "ryzen_smu";
    #rev = "v${version}";
    rev = "847caf27a1e05bfcb546e4456572ed2bc4ffd262";
    sha256 = "1xcrdwdkk7ijhiqix5rmz59cfps7p0x7gwflhqdcjm6np0ja3acv";
  };
  sourceRoot = "source";

  kernelVersion = linux.modDirVersion;
  modules = [ "ryzen-smu" ];
  makeFlags = lib.moduleMakeFlags linux;
  enableParallelBuilding = true;

  installPhase = ''
    install -Dm644 -t $out/lib/modules/$kernelVersion/kernel/drivers/ ryzen_smu.ko
  '';

  meta.platforms = lib.platforms.linux;
}
