slug: { pkgs }:
pkgs.stdenv.mkDerivation {
  name = "droid-sans-mono-${pkgs.lib.strings.toLower slug}-nerd-font";
  srcs =
    [
      ./DroidSansMono${slug}.ttf
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

    nerd-font-patcher -c --no-progressbars ./DroidSansMono${slug}.ttf

    runHook postBuild
  '';
  installPhase = ''
    runHook preInstall
    install -m444 -Dt $out/share/fonts/truetype ./DroidSansM${slug}NerdFont-Regular.ttf

    runHook postInstall
  '';
}
