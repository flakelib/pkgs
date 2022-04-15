{
  nodeEnv = { nixpkgs, callPackage }: callPackage (nixpkgs.path + "/pkgs/development/node-packages/node-env.nix") { };
} // import ./yggdrasil.nix
// import ./rust
