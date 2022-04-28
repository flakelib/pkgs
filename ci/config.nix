{ pkgs, lib, ... }: with lib; let
  nix = name: command: pkgs.ci.command {
    inherit name;
    resolverPath = toString ./resolver;
    libPath = toString ./lib;
    pkgs = toString pkgs.path;
    command = ''
      if [[ $CI_PLATFORM = gh-actions ]]; then
        nix registry add github:NixOS/nixpkgs path:$pkgs
      fi
      nix ${command}
    '';
    impure = true;
    environment = [ "CI_PLATFORM" ];
    meta.broken = name == "base16";
  };
  flake-check = name: path: nix "${name}-check" "flake check ./${path}";
in {
  name = "flakes.nix";
  ci.version = "nix2.4-broken";
  ci.gh-actions.enable = true;
  cache.cachix.arc.enable = true;
  channels.nixpkgs = "21.11";
  tasks.flakes.inputs = map (flake: flake-check "${flake}" "./${flake}") (importJSON ./flakes.json) ++ [
    (nix "base16-build" "build ./base16#base16-schemes")
  ];
}
