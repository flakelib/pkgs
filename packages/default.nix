{
  i3gopher = import ./i3gopher;
  i3gopher-sway = { i3gopher }: i3gopher.override {
    enableI3 = false;
    enableSway = true;
  };
  i3gopher-i3 = { i3gopher }: i3gopher.override {
    enableI3 = true;
    enableSway = false;
  };
  glauth = import ./glauth.nix;
  konawall = import ./konawall.nix;
  paswitch = import ./paswitch.nix;
  clip = import ./clip.nix;
  nvflash = import ./nvflash.nix;
  nvidia-vbios-vfio-patcher = import ./nvidia-vbios-vfio-patcher;
  nvidia-capture-sdk = import ./nvidia-capture-sdk.nix;
  edfbrowser = import ./edfbrowser;
  mdloader = import ./mdloader.nix;
  muFFT = import ./mufft.nix;
  libjaylink = import ./libjaylink.nix;
  openocd-git = import ./openocd-git.nix;
  gst-jpegtrunc = import ./gst-jpegtrunc.nix;
  gst-protectbuffer = import ./gst-protectbuffer.nix;
  gst-rtsp-launch = import ./gst-rtsp-launch;
  zsh-completions-abduco = import ./zsh-completions-abduco.nix;
  lua-amalg = import ./lua-amalg.nix;
  github-label-sync = import ./github-label-sync;
  yggdrasil-address = import ./yggdrasil-address.nix;
  rustfmt-nightly = import ./rustfmt.nix;
  switch-lan-play = import ./switch-lan-play.nix;
  adafruit-dht-python = import ./adafruit-dht.nix;
  dht22-exporter = import ./dht22-exporter.nix;
}
// (import ./droid.nix)
// (import ./looking-glass)
// (import ./crates)
// (import ./ryzen-smu)
// (import ./matrix)
// (import ./pass)
// (import ./wireplumber)
