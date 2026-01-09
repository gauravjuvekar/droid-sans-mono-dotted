{
  description = "DroidSans Mono Dotted and Slashed Nerd Font";

  inputs =
    {
      flake-utils.url = "github:numtide/flake-utils";
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        droid-sans-func = import ./default.nix;
        droid-sans-dotted-package = (droid-sans-func "Dotted" {pkgs=pkgs;});
        droid-sans-slashed-package = (droid-sans-func "Slashed" {pkgs=pkgs;});
      in
        {
          packages = rec {
            droid-sans-mono-dotted-nerdfont = droid-sans-dotted-package;
            droid-sans-mono-slashed-nerdfont = droid-sans-slashed-package;
          };
        }
    );
}
