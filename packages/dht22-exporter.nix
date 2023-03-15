{ lib, stdenv, fetchFromGitHub, fetchpatch, python3Packages, adafruit-dht-python ? python3Packages.adafruit-dht }:

with python3Packages;

buildPythonApplication rec {
  pname = "dht22_exporter";
  version = "2021.09.06";

  src = fetchFromGitHub {
    owner = "clintjedwards";
    repo = pname;
    rev = "0be653a2c9ea3edc3cc1e59202f19c61fa809899";
    sha256 = "10fsvcmnzvsrq5x5zh824zwz0mngx28b2cgrckx7zzq2rk67fnqx";
  };

  propagatedBuildInputs = [
    adafruit-dht-python
    configargparse
    prometheus_client
  ];

  meta = {
    inherit (adafruit-dht-python.meta) platforms;
  };
}
