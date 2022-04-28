{
  description = "weechat";
  inputs = {
    flakelib.url = "github:flakelib/fl";
    nixpkgs.url = "github:NixOS/nixpkgs";
  };
  outputs = { self, flakelib, ... }@inputs: flakelib {
    inherit inputs;
    builders = import ./builders.nix;
    packages = import ./packages;
    config = {
      name = "weechatScripts";
      packages.namespace = self.flakes.config.name;
    };
  };
}
