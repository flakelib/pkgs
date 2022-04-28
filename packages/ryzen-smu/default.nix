{
  ryzen-smu-monitor_cpu = { stdenv, libsmu }: stdenv.mkDerivation {
    pname = "ryzen-smu-userspace";
    inherit (libsmu) meta version src;

    buildInputs = [ libsmu ];

    buildPhase = ''
      rm -r lib
      $CC -lsmu userspace/monitor_cpu.c -o userspace/monitor_cpu
    '';

    installPhase = ''
      install -Dm0755 -t $out/bin/ userspace/monitor_cpu
    '';
  };

  libsmu = { lib, stdenv, fetchFromGitLab }: stdenv.mkDerivation {
    pname = "libsmu";
    version = "2021-04-21";

    src = fetchFromGitLab {
      owner = "leogx9r";
      repo = "ryzen_smu";
      #rev = "v${version}";
      rev = "847caf27a1e05bfcb546e4456572ed2bc4ffd262";
      sha256 = "1xcrdwdkk7ijhiqix5rmz59cfps7p0x7gwflhqdcjm6np0ja3acv";
    };

    makeFlags = [ "-C userspace" ];

    buildPhase = ''
      $CC -Ilib lib/libsmu.c -shared -o libsmu.so
    '';
    installPhase = ''
      install -Dm0755 -t $out/lib/ libsmu.so
      install -Dm0644 -t $out/include/ lib/libsmu.h
    '';

    meta.platforms = lib.platforms.linux;
  };

  ryzen-smu-scripts = { python3Packages, libsmu }: with python3Packages; let
    cpuid = buildPythonPackage {
      pname = "ryzen-smu-cpuid";
      inherit (libsmu) src version meta;

      passAsFile = [ "setup" ];
      setup = ''
        from setuptools import setup
        setup(
          name='@pname@',
          version='@version@',
          py_modules=['cpuid'],
        )
      '';

      postPatch = ''
        substituteAll $setupPath scripts/setup.py
      '';

      preConfigure = ''
        cd scripts
      '';
    };
  in buildPythonApplication {
    pname = "ryzen-smu-scripts";
    inherit (libsmu) meta version src;

    propagatedBuildInputs = [ cpuid ];

    postPatch = ''
      substituteAll $setupPath setup.py
      substituteInPlace scripts/monitor_cpu.py \
        --replace 'sys.path.append(os.path.abspath("."))' ""
    '';

    passAsFile = [ "setup" ];
    setup = ''
      from setuptools import setup
      setup(
        name='@pname@',
        version='@version@',
        packages=[],
        install_requires = ['ryzen-smu-cpuid'],
        scripts = [
          'scripts/dump_pm_table.py',
          'scripts/monitor_cpu.py',
          'scripts/read_dump.py',
          'scripts/test.py',
        ],
      )
    '';

    postInstall = ''
      for f in $out/bin/*.py; do
        fname=$(basename $f)
        mv $f $out/bin/cmu_''${fname#.py}
      done
    '';

    passthru = {
      inherit cpuid;
    };
  };
  ryzen-monitor = { stdenv, fetchFromGitHub, libsmu }: stdenv.mkDerivation {
    pname = "ryzen-monitor";
    version = "2021-05-16";

    src = fetchFromGitHub {
      owner = "hattedsquirrel";
      repo = "ryzen_monitor";
      rev = "fe721002e7937549847f9dd549f4244e74e220f1";
      sha256 = "01ywnm0kmdxnr9aq66cjrp17kaahcc626ha9qawc8c1q8sbwp1q2";
    };

    patches = [
      ./ryzen-monitor-update.patch
    ];

    buildInputs = [ libsmu ];
    makeFlags = "-C src";

    postPatch = ''
      rm -r src/lib
    '';
    buildPhase = ''
      $CC src/*.c -Isrc -lsmu -o src/ryzen_monitor
    '';
    installPhase = ''
      install -Dm0755 -t $out/bin/ src/ryzen_monitor
    '';

    meta = {
      inherit (libsmu.meta) platforms;
    };
  };
}
