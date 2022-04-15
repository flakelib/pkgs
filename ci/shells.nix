{
  maintenance = { lib, mkShell, writeShellScriptBin }: with lib; let
    flakes = importJSON ./flakes.json;
    nix-all = writeShellScriptBin "nix-all" ''
      set -u
      ACTION=$1
      shift

      for flake in ${toString flakes}; do
        echo ":: $ACTION $flake" >&2
        nix "$ACTION" "$@" ./$flake
      done
    '';
  in mkShell {
    nativeBuildInputs = [ nix-all ];
  };
}
