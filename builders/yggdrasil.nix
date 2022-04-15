let
  packages = {
    calculateYggdrasilAddress = { lib, stdenvNoCC, yggdrasil-address }: pubkey: with lib; let
      addPassthru = drv: {
        import = removeSuffix "\n" (readFile "${drv}");
      };
      drv = stdenvNoCC.mkDerivation {
        name = "yggdrasil-address-${pubkey}";

        nativeBuildInputs = singleton yggdrasil-address;

        inherit pubkey;
        buildCommand = ''
          yggdrasil-address "$pubkey" > $out
        '';
      };
    in drvPassthru addPassthru drv;
  };
in packages
