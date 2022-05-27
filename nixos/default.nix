{ lib, outputs }: let
  self = outputs.nixosModules;
in {
  default = { ... }: {
    imports = with self; [
      self.lib

      crypttab

      alsa alsaUcm
      pulseaudio
      wireplumber

      mosh

      display
    ];
  };

  lib = { ... }: { config.lib.meta = outputs.lib; };

  crypttab = { ... }: { imports = [ ./crypttab.nix ]; };

  alsa = { ... }: { imports = [ ./alsa.nix ]; };
  alsaUcm = { ... }: { imports = [ ./alsa-ucm.nix ]; };
  pulseaudio = { ... }: { imports = [ ./pulseaudio.nix ]; };
  wireplumber = { ... }: { imports = [ ./wireplumber.nix ]; };

  mosh = { ... }: { imports = [ ./mosh.nix ]; };

  display = { ... }: { imports = [ ../display/nixos.nix ]; };

  # TODO: steal some modules from tf-nix
}
