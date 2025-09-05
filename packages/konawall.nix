{ fetchFromGitHub, rustPlatform, lib, pkg-config, openssl, xorg'libX11, xorg'libXrandr }: rustPlatform.buildRustPackage rec {
  pname = "konawall-rs";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "kittywitch";
    repo = pname;
    rev = "aeb6688100c918f261c8b561867866e6825e2a39";
    sha256 = "0srw4cy8livxqjdswdi10q79gak5jqc0mhfy9j5f8sy21w701jr0";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ openssl xorg'libX11 xorg'libXrandr ];

  meta = with lib; {
    platforms = platforms.linux;
  };

  cargoHash =
    if lib.versionOlder lib.version "25.05" then "sha256-zkVcKsh+LSHusu+pvBIqMn4YXdzQgMQtVDSMbs+Tlgw="
    else "sha256-whtZk+q+rC46rqqbaFaTCkyoMyfyQjyHa0EjYBNvHhM=";
}
