{
  description = "urxvt plugins";
  inputs = {
    flakelib.url = "github:flakelib/fl";
    nixpkgs.url = "github:NixOS/nixpkgs";
  };
  outputs = { self, flakelib, ... }@inputs: flakelib {
    inherit inputs;
    packages = import ./packages;
    config = {
      name = "rxvt-unicode-plugins";
      packages.namespace = self.flakes.config.name;
    };
  };
}
