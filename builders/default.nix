{
  __functor = _: { callPackageSet, callPackage, nixpkgs }: {
    nodeEnv = callPackage (nixpkgs.outPath + "/pkgs/development/node-packages/node-env.nix") { };
  } // callPackageSet (import ./yggdrasil.nix // import ./rust) { };
  fl'config.args.nixpkgs.components = [ "inputs" "nixpkgs" ];
}
