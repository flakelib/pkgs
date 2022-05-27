{ lib }: let
  inherit (lib.std) drv;
  inherit (lib.meta) run;
in {
  program = run: drv.mainProgram run.package;

  app = run: {
    type = "app";
    program = run.program run;
  };
}
