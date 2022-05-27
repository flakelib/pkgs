{ lib }: let
  inherit (lib.std) Set;
in {
  entryValues = extern: Set.map (_: entry: entry.value) extern.entries;
}
