# This file has been generated by node2nix 1.9.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, nix-gitignore, stdenv, lib, globalBuildInputs ? []}:

let
  sources = {
    "@financial-times/origami-service-makefile-7.0.3" = {
      name = "_at_financial-times_slash_origami-service-makefile";
      packageName = "@financial-times/origami-service-makefile";
      version = "7.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/@financial-times/origami-service-makefile/-/origami-service-makefile-7.0.3.tgz";
        sha512 = "aKe65sZ3XgZ/0Sm0MDLbGrcO3G4DRv/bVW4Gpmw68cRZV9IBE7h/pwfR3Rs7njNSZMFkjS4rPG/YySv9brQByA==";
      };
    };
    "@sindresorhus/is-4.0.0" = {
      name = "_at_sindresorhus_slash_is";
      packageName = "@sindresorhus/is";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@sindresorhus/is/-/is-4.0.0.tgz";
        sha512 = "FyD2meJpDPjyNQejSjvnhpgI/azsQkA4lGbuu5BQZfjvJ9cbRZXzeWL2HceCekW4lixO9JPesIIQkSoLjeJHNQ==";
      };
    };
    "@szmarczak/http-timer-4.0.5" = {
      name = "_at_szmarczak_slash_http-timer";
      packageName = "@szmarczak/http-timer";
      version = "4.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/@szmarczak/http-timer/-/http-timer-4.0.5.tgz";
        sha512 = "PyRA9sm1Yayuj5OIoJ1hGt2YISX45w9WcFbh6ddT0Z/0yaFxOtGLInr4jUfU1EAFVs0Yfyfev4RNwBlUaHdlDQ==";
      };
    };
    "@types/cacheable-request-6.0.1" = {
      name = "_at_types_slash_cacheable-request";
      packageName = "@types/cacheable-request";
      version = "6.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/cacheable-request/-/cacheable-request-6.0.1.tgz";
        sha512 = "ykFq2zmBGOCbpIXtoVbz4SKY5QriWPh3AjyU4G74RYbtt5yOc5OfaY75ftjg7mikMOla1CTGpX3lLbuJh8DTrQ==";
      };
    };
    "@types/color-name-1.1.1" = {
      name = "_at_types_slash_color-name";
      packageName = "@types/color-name";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/color-name/-/color-name-1.1.1.tgz";
        sha512 = "rr+OQyAjxze7GgWrSaJwydHStIhHq2lvY3BOC2Mj7KnzI7XK0Uw1TOOdI9lDoajEbSWLiYgoo4f1R51erQfhPQ==";
      };
    };
    "@types/http-cache-semantics-4.0.0" = {
      name = "_at_types_slash_http-cache-semantics";
      packageName = "@types/http-cache-semantics";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/http-cache-semantics/-/http-cache-semantics-4.0.0.tgz";
        sha512 = "c3Xy026kOF7QOTn00hbIllV1dLR9hG9NkSrLQgCVs8NF6sBU+VGWjD3wLPhmh1TYAc7ugCFsvHYMN4VcBN1U1A==";
      };
    };
    "@types/keyv-3.1.1" = {
      name = "_at_types_slash_keyv";
      packageName = "@types/keyv";
      version = "3.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/keyv/-/keyv-3.1.1.tgz";
        sha512 = "MPtoySlAZQ37VoLaPcTHCu1RWJ4llDkULYZIzOYxlhxBqYPB0RsRlmMU0R6tahtFe27mIdkHV+551ZWV4PLmVw==";
      };
    };
    "@types/node-14.0.27" = {
      name = "_at_types_slash_node";
      packageName = "@types/node";
      version = "14.0.27";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/node/-/node-14.0.27.tgz";
        sha512 = "kVrqXhbclHNHGu9ztnAwSncIgJv/FaxmzXJvGXNdcCpV1b8u1/Mi6z6m0vwy0LzKeXFTPLH0NzwmoJ3fNCIq0g==";
      };
    };
    "@types/responselike-1.0.0" = {
      name = "_at_types_slash_responselike";
      packageName = "@types/responselike";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/responselike/-/responselike-1.0.0.tgz";
        sha512 = "85Y2BjiufFzaMIlvJDvTTB8Fxl2xfLo4HgmHzVBz08w4wDePCTjYw66PdrolO0kzli3yam/YCgRufyo1DdQVTA==";
      };
    };
    "ajv-6.12.3" = {
      name = "ajv";
      packageName = "ajv";
      version = "6.12.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/ajv/-/ajv-6.12.3.tgz";
        sha512 = "4K0cK3L1hsqk9xIb2z9vs/XU+PGJZ9PNpJRDS9YLzmNdX6jmVPfamLvTJr0aDAusnHyCHO6MjzlkAsgtqp9teA==";
      };
    };
    "ansi-styles-4.2.1" = {
      name = "ansi-styles";
      packageName = "ansi-styles";
      version = "4.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.2.1.tgz";
        sha512 = "9VGjrMsG1vePxcSweQsN20KY/c4zN0h9fLjqAbwbPfahM3t+NL+M9HC8xeXG2I8pX5NoamTGNuomEUFI7fcUjA==";
      };
    };
    "argparse-1.0.10" = {
      name = "argparse";
      packageName = "argparse";
      version = "1.0.10";
      src = fetchurl {
        url = "https://registry.npmjs.org/argparse/-/argparse-1.0.10.tgz";
        sha512 = "o5Roy6tNG4SL/FOkCAN6RzjiakZS25RLYFrcMttJqbdd8BWrnA+fGz57iN5Pb06pvBGvl5gQ0B48dJlslXvoTg==";
      };
    };
    "array-uniq-1.0.2" = {
      name = "array-uniq";
      packageName = "array-uniq";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/array-uniq/-/array-uniq-1.0.2.tgz";
        sha1 = "5fcc373920775723cfd64d65c64bef53bf9eba6d";
      };
    };
    "asn1-0.2.4" = {
      name = "asn1";
      packageName = "asn1";
      version = "0.2.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/asn1/-/asn1-0.2.4.tgz";
        sha512 = "jxwzQpLQjSmWXgwaCZE9Nz+glAG01yF1QnWgbhGwHI5A6FRIEY6IVqtHhIepHqI7/kyEyQEagBC5mBEFlIYvdg==";
      };
    };
    "assert-plus-1.0.0" = {
      name = "assert-plus";
      packageName = "assert-plus";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/assert-plus/-/assert-plus-1.0.0.tgz";
        sha1 = "f12e0f3c5d77b0b1cdd9146942e4e96c1e4dd525";
      };
    };
    "asynckit-0.4.0" = {
      name = "asynckit";
      packageName = "asynckit";
      version = "0.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz";
        sha1 = "c79ed97f7f34cb8f2ba1bc9790bcc366474b4b79";
      };
    };
    "aws-sign2-0.7.0" = {
      name = "aws-sign2";
      packageName = "aws-sign2";
      version = "0.7.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/aws-sign2/-/aws-sign2-0.7.0.tgz";
        sha1 = "b46e890934a9591f2d2f6f86d7e6a9f1b3fe76a8";
      };
    };
    "aws4-1.10.0" = {
      name = "aws4";
      packageName = "aws4";
      version = "1.10.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/aws4/-/aws4-1.10.0.tgz";
        sha512 = "3YDiu347mtVtjpyV3u5kVqQLP242c06zwDOgpeRnybmXlYYsLbtTrUBUm8i8srONt+FWobl5aibnU1030PeeuA==";
      };
    };
    "bcrypt-pbkdf-1.0.2" = {
      name = "bcrypt-pbkdf";
      packageName = "bcrypt-pbkdf";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/bcrypt-pbkdf/-/bcrypt-pbkdf-1.0.2.tgz";
        sha1 = "a4301d389b6a43f9b67ff3ca11a3f6637e360e9e";
      };
    };
    "bluebird-3.7.2" = {
      name = "bluebird";
      packageName = "bluebird";
      version = "3.7.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/bluebird/-/bluebird-3.7.2.tgz";
        sha512 = "XpNj6GDQzdfW+r2Wnn7xiSAd7TM3jzkxGXBGTtWKuSXv1xUV+azxAm8jdWZN06QTQk+2N2XB9jRDkvbmQmcRtg==";
      };
    };
    "cacheable-lookup-5.0.3" = {
      name = "cacheable-lookup";
      packageName = "cacheable-lookup";
      version = "5.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/cacheable-lookup/-/cacheable-lookup-5.0.3.tgz";
        sha512 = "W+JBqF9SWe18A72XFzN/V/CULFzPm7sBXzzR6ekkE+3tLG72wFZrBiBZhrZuDoYexop4PHJVdFAKb/Nj9+tm9w==";
      };
    };
    "cacheable-request-7.0.1" = {
      name = "cacheable-request";
      packageName = "cacheable-request";
      version = "7.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/cacheable-request/-/cacheable-request-7.0.1.tgz";
        sha512 = "lt0mJ6YAnsrBErpTMWeu5kl/tg9xMAWjavYTN6VQXM1A/teBITuNcccXsCxF0tDQQJf9DfAaX5O4e0zp0KlfZw==";
      };
    };
    "caseless-0.12.0" = {
      name = "caseless";
      packageName = "caseless";
      version = "0.12.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/caseless/-/caseless-0.12.0.tgz";
        sha1 = "1b681c21ff84033c826543090689420d187151dc";
      };
    };
    "chalk-4.1.0" = {
      name = "chalk";
      packageName = "chalk";
      version = "4.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/chalk/-/chalk-4.1.0.tgz";
        sha512 = "qwx12AxXe2Q5xQ43Ac//I6v5aXTipYrSESdOgzrN+9XjgEpyjpKuvSGaN4qE93f7TQTlerQQ8S+EQ0EyDoVL1A==";
      };
    };
    "clone-response-1.0.2" = {
      name = "clone-response";
      packageName = "clone-response";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/clone-response/-/clone-response-1.0.2.tgz";
        sha1 = "d1dc973920314df67fbeb94223b4ee350239e96b";
      };
    };
    "color-convert-2.0.1" = {
      name = "color-convert";
      packageName = "color-convert";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz";
        sha512 = "RRECPsj7iu/xb5oKYcsFHSppFNnsj/52OVTRKb4zP5onXwVF3zVmmToNcOfGC+CRDpfK/U584fMg38ZHCaElKQ==";
      };
    };
    "color-name-1.1.4" = {
      name = "color-name";
      packageName = "color-name";
      version = "1.1.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz";
        sha512 = "dOy+3AuW3a2wNbZHIuMZpTcgjGuLU/uBL/ubcZF9OXbDo8ff4O8yVp5Bf0efS8uEoYo5q4Fx7dY9OgQGXgAsQA==";
      };
    };
    "combined-stream-1.0.8" = {
      name = "combined-stream";
      packageName = "combined-stream";
      version = "1.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.8.tgz";
        sha512 = "FQN4MRfuJeHf7cBbBMJFXhKSDq+2kAArBlmRBvcvFE5BB1HZKXtSFASDhdlz9zOYwxh8lDdnvmMOe/+5cdoEdg==";
      };
    };
    "commander-6.2.1" = {
      name = "commander";
      packageName = "commander";
      version = "6.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/commander/-/commander-6.2.1.tgz";
        sha512 = "U7VdrJFnJgo4xjrHpTzu0yrHPGImdsmD95ZlgYSEajAn2JKzDhDTPG9kBTefmObL2w/ngeZnilk+OV9CG3d7UA==";
      };
    };
    "core-util-is-1.0.2" = {
      name = "core-util-is";
      packageName = "core-util-is";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/core-util-is/-/core-util-is-1.0.2.tgz";
        sha1 = "b5fd54220aa2bc5ab57aab7140c940754503c1a7";
      };
    };
    "dashdash-1.14.1" = {
      name = "dashdash";
      packageName = "dashdash";
      version = "1.14.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/dashdash/-/dashdash-1.14.1.tgz";
        sha1 = "853cfa0f7cbe2fed5de20326b8dd581035f6e2f0";
      };
    };
    "decompress-response-6.0.0" = {
      name = "decompress-response";
      packageName = "decompress-response";
      version = "6.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/decompress-response/-/decompress-response-6.0.0.tgz";
        sha512 = "aW35yZM6Bb/4oJlZncMH2LCoZtJXTRxES17vE3hoRiowU2kWHaJKFkSBDnDR+cm9J+9QhXmREyIfv0pji9ejCQ==";
      };
    };
    "deep-extend-0.6.0" = {
      name = "deep-extend";
      packageName = "deep-extend";
      version = "0.6.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/deep-extend/-/deep-extend-0.6.0.tgz";
        sha512 = "LOHxIOaPYdHlJRtCQfDIVZtfw/ufM8+rVj649RIHzcm/vGwQRXFt6OPqIFWsm2XEMrNIEtWR64sY1LEKD2vAOA==";
      };
    };
    "defer-to-connect-2.0.0" = {
      name = "defer-to-connect";
      packageName = "defer-to-connect";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/defer-to-connect/-/defer-to-connect-2.0.0.tgz";
        sha512 = "bYL2d05vOSf1JEZNx5vSAtPuBMkX8K9EUutg7zlKvTqKXHt7RhWJFbmd7qakVuf13i+IkGmp6FwSsONOf6VYIg==";
      };
    };
    "delayed-stream-1.0.0" = {
      name = "delayed-stream";
      packageName = "delayed-stream";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz";
        sha1 = "df3ae199acadfb7d440aaae0b29e2272b24ec619";
      };
    };
    "ecc-jsbn-0.1.2" = {
      name = "ecc-jsbn";
      packageName = "ecc-jsbn";
      version = "0.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/ecc-jsbn/-/ecc-jsbn-0.1.2.tgz";
        sha1 = "3a83a904e54353287874c564b7549386849a98c9";
      };
    };
    "end-of-stream-1.4.4" = {
      name = "end-of-stream";
      packageName = "end-of-stream";
      version = "1.4.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/end-of-stream/-/end-of-stream-1.4.4.tgz";
        sha512 = "+uw1inIHVPQoaVuHzRyXd21icM+cnt4CzD5rW+NC1wjOUSTOs+Te7FOv7AhN7vS9x/oIyhLP5PR1H+phQAHu5Q==";
      };
    };
    "esprima-4.0.1" = {
      name = "esprima";
      packageName = "esprima";
      version = "4.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/esprima/-/esprima-4.0.1.tgz";
        sha512 = "eGuFFw7Upda+g4p+QHvnW0RyTX/SVeJBDM/gCtMARO0cLuT2HcEKnTPvhjV6aGeqrCB/sbNop0Kszm0jsaWU4A==";
      };
    };
    "extend-3.0.2" = {
      name = "extend";
      packageName = "extend";
      version = "3.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/extend/-/extend-3.0.2.tgz";
        sha512 = "fjquC59cD7CyW6urNXK0FBufkZcoiGG80wTuPujX590cB5Ttln20E2UB4S/WARVqhXffZl2LNgS+gQdPIIim/g==";
      };
    };
    "extsprintf-1.3.0" = {
      name = "extsprintf";
      packageName = "extsprintf";
      version = "1.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/extsprintf/-/extsprintf-1.3.0.tgz";
        sha1 = "96918440e3041a7a414f8c52e3c574eb3c3e1e05";
      };
    };
    "fast-deep-equal-3.1.3" = {
      name = "fast-deep-equal";
      packageName = "fast-deep-equal";
      version = "3.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz";
        sha512 = "f3qQ9oQy9j2AhBe/H9VC91wLmKBCCU/gDOnKNAYG5hswO7BLKj09Hc5HYNz9cGI++xlpDCIgDaitVs03ATR84Q==";
      };
    };
    "fast-json-stable-stringify-2.1.0" = {
      name = "fast-json-stable-stringify";
      packageName = "fast-json-stable-stringify";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-json-stable-stringify/-/fast-json-stable-stringify-2.1.0.tgz";
        sha512 = "lhd/wF+Lk98HZoTCtlVraHtfh5XYijIjalXck7saUtuanSDyLMxnHhSXEDJqHxD7msR8D0uCmqlkwjCV8xvwHw==";
      };
    };
    "forever-agent-0.6.1" = {
      name = "forever-agent";
      packageName = "forever-agent";
      version = "0.6.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/forever-agent/-/forever-agent-0.6.1.tgz";
        sha1 = "fbc71f0c41adeb37f96c577ad1ed42d8fdacca91";
      };
    };
    "form-data-2.3.3" = {
      name = "form-data";
      packageName = "form-data";
      version = "2.3.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/form-data/-/form-data-2.3.3.tgz";
        sha512 = "1lLKB2Mu3aGP1Q/2eCOx0fNbRMe7XdwktwOruhfqqd0rIJWwN4Dh+E3hrPSlDCXnSR7UtZ1N38rVXm+6+MEhJQ==";
      };
    };
    "function-bind-1.1.1" = {
      name = "function-bind";
      packageName = "function-bind";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/function-bind/-/function-bind-1.1.1.tgz";
        sha512 = "yIovAzMX49sF8Yl58fSCWJ5svSLuaibPxXQJFLmBObTuCr0Mf1KiPopGM9NiFjiYBCbfaa2Fh6breQ6ANVTI0A==";
      };
    };
    "get-stream-5.2.0" = {
      name = "get-stream";
      packageName = "get-stream";
      version = "5.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/get-stream/-/get-stream-5.2.0.tgz";
        sha512 = "nBF+F1rAZVCu/p7rjzgA+Yb4lfYXrpl7a6VmJrU8wF9I1CKvP/QwPNZHnOlwbTkY6dvtFIzFMSyQXbLoTQPRpA==";
      };
    };
    "getpass-0.1.7" = {
      name = "getpass";
      packageName = "getpass";
      version = "0.1.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/getpass/-/getpass-0.1.7.tgz";
        sha1 = "5eff8e3e684d569ae4cb2b1282604e8ba62149fa";
      };
    };
    "got-11.8.2" = {
      name = "got";
      packageName = "got";
      version = "11.8.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/got/-/got-11.8.2.tgz";
        sha512 = "D0QywKgIe30ODs+fm8wMZiAcZjypcCodPNuMz5H9Mny7RJ+IjJ10BdmGW7OM7fHXP+O7r6ZwapQ/YQmMSvB0UQ==";
      };
    };
    "har-schema-2.0.0" = {
      name = "har-schema";
      packageName = "har-schema";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/har-schema/-/har-schema-2.0.0.tgz";
        sha1 = "a94c2224ebcac04782a0d9035521f24735b7ec92";
      };
    };
    "har-validator-5.1.3" = {
      name = "har-validator";
      packageName = "har-validator";
      version = "5.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/har-validator/-/har-validator-5.1.3.tgz";
        sha512 = "sNvOCzEQNr/qrvJgc3UG/kD4QtlHycrzwS+6mfTrrSq97BvaYcPZZI1ZSqGSPR73Cxn4LKTD4PttRwfU7jWq5g==";
      };
    };
    "has-1.0.3" = {
      name = "has";
      packageName = "has";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/has/-/has-1.0.3.tgz";
        sha512 = "f2dvO0VU6Oej7RkWJGrehjbzMAjFp5/VKPp5tTpWIV4JHHZK1/BxbFRtf/siA2SWTe09caDmVtYYzWEIbBS4zw==";
      };
    };
    "has-flag-4.0.0" = {
      name = "has-flag";
      packageName = "has-flag";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/has-flag/-/has-flag-4.0.0.tgz";
        sha512 = "EykJT/Q1KjTWctppgIAgfSO0tKVuZUjhgMr17kqTumMl6Afv3EISleU7qZUzoXDFTAHTDC4NOoG/ZxU3EvlMPQ==";
      };
    };
    "http-cache-semantics-4.1.0" = {
      name = "http-cache-semantics";
      packageName = "http-cache-semantics";
      version = "4.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/http-cache-semantics/-/http-cache-semantics-4.1.0.tgz";
        sha512 = "carPklcUh7ROWRK7Cv27RPtdhYhUsela/ue5/jKzjegVvXDqM2ILE9Q2BGn9JZJh1g87cp56su/FgQSzcWS8cQ==";
      };
    };
    "http-signature-1.2.0" = {
      name = "http-signature";
      packageName = "http-signature";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/http-signature/-/http-signature-1.2.0.tgz";
        sha1 = "9aecd925114772f3d95b65a60abb8f7c18fbace1";
      };
    };
    "http2-wrapper-1.0.0-beta.5.2" = {
      name = "http2-wrapper";
      packageName = "http2-wrapper";
      version = "1.0.0-beta.5.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/http2-wrapper/-/http2-wrapper-1.0.0-beta.5.2.tgz";
        sha512 = "xYz9goEyBnC8XwXDTuC/MZ6t+MrKVQZOk4s7+PaDkwIsQd8IwqvM+0M6bA/2lvG8GHXcPdf+MejTUeO2LCPCeQ==";
      };
    };
    "is-3.3.0" = {
      name = "is";
      packageName = "is";
      version = "3.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is/-/is-3.3.0.tgz";
        sha512 = "nW24QBoPcFGGHJGUwnfpI7Yc5CdqWNdsyHQszVE/z2pKHXzh7FZ5GWhJqSyaQ9wMkQnsTx+kAI8bHlCX4tKdbg==";
      };
    };
    "is-typedarray-1.0.0" = {
      name = "is-typedarray";
      packageName = "is-typedarray";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-typedarray/-/is-typedarray-1.0.0.tgz";
        sha1 = "e479c80858df0c1b11ddda6940f96011fcda4a9a";
      };
    };
    "isstream-0.1.2" = {
      name = "isstream";
      packageName = "isstream";
      version = "0.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/isstream/-/isstream-0.1.2.tgz";
        sha1 = "47e63f7af55afa6f92e1500e690eb8b8529c099a";
      };
    };
    "js-yaml-3.14.1" = {
      name = "js-yaml";
      packageName = "js-yaml";
      version = "3.14.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/js-yaml/-/js-yaml-3.14.1.tgz";
        sha512 = "okMH7OXXJ7YrN9Ok3/SXrnu4iX9yOk+25nqX4imS2npuvTYDmo/QEZoqwZkYaIDk3jVvBOTOIEgEhaLOynBS9g==";
      };
    };
    "jsbn-0.1.1" = {
      name = "jsbn";
      packageName = "jsbn";
      version = "0.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/jsbn/-/jsbn-0.1.1.tgz";
        sha1 = "a5e654c2e5a2deb5f201d96cefbca80c0ef2f513";
      };
    };
    "json-buffer-3.0.1" = {
      name = "json-buffer";
      packageName = "json-buffer";
      version = "3.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/json-buffer/-/json-buffer-3.0.1.tgz";
        sha512 = "4bV5BfR2mqfQTJm+V5tPPdf+ZpuhiIvTuAB5g8kcrXOZpTT/QwwVRWBywX1ozr6lEuPdbHxwaJlm9G6mI2sfSQ==";
      };
    };
    "json-schema-0.2.3" = {
      name = "json-schema";
      packageName = "json-schema";
      version = "0.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/json-schema/-/json-schema-0.2.3.tgz";
        sha1 = "b480c892e59a2f05954ce727bd3f2a4e882f9e13";
      };
    };
    "json-schema-traverse-0.4.1" = {
      name = "json-schema-traverse";
      packageName = "json-schema-traverse";
      version = "0.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-0.4.1.tgz";
        sha512 = "xbbCH5dCYU5T8LcEhhuh7HJ88HXuW3qsI3Y0zOZFKfZEHcpWiHU/Jxzk629Brsab/mMiHQti9wMP+845RPe3Vg==";
      };
    };
    "json-stringify-safe-5.0.1" = {
      name = "json-stringify-safe";
      packageName = "json-stringify-safe";
      version = "5.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/json-stringify-safe/-/json-stringify-safe-5.0.1.tgz";
        sha1 = "1296a2d58fd45f19a0f6ce01d65701e2c735b6eb";
      };
    };
    "jsprim-1.4.1" = {
      name = "jsprim";
      packageName = "jsprim";
      version = "1.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/jsprim/-/jsprim-1.4.1.tgz";
        sha1 = "313e66bc1e5cc06e438bc1b7499c2e5c56acb6a2";
      };
    };
    "keyv-4.0.1" = {
      name = "keyv";
      packageName = "keyv";
      version = "4.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/keyv/-/keyv-4.0.1.tgz";
        sha512 = "xz6Jv6oNkbhrFCvCP7HQa8AaII8y8LRpoSm661NOKLr4uHuBwhX4epXrPQgF3+xdJnN4Esm5X0xwY4bOlALOtw==";
      };
    };
    "lowercase-keys-2.0.0" = {
      name = "lowercase-keys";
      packageName = "lowercase-keys";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/lowercase-keys/-/lowercase-keys-2.0.0.tgz";
        sha512 = "tqNXrS78oMOE73NMxK4EMLQsQowWf8jKooH9g7xPavRT706R6bkQJ6DY2Te7QukaZsulxa30wQ7bk0pm4XiHmA==";
      };
    };
    "mime-db-1.44.0" = {
      name = "mime-db";
      packageName = "mime-db";
      version = "1.44.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-db/-/mime-db-1.44.0.tgz";
        sha512 = "/NOTfLrsPBVeH7YtFPgsVWveuL+4SjjYxaQ1xtM1KMFj7HdxlBlxeyNLzhyJVx7r4rZGJAZ/6lkKCitSc/Nmpg==";
      };
    };
    "mime-types-2.1.27" = {
      name = "mime-types";
      packageName = "mime-types";
      version = "2.1.27";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-types/-/mime-types-2.1.27.tgz";
        sha512 = "JIhqnCasI9yD+SsmkquHBxTSEuZdQX5BuQnS2Vc7puQQQ+8yiP5AY5uWhpdv4YL4VM5c6iliiYWPgJ/nJQLp7w==";
      };
    };
    "mimic-response-1.0.1" = {
      name = "mimic-response";
      packageName = "mimic-response";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/mimic-response/-/mimic-response-1.0.1.tgz";
        sha512 = "j5EctnkH7amfV/q5Hgmoal1g2QHFJRraOtmx0JpIqkxhBhI/lJSl1nMpQ45hVarwNETOoWEimndZ4QK0RHxuxQ==";
      };
    };
    "mimic-response-3.1.0" = {
      name = "mimic-response";
      packageName = "mimic-response";
      version = "3.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mimic-response/-/mimic-response-3.1.0.tgz";
        sha512 = "z0yWI+4FDrrweS8Zmt4Ej5HdJmky15+L2e6Wgn3+iK5fWzb6T3fhNFq2+MeTRb064c6Wr4N/wv0DzQTjNzHNGQ==";
      };
    };
    "node.extend-2.0.2" = {
      name = "node.extend";
      packageName = "node.extend";
      version = "2.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/node.extend/-/node.extend-2.0.2.tgz";
        sha512 = "pDT4Dchl94/+kkgdwyS2PauDFjZG0Hk0IcHIB+LkW27HLDtdoeMxHTxZh39DYbPP8UflWXWj9JcdDozF+YDOpQ==";
      };
    };
    "normalize-url-4.5.1" = {
      name = "normalize-url";
      packageName = "normalize-url";
      version = "4.5.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/normalize-url/-/normalize-url-4.5.1.tgz";
        sha512 = "9UZCFRHQdNrfTpGg8+1INIg93B6zE0aXMVFkw1WFwvO4SlZywU6aLg5Of0Ap/PgcbSw4LNxvMWXMeugwMCX0AA==";
      };
    };
    "oauth-sign-0.9.0" = {
      name = "oauth-sign";
      packageName = "oauth-sign";
      version = "0.9.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/oauth-sign/-/oauth-sign-0.9.0.tgz";
        sha512 = "fexhUFFPTGV8ybAtSIGbV6gOkSv8UtRbDBnAyLQw4QPKkgNlsH2ByPGtMUqdWkos6YCRmAqViwgZrJc/mRDzZQ==";
      };
    };
    "octonode-0.10.2" = {
      name = "octonode";
      packageName = "octonode";
      version = "0.10.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/octonode/-/octonode-0.10.2.tgz";
        sha512 = "lxKJxAvrw3BuM0Wu3A/TRyFkYxMFWbMm8p7fDO3EoG9KDgOy53d91bjlGR1mmNk1EoF5LjGBx7BmIB+PfmMKLQ==";
      };
    };
    "once-1.4.0" = {
      name = "once";
      packageName = "once";
      version = "1.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/once/-/once-1.4.0.tgz";
        sha1 = "583b1aa775961d4b113ac17d9c50baef9dd76bd1";
      };
    };
    "p-cancelable-2.0.0" = {
      name = "p-cancelable";
      packageName = "p-cancelable";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/p-cancelable/-/p-cancelable-2.0.0.tgz";
        sha512 = "wvPXDmbMmu2ksjkB4Z3nZWTSkJEb9lqVdMaCKpZUGJG9TMiNp9XcbG3fn9fPKjem04fJMJnXoyFPk2FmgiaiNg==";
      };
    };
    "performance-now-2.1.0" = {
      name = "performance-now";
      packageName = "performance-now";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/performance-now/-/performance-now-2.1.0.tgz";
        sha1 = "6309f4e0e5fa913ec1c69307ae364b4b377c9e7b";
      };
    };
    "psl-1.8.0" = {
      name = "psl";
      packageName = "psl";
      version = "1.8.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/psl/-/psl-1.8.0.tgz";
        sha512 = "RIdOzyoavK+hA18OGGWDqUTsCLhtA7IcZ/6NCs4fFJaHBDab+pDDmDIByWFRQJq2Cd7r1OoQxBGKOaztq+hjIQ==";
      };
    };
    "pump-3.0.0" = {
      name = "pump";
      packageName = "pump";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/pump/-/pump-3.0.0.tgz";
        sha512 = "LwZy+p3SFs1Pytd/jYct4wpv49HiYCqd9Rlc5ZVdk0V+8Yzv6jR5Blk3TRmPL1ft69TxP0IMZGJ+WPFU2BFhww==";
      };
    };
    "punycode-2.1.1" = {
      name = "punycode";
      packageName = "punycode";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/punycode/-/punycode-2.1.1.tgz";
        sha512 = "XRsRjdf+j5ml+y/6GKHPZbrF/8p2Yga0JPtdqTIY2Xe5ohJPD9saDJJLPvp9+NSBprVvevdXZybnj2cv8OEd0A==";
      };
    };
    "qs-6.5.2" = {
      name = "qs";
      packageName = "qs";
      version = "6.5.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/qs/-/qs-6.5.2.tgz";
        sha512 = "N5ZAX4/LxJmF+7wN74pUD6qAh9/wnvdQcjq9TZjevvXzSUo7bfmw91saqMjzGS2xq91/odN2dW/WOl7qQHNDGA==";
      };
    };
    "quick-lru-5.1.1" = {
      name = "quick-lru";
      packageName = "quick-lru";
      version = "5.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/quick-lru/-/quick-lru-5.1.1.tgz";
        sha512 = "WuyALRjWPDGtt/wzJiadO5AXY+8hZ80hVpe6MyivgraREW751X3SbhRvG3eLKOYN+8VEvqLcf3wdnt44Z4S4SA==";
      };
    };
    "randomstring-1.1.5" = {
      name = "randomstring";
      packageName = "randomstring";
      version = "1.1.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/randomstring/-/randomstring-1.1.5.tgz";
        sha1 = "6df0628f75cbd5932930d9fe3ab4e956a18518c3";
      };
    };
    "request-2.88.2" = {
      name = "request";
      packageName = "request";
      version = "2.88.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/request/-/request-2.88.2.tgz";
        sha512 = "MsvtOrfG9ZcrOwAW+Qi+F6HbD0CWXEh9ou77uOb7FM2WPhwT7smM833PzanhJLsgXjN89Ir6V2PczXNnMpwKhw==";
      };
    };
    "resolve-alpn-1.0.0" = {
      name = "resolve-alpn";
      packageName = "resolve-alpn";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/resolve-alpn/-/resolve-alpn-1.0.0.tgz";
        sha512 = "rTuiIEqFmGxne4IovivKSDzld2lWW9QCjqv80SYjPgf+gS35eaCAjaP54CCwGAwBtnCsvNLYtqxe1Nw+i6JEmA==";
      };
    };
    "responselike-2.0.0" = {
      name = "responselike";
      packageName = "responselike";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/responselike/-/responselike-2.0.0.tgz";
        sha512 = "xH48u3FTB9VsZw7R+vvgaKeLKzT6jOogbQhEe/jewwnZgzPcnyWui2Av6JpoYZF/91uueC+lqhWqeURw5/qhCw==";
      };
    };
    "safe-buffer-5.2.1" = {
      name = "safe-buffer";
      packageName = "safe-buffer";
      version = "5.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.1.tgz";
        sha512 = "rp3So07KcdmmKbGvgaNxQSJr7bGVSVk5S9Eq1F+ppbRo70+YeaDxkw5Dd8NPN+GD6bjnYm2VuPuCXmpuYvmCXQ==";
      };
    };
    "safer-buffer-2.1.2" = {
      name = "safer-buffer";
      packageName = "safer-buffer";
      version = "2.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz";
        sha512 = "YZo3K82SD7Riyi0E1EQPojLz7kpepnSQI9IyPbHHg1XXXevb5dJI7tpyN2ADxGcQbHG7vcyRHk0cbwqcQriUtg==";
      };
    };
    "sprintf-js-1.0.3" = {
      name = "sprintf-js";
      packageName = "sprintf-js";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/sprintf-js/-/sprintf-js-1.0.3.tgz";
        sha1 = "04e6926f662895354f3dd015203633b857297e2c";
      };
    };
    "sshpk-1.16.1" = {
      name = "sshpk";
      packageName = "sshpk";
      version = "1.16.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/sshpk/-/sshpk-1.16.1.tgz";
        sha512 = "HXXqVUq7+pcKeLqqZj6mHFUMvXtOJt1uoUx09pFW6011inTMxqI8BA8PM95myrIyyKwdnzjdFjLiE6KBPVtJIg==";
      };
    };
    "supports-color-7.1.0" = {
      name = "supports-color";
      packageName = "supports-color";
      version = "7.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/supports-color/-/supports-color-7.1.0.tgz";
        sha512 = "oRSIpR8pxT1Wr2FquTNnGet79b3BWljqOuoW/h4oBhxJ/HUbX5nX6JSruTkvXDCFMwDPvsaTTbvMLKZWSy0R5g==";
      };
    };
    "tough-cookie-2.5.0" = {
      name = "tough-cookie";
      packageName = "tough-cookie";
      version = "2.5.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/tough-cookie/-/tough-cookie-2.5.0.tgz";
        sha512 = "nlLsUzgm1kfLXSXfRZMc1KLAugd4hqJHDTvc2hDIwS3mZAfMEuMbc03SujMF+GEcpaX/qboeycw6iO8JwVv2+g==";
      };
    };
    "tunnel-agent-0.6.0" = {
      name = "tunnel-agent";
      packageName = "tunnel-agent";
      version = "0.6.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/tunnel-agent/-/tunnel-agent-0.6.0.tgz";
        sha1 = "27a5dea06b36b04a0a9966774b290868f0fc40fd";
      };
    };
    "tweetnacl-0.14.5" = {
      name = "tweetnacl";
      packageName = "tweetnacl";
      version = "0.14.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/tweetnacl/-/tweetnacl-0.14.5.tgz";
        sha1 = "5ae68177f192d4456269d108afa93ff8743f4f64";
      };
    };
    "uri-js-4.2.2" = {
      name = "uri-js";
      packageName = "uri-js";
      version = "4.2.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/uri-js/-/uri-js-4.2.2.tgz";
        sha512 = "KY9Frmirql91X2Qgjry0Wd4Y+YTdrdZheS8TFwvkbLWf/G5KNJDCh6pKL5OZctEW4+0Baa5idK2ZQuELRwPznQ==";
      };
    };
    "uuid-3.4.0" = {
      name = "uuid";
      packageName = "uuid";
      version = "3.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/uuid/-/uuid-3.4.0.tgz";
        sha512 = "HjSDRw6gZE5JMggctHBcjVak08+KEVhSIiDzFnT9S9aegmp85S/bReBVTb4QTFaRNptJ9kuYaNhnbNEOkbKb/A==";
      };
    };
    "verror-1.10.0" = {
      name = "verror";
      packageName = "verror";
      version = "1.10.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/verror/-/verror-1.10.0.tgz";
        sha1 = "3a105ca17053af55d6e270c1f8288682e18da400";
      };
    };
    "wrappy-1.0.2" = {
      name = "wrappy";
      packageName = "wrappy";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz";
        sha1 = "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f";
      };
    };
  };
  args = {
    name = "github-label-sync";
    packageName = "github-label-sync";
    version = "2.0.2";
    src = ./.;
    dependencies = [
      sources."@financial-times/origami-service-makefile-7.0.3"
      sources."@sindresorhus/is-4.0.0"
      sources."@szmarczak/http-timer-4.0.5"
      sources."@types/cacheable-request-6.0.1"
      sources."@types/color-name-1.1.1"
      sources."@types/http-cache-semantics-4.0.0"
      sources."@types/keyv-3.1.1"
      sources."@types/node-14.0.27"
      sources."@types/responselike-1.0.0"
      sources."ajv-6.12.3"
      sources."ansi-styles-4.2.1"
      sources."argparse-1.0.10"
      sources."array-uniq-1.0.2"
      sources."asn1-0.2.4"
      sources."assert-plus-1.0.0"
      sources."asynckit-0.4.0"
      sources."aws-sign2-0.7.0"
      sources."aws4-1.10.0"
      sources."bcrypt-pbkdf-1.0.2"
      sources."bluebird-3.7.2"
      sources."cacheable-lookup-5.0.3"
      sources."cacheable-request-7.0.1"
      sources."caseless-0.12.0"
      sources."chalk-4.1.0"
      sources."clone-response-1.0.2"
      sources."color-convert-2.0.1"
      sources."color-name-1.1.4"
      sources."combined-stream-1.0.8"
      sources."commander-6.2.1"
      sources."core-util-is-1.0.2"
      sources."dashdash-1.14.1"
      (sources."decompress-response-6.0.0" // {
        dependencies = [
          sources."mimic-response-3.1.0"
        ];
      })
      sources."deep-extend-0.6.0"
      sources."defer-to-connect-2.0.0"
      sources."delayed-stream-1.0.0"
      sources."ecc-jsbn-0.1.2"
      sources."end-of-stream-1.4.4"
      sources."esprima-4.0.1"
      sources."extend-3.0.2"
      sources."extsprintf-1.3.0"
      sources."fast-deep-equal-3.1.3"
      sources."fast-json-stable-stringify-2.1.0"
      sources."forever-agent-0.6.1"
      sources."form-data-2.3.3"
      sources."function-bind-1.1.1"
      sources."get-stream-5.2.0"
      sources."getpass-0.1.7"
      sources."got-11.8.2"
      sources."har-schema-2.0.0"
      sources."har-validator-5.1.3"
      sources."has-1.0.3"
      sources."has-flag-4.0.0"
      sources."http-cache-semantics-4.1.0"
      sources."http-signature-1.2.0"
      sources."http2-wrapper-1.0.0-beta.5.2"
      sources."is-3.3.0"
      sources."is-typedarray-1.0.0"
      sources."isstream-0.1.2"
      sources."js-yaml-3.14.1"
      sources."jsbn-0.1.1"
      sources."json-buffer-3.0.1"
      sources."json-schema-0.2.3"
      sources."json-schema-traverse-0.4.1"
      sources."json-stringify-safe-5.0.1"
      sources."jsprim-1.4.1"
      sources."keyv-4.0.1"
      sources."lowercase-keys-2.0.0"
      sources."mime-db-1.44.0"
      sources."mime-types-2.1.27"
      sources."mimic-response-1.0.1"
      sources."node.extend-2.0.2"
      sources."normalize-url-4.5.1"
      sources."oauth-sign-0.9.0"
      sources."octonode-0.10.2"
      sources."once-1.4.0"
      sources."p-cancelable-2.0.0"
      sources."performance-now-2.1.0"
      sources."psl-1.8.0"
      sources."pump-3.0.0"
      sources."punycode-2.1.1"
      sources."qs-6.5.2"
      sources."quick-lru-5.1.1"
      sources."randomstring-1.1.5"
      sources."request-2.88.2"
      sources."resolve-alpn-1.0.0"
      sources."responselike-2.0.0"
      sources."safe-buffer-5.2.1"
      sources."safer-buffer-2.1.2"
      sources."sprintf-js-1.0.3"
      sources."sshpk-1.16.1"
      sources."supports-color-7.1.0"
      sources."tough-cookie-2.5.0"
      sources."tunnel-agent-0.6.0"
      sources."tweetnacl-0.14.5"
      sources."uri-js-4.2.2"
      sources."uuid-3.4.0"
      sources."verror-1.10.0"
      sources."wrappy-1.0.2"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "Synchronise your GitHub labels with as few destructive operations as possible";
      homepage = "https://github.com/Financial-Times/github-label-sync";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = false;
  };
in
{
  args = args;
  sources = sources;
  tarball = nodeEnv.buildNodeSourceDist args;
  package = nodeEnv.buildNodePackage args;
  shell = nodeEnv.buildNodeShell args;
  nodeDependencies = nodeEnv.buildNodeDependencies (lib.overrideExisting args {
    src = stdenv.mkDerivation {
      name = args.name + "-package-json";
      src = nix-gitignore.gitignoreSourcePure [
        "*"
        "!package.json"
        "!package-lock.json"
      ] args.src;
      dontBuild = true;
      installPhase = "mkdir -p $out; cp -r ./* $out;";
    };
  });
}