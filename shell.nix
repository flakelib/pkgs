let
  lock = builtins.fromJSON (builtins.readFile ./flake.lock);
  sourceInfo = lock.nodes.std.locked;
  src = fetchTarball {
    url = "https://github.com/${sourceInfo.owner}/${sourceInfo.repo}/archive/${sourceInfo.rev}.tar.gz";
    sha256 = sourceInfo.narHash;
  };
  std = import src;
  flake = std.Flake.LoadDir (toString ./.);
in flake.devShells.${builtins.currentSystem}.default
