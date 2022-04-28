{
  kak-crosshairs = { fetchFromGitHub, buildKakPlugin }: buildKakPlugin rec {
    pname = "kak-crosshairs";
    version = "e191f6a4905ba29b1af76d96e4cf38127f93eebb";
    src = fetchFromGitHub {
      owner = "insipx";
      repo = pname;
      rev = version;
      sha256 = "14akcga20qb1dyr547xk4rpncc0724vd0krr7q19rp3g4cb0fn5p";
    };
  };
  explore-kak = { fetchFromGitHub, buildKakPlugin }: buildKakPlugin rec {
    pname = "explore.kak";
    version = "d6f5d68d009c19fd99fc22b3c7c8914b262db2d0";
    src = fetchFromGitHub {
      owner = "alexherbo2";
      repo = pname;
      rev = version;
      sha256 = "10gkjhwv2nvhh2ci89z51daskiaz0nvy25v1nwpzvhqm14d8jd81";
    };
  };
  kak-tree = { fetchFromGitHub, rustPlatform, buildKakPluginFrom2Nix, lib, darwin, hostPlatform }: buildKakPluginFrom2Nix rec {
    mkDerivation = rustPlatform.buildRustPackage;
    kakInstall = false;

    kakrc = "share/kak/autoload/tree.kak";
    pname = "kak-tree";
    version = "2020-04-21";
    src = fetchFromGitHub {
      owner = "ul";
      repo = pname;
      rev = "8c0b6b4a3d5750732817aa8c9e633699cb5c2367";
      sha256 = "1xd5qa8im0rjplp23v2fymh80kp1z25r7fd1v65s5wndxd49c0cs";
      fetchSubmodules = true;
    };

    buildInputs = lib.optional hostPlatform.isDarwin darwin.apple_sdk.frameworks.Security;

    cargoSha256 = "0q1kr27aq0lbkrsgi9gg5m3lq5352424a5k90dmbmbvhcj69kghr";

    preBuild = ''
      sed -e "s,\"kak-tree\",\"$out/bin/kak-tree\"," -i rc/tree.kak
    '';

    postInstall = ''
      install -Dm0644 rc/tree.kak $out/$kakrc
    '';

    passthru.ci.skip = hostPlatform.isDarwin;
  };
}
