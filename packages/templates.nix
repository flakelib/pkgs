{ lib
, buildTemplate, repoSrc, templates-source, schemes
, symlinkJoin
}: with lib; let
  inherit (lib.std) Drv;
  inherit (templates-source) sources;
  mapRepo = slug: repo: let
    addPassthru = drv: {
      import = import "${drv.nix}";
      templated = mapAttrs (key: conf: rec {
        path = "${drv}/${conf.output}/base16-${drv.scheme-slug}${conf.extension}";
        content = builtins.readFile path;
      }) repo.config;
    };
    build = templateData: buildTemplate {
      pname = "base16-template-${slug}-${templateData.scheme-slug}";
      inherit slug templateData;
      inherit (repo) version;
      src = repoSrc repo;

      passthru = {
        inherit repo;
        inherit (templateData) scheme-slug;
      };
    };
    withTemplateData = templateData: Drv.fixPassthru addPassthru (build templateData);
    schemes' = mapAttrs (schemeSlug: scheme:
      withTemplateData (base16.evalScheme scheme.data).templateData
    ) schemes.all;
    combined = symlinkJoin {
      name = "base16-${slug}";
      paths = attrValues schemes';
    };
  in combined // {
    inherit withTemplateData;
    schemes = schemes';
  };
in /*dontRecurseIntoAttrs*/ (mapAttrs mapRepo sources) // {
  inherit sources;
  names = attrNames sources;
}
