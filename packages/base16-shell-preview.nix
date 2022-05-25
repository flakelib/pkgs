{ base16-shell-preview, templates, writeShellScriptBin }: writeShellScriptBin "base16-shell-preview" ''
  export BASE16_SHELL=${templates.shell}
  exec ${base16-shell-preview}/bin/base16-shell-preview "$@"
''
