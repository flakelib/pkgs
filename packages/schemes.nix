{ lib
, buildScheme, repoSrc, schemes-source
, symlinkJoin
}: with lib; let
  inherit (lib.std) Drv;
  inherit (schemes-source) sources;
  mapRepo = slug: repo: let
    schemeNames = repo.schemes or (singleton slug);
    addPassthru = drv: {
      import = import "${drv.nix}";
      schemes = genAttrs schemeNames (key: rec {
        path = "${drv}/${key}.yaml";
        data = importJSON path;
      });
    };
    drv = buildScheme {
      inherit slug;
      inherit (repo) version;
      src = repoSrc repo;

      passthru = {
        inherit schemeNames repo;
      };
    };
  in Drv.fixPassthru addPassthru drv;
  schemes = mapAttrs mapRepo sources;
  all = symlinkJoin {
    name = "base16-schemes";
    paths = attrValues schemes;
  };
in all // dontRecurseIntoAttrs schemes // {
  inherit sources;
  names = attrNames sources;
  all = let
    mapScheme = schemeRepo: schemeName: nameValuePair schemeName schemeRepo.schemes.${schemeName};
    mapSchemeRepo = schemeRepo: map (mapScheme schemeRepo) schemeRepo.schemeNames;
  in listToAttrs (concatMap mapSchemeRepo (attrValues schemes));
}
