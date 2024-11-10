{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "droid-sans-mono-dotted-nerd-font";
  srcs =
    [
      ./DroidSansMonoDotted.ttf
    ];
  nativeBuildInputs = [ pkgs.nerd-font-patcher ];

  unpackCmd = ''
    mkdir unpack
    for f in $srcs; do
      cp $f ./unpack/$(stripHash $f)
    done
  '';
  sourceRoot = "unpack";

  buildPhase = ''
    runHook preBuild

    nerd-font-patcher -c --no-progressbars ./DroidSansMonoDotted.ttf

    runHook postBuild
  '';
  installPhase = ''
    runHook preInstall
    install -m444 -Dt $out/share/fonts/truetype ./DroidSansMDottedNerdFont-Regular.ttf

    runHook postInstall
  '';
}
