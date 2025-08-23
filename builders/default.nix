{
  __functor = _: { callPackageSet, callPackage, nixpkgs }: {
    nodeEnv = callPackage (nixpkgs.outPath + "/pkgs/development/node-packages/node-env.nix") { };
  } // callPackageSet (
    import ./curl.nix
    // import ./fetchurl.nix
    // import ./shell.nix
    // import ./wrap.nix
    // import ./yggdrasil.nix
  ) { };
  fl'config.args.nixpkgs.components = [ "inputs" "nixpkgs" ];
}
