{ outputs, callPackageSet }: let
  self = outputs.nixosModules;
in callPackageSet {
  kernel = import ./kernel.nix;
} { } // {
  modprobe = import ./modprobe.nix;

  default = { ... }: {
    imports = [ self.kernel self.modprobe ];
  };
}
