{
  base16 = { lib, stdenvNoCC, buildPackages, fetchFromGitHub, fetchFromGitLab, fetchFromSourcehut }: with lib; {
    buildScheme = { pname ? "base16-scheme-${slug}", slug, ... }@args: stdenvNoCC.mkDerivation ({
      inherit pname;

      nativeBuildInputs = args.nativeBuildInputs or [ ] ++ [ buildPackages.yq ];
      preferLocalBuild = true;

      outputs = [ "out" "nix" ];

      # fix schemes with incorrectly named ".yml" scheme files
      postPatch = args.postPatch or "" + ''
        for f in $(shopt -s nullglob; echo *.yml); do
          mv "$f" "''${f%.yml}.yaml"
        done
      '';

      buildPhase = ''
        BASE16_FILENAMES=($(shopt -s nullglob; echo *.yaml))
        runHook preBuild

        echo '{' > default.nix
        for f in ''${BASE16_FILENAMES[@]}; do
          fname="''${f%.yaml}"
          yq -Mc ". + { \"slug\": \"$fname\" }" "$f" > $fname.json
          printf '  "%s" = builtins.fromJSON (builtins.readFile "%s");\n' "$fname" "$out/$f" >> default.nix
        done
        echo '}' >> default.nix

        runHook postBuild
      '';

      installPhase = ''
        runHook preInstall

        install -d $out
        for f in ''${BASE16_FILENAMES[@]}; do
          fname="''${f%.yaml}"
          mv "$fname.json" "$out/$f"
        done
        mv default.nix $nix

        runHook postInstall
      '';
    } // removeAttrs args [ "pname" "nativeBuildInputs" "postPatch" ]);
    buildTemplate = { pname ? "base16-template-${slug}", slug, templateData, ... }@args: let
      templateIsPath = isDerivation templateData || isPath templateData;
    in stdenvNoCC.mkDerivation ({
      inherit pname;

      ${if templateIsPath then null else "templateData"} = builtins.toJSON templateData;
      ${if templateIsPath then "templateDataPath" else null} = templateData;
      passAsFile = args.passAsFile or [ ] ++ optional (!templateIsPath) "templateData";
      nativeBuildInputs = with buildPackages; args.nativeBuildInputs or [ ] ++ [ yq mustache-go ];
      preferLocalBuild = true;

      outputs = [ "out" "nix" ];

      buildPhase = ''
        runHook preBuild

        SCHEME_SLUG="$(yq -er '."scheme-slug"' "$templateDataPath")"

        echo '{' > default.nix
        BASE16_TEMPLATES=($(yq -er 'keys | .[]' templates/config.yaml))
        BASE16_OUTPUTS=()
        for template in "''${BASE16_TEMPLATES[@]}"; do
          template_extension="$(yq -er ".\"$template\".extension // .default.extension // \"\"" templates/config.yaml)"
          template_output="$(yq -er ".\"$template\".output // .default.output // \"\"" templates/config.yaml)"
          template_filename="$template_output''${template_output+/}base16-$SCHEME_SLUG$template_extension"
          BASE16_OUTPUTS+=("$template_filename")
          mkdir -p "$(dirname "$template_filename")"
          mustache "$templateDataPath" "templates/$template.mustache" > "$template_filename"
          printf '  "%s" = "%s";\n' "$template" "$out/$template_filename" >> default.nix
        done
        echo '}' >> default.nix

        runHook postBuild
      '';

      installPhase = ''
        runHook preInstall

        for template_filename in ''${BASE16_OUTPUTS[@]}; do
          outdir="$out/$(dirname "$template_filename")"
          install -Dt "$outdir" "$template_filename"
        done
        mv default.nix $nix

        runHook postInstall
      '';
    } // removeAttrs args [ "pname" "templateData" "passAsFile" "nativeBuildInputs" ]);
    repoSrc = source: {
      github = fetchFromGitHub;
      gitlab = fetchFromGitLab;
      sourcehut = fetchFromSourcehut;
    }.${source.type} {
      inherit (source) owner repo rev sha256;
    };
    shell = {
      # legacy compat for old module, do not use
      shell16 = mapAttrs head lib.base16.shell.mapping16;
      shells256 = lib.base16.shell.mapping256;
      shell256 = mapAttrs (_: head) lib.base16.shell.mapping256;
    };
  };
}
