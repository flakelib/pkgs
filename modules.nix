{
  nixos = import ./nixos;
  home = import ./home;

  nodes = import ./nodes;
  lazy = import ./lazy;
  run = import ./run;
  extern = import ./extern;
}
