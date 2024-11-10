{
  description = "DroidSans Mono Dotted 0 Nerd Font";

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
        droid-sans-package = (droid-sans-func {pkgs=pkgs;});
      in
        {
          packages = rec {
            droid-sans-mono-dotted-nerdfont = droid-sans-package;
            default = droid-sans-mono-dotted-nerdfont;
          };
        }
    );
}
