{ stdenv, lib, fetchFromGitHub, linux, kmod, gnugrep, coreutils, makeWrapper }: stdenv.mkDerivation rec {
  version = "2018-02-08";
  pname = lib.moduleName {
    inherit linux;
    pname = "forcefully-remove-bootfb";
  };

  src = fetchFromGitHub {
    owner = "arcnmx";
    repo = "arch-forcefully-remove-bootfb-dkms";
    rev = "2793a4b";
    sha256 = "1npbns5x2lssjxkqvj97bgi263l7zx6c9ij5r9ksbcdfpws5mmy5";
  };
  sourceRoot = "source";

  nativeBuildInputs = [ makeWrapper ];
  shellPath = lib.makeBinPath [ kmod gnugrep coreutils ];

  kernelVersion = linux.modDirVersion;
  modules = [ "forcefully_remove_bootfb" ];
  makeFlags = lib.moduleMakeFlags linux;
  enableParallelBuilding = true;

  outputs = [ "bin" "out" ];

  installPhase = ''
    install -Dm644 -t $out/lib/modules/$kernelVersion/kernel/drivers/video/fbdev/ forcefully_remove_bootfb.ko
    install -Dm755 forcefully_remove_bootfb.sh $bin/bin/forcefully-remove-bootfb
    wrapProgram $bin/bin/forcefully-remove-bootfb --prefix PATH : $shellPath
  '';

  dontStrip = true;
  meta.platforms = lib.platforms.linux;
}
