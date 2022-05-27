{ lib, outputs }: let
  self = outputs.homeModules;
in {
  default = { ... }: {
    imports = with self; [
      self.lib
      display
    ];
  };

  lib = { ... }: { config.lib.meta = outputs.lib; };
  display = { ... }: { imports = [ ../display/home.nix ]; };

  # TODO: steal some modules from tf-nix
}
