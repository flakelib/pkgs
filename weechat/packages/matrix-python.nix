{ lib, python3Packages, weechat-matrix, fetchFromGitHub, enableOlm ? true, olm ? null }: let
  logbook = python3Packages.logbook or python3Packages.Logbook;
  # https://github.com/NixOS/nixpkgs/pull/347899
  matrix-nio = python3Packages.matrix-nio // {
    optional-dependencies = python3Packages.matrix-nio.optional-dependencies or {} // {
      e2e = map mapE2eInput e2eInputs;
    };
  };
  e2eInputs = python3Packages.matrix-nio.optional-dependencies.e2e or [
    python3Packages.cachetools
    python3Packages.python-olm
    python3Packages.peewee
  ];
  olm'secure = olm.overrideAttrs (old: {
    meta = builtins.removeAttrs olm.meta or {} [ "knownVulnerabilities" ];
  });
  mapE2eInput = input: if input.pname or null == "python-olm" && olm != null && input ? override
    then input.override { olm = olm'secure; }
    else input;

in with python3Packages; buildPythonPackage rec {
  pname = "weechat-matrix";
  version = "2023.07.23";
  src = fetchFromGitHub {
    owner = "poljar";
    repo = pname;
    rev = "feae9fda26ea9de98da9cd6733980a203115537e";
    sha256 = "sha256-flv1XF0tZgu3qoMFfJZ2MzeHYI++t12nkq3jJkRiCQ0=";
  };
  format = "setuptools";

  nativeBuildInputs = [
    pip
  ];
  propagatedBuildInputs = [
    pyopenssl
    webcolors
    atomicwrites
    attrs
    logbook
    pygments
    requests
    python_magic
    matrix-nio
  ] ++ lib.optional (pythonOlder "3.5") typing
  ++ lib.optional (pythonOlder "3.2") future
  ++ lib.optional (pythonAtLeast "3.5") aiohttp
  ++ lib.optionals enableOlm matrix-nio.optional-dependencies.e2e;

  passAsFile = [ "setup" ];
  setup = ''
    from io import open
    from setuptools import find_packages, setup

    with open('requirements.txt') as f:
      requirements = f.read().splitlines()

    setup(
      name='@pname@',
      version='@version@',
      install_requires=requirements,
      packages=find_packages(),
      scripts=['contrib/matrix_upload.py', 'contrib/matrix_sso_helper.py'],
    )
  '';

  postPatch = ''
    substituteAll $setupPath setup.py

    substituteInPlace contrib/matrix_upload.py \
      --replace "env -S " ""
    substituteInPlace contrib/matrix_sso_helper.py \
      --replace "env -S " ""

    substituteInPlace matrix/uploads.py \
      --replace matrix_upload $out/bin/matrix_upload.py
    substituteInPlace matrix/server.py \
      --replace matrix_sso_helper $out/bin/matrix_sso_helper.py
  '' + lib.optionalString (!enableOlm) ''
    substituteInPlace requirements.txt \
      --replace "[e2e]" ""
  '';

  postInstall = ''
    install -D main.py $out/share/weechat/matrix.py
  '';

  meta.broken = python.isPy2;
  passthru = {
    inherit (weechat-matrix) scripts;
    inherit matrix-nio;
  };
}
