{ stdenv
, fetchpatch
, looking-glass-client, looking-glass-host
, lib
, libbfd
, obs-studio, libGLU
, cmake, pkg-config
, enableThreading ? false
, optimizeForArch ? null
}: stdenv.mkDerivation {
  pname = "looking-glass-obs";
  inherit (looking-glass-host) src version;
  inherit (looking-glass-client) meta;

  NIX_CFLAGS_COMPILE = looking-glass-client.NIX_CFLAGS_COMPILE or "-mavx"; # TODO fix?

  patches = [
    (fetchpatch {
      url = "https://github.com/arcnmx/LookingGlass/commit/f654f19606219157afe03ab5c5b965a28d3169ef.patch";
      sha256 = "0g532b0ckvb3rcahsmmlq3fji6zapihqzd2ch0msj0ygjzcgkabw";
    })
    ./obs-installdir.patch
  ];

  nativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [ libbfd obs-studio libGLU ];

  cmakeFlags = [
    "-DOPTIMIZE_FOR_NATIVE=${if optimizeForArch == null then "OFF" else optimizeForArch}"
    "-DENABLE_THREADS=${if enableThreading then "ON" else "OFF"}"
    "../obs"
  ];

  hardeningDisable = [ "all" ];
}
