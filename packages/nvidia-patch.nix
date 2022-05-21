let f = { stdenvNoCC
, fetchFromGitHub
, lib
, lndir
, nvidia_x11
}: stdenvNoCC.mkDerivation {
  pname = "nvidia-patch";
  version = "2022-04-30";

  src = fetchFromGitHub {
    # mirror: git clone https://ipfs.io/ipns/Qmed4r8yrBP162WK1ybd1DJWhLUi4t6mGuBoB9fLtjxR7u
    owner = "keylase";
    repo = "nvidia-patch";
    rev = "12dae07fda04e4a67e2273e9d5239a5449a1dec2";
    sha256 = "1f0mjgvlijrdjlzl03r3y1a4qsd44hn9fymm5ic6ywjwkm5dpxh2";
  };

  nativeBuildInputs = [ lndir ];
  patchedLibs = [
    "libnvidia-encode${stdenvNoCC.hostPlatform.extensions.sharedLibrary}"
    "libnvidia-fbc${stdenvNoCC.hostPlatform.extensions.sharedLibrary}"
  ];

  inherit nvidia_x11;
  nvidia_x11_bin = nvidia_x11.bin;
  nvidia_x11_lib32 = nvidia_x11.lib32; # XXX: no patches for 32bit?
  nvidiaVersion = nvidia_x11.version;

  outputs = [ "out" "bin" "lib32" ];

  passAsFile = [ "nvpatch" ];

  buildPhase = ''
    runHook preBuild

    bash $nvpatchPath patch.sh $nvidia_x11/lib || nvenc=$?
    bash $nvpatchPath patch-fbc.sh $nvidia_x11/lib || nvfbc=$?
    if [[ -n $nvenc && -n $nvfbc ]]; then
      exit 1
    fi

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    for f in $patchedLibs; do
      if [[ -e $f.$nvidiaVersion ]]; then
        install -Dm0755 -t $out/lib $f.$nvidiaVersion
      else
        echo WARN: $f not patched >&2
      fi
    done

    install -d $out $bin $lib32
    lndir -silent $nvidia_x11 $out

    ln -s $nvidia_x11_bin/* $bin/
    ln -s $nvidia_x11_lib32/* $lib32/

    runHook postInstall
  '';

  nvpatch = ''
    set -eu
    patchScript=$1
    objdir=$2

    set -- -sl
    source $patchScript

    patch="''${patch_list[$nvidiaVersion]-}"
    object="''${object_list[$nvidiaVersion]-}"

    if [[ -z $patch || -z $object ]]; then
      echo "$nvidiaVersion not supported for $patchScript" >&2
      exit 1
    fi

    sed -e "$patch" $objdir/$object.$nvidiaVersion > $object.$nvidiaVersion
  '';

  meta = with lib.licenses; {
    license = unfree;
  };
  passthru = {
    ci.cache.wrap = true;
    inherit (nvidia_x11) useProfiles persistenced settings bin lib32;
  };
}; in {
  __functor = _: f;

  fl'config.args = {
    lndir = {
      offset = "build";
      path = [ "xorg" "lndir" ];
    };
    nvidia_x11.path = [ "linuxPackages" "nvidia_x11" ];
  };
}
