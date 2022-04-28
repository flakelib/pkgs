{ pkgs, lib, ... }: with lib; let
  nix = name: command: pkgs.ci.command {
    inherit name;
    resolverPath = toString ./resolver;
    libPath = toString ./lib;
    command = "nix ${command}";
    impure = true;
    meta.broken = name == "base16-check";
  };
  flake-check = name: path: nix "${name}-check" "flake check ./${path}";
  flakeNames = importJSON ./flakes.json;
in {
  name = "flakes.nix";
  ci.version = "nix2.4-broken";
  ci.gh-actions.enable = true;
  cache.cachix.arc = {
    enable = true;
    publicKey = "arc.cachix.org-1:DZmhclLkB6UO0rc0rBzNpwFbbaeLfyn+fYccuAy7YVY=";
  };

  channels.nixpkgs = "21.11";
  tasks = {
    flakes = {
      preBuild = ''
        if [[ $CI_PLATFORM = gh-actions ]]; then
          nix registry add github:NixOS/nixpkgs path:${toString pkgs.path}
        fi
      '';
      inputs = map (flake: flake-check flake "./${flake}") flakeNames ++ [
        (nix "base16-build" "build ./base16#base16-schemes")
      ];
    };
  };
}
