{
  looking-glass-host.__functor = _: import ./host.nix;
  looking-glass-host.fl'config.args = {
    cmake.offset = "build";
    pkg-config.offset = "build";
  };
  looking-glass-client-develop = import ./client.nix;
}
