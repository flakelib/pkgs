{ lib, looking-glass-client, looking-glass-host, fetchFromGitHub, xorg'libXinerama }: looking-glass-client.overrideAttrs (old: {
  inherit (looking-glass-host) version src;

  buildInputs = old.buildInputs ++ [
    xorg'libXinerama
  ];

  patches = [ ];
})
