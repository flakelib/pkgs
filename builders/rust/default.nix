let
  rustPlatformFor = { rustPlatform, ... }: rustPlatform;

  builders = {
    rustChannel = { inputs'rust, nixpkgs }: import inputs'rust {
      pkgs = nixpkgs.packages;
    };
    rustPlatforms = { rustChannel, lib }: with lib;
      mapAttrs (_: rustPlatformFor) rustChannel.releases // {
        stable = rustPlatformFor rustChannel.releases."1.60.0";
        # An occasionally pinned unstable release
        # Check https://rust-lang.github.io/rustup-components-history/ before updating this to avoid breaking things
        nightly = rustPlatformFor (rustChannel.nightly.override {
          date = "2022-04-03";
          sha256 = "1fp0p3s0diy61014zkhxw6b9vnvg0wdhg8d99nr8kn1praif5636";
          manifestPath = ./channel-rust-nightly.toml;
          rustcDev = true;
        });
        impure = mapAttrs (_: rustPlatformFor) {
          inherit (rustChannel) stable beta nightly;
        };
      };
    rustPlatformFor = { rustChannel }: args:
      rustPlatformFor (rustChannel.distChannel args);
  };
in builders
