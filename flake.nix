{
  description = "Resume for KireinaHoro";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs@{ self, nixpkgs, flake-utils }:
  with flake-utils.lib; eachSystem (defaultSystems ++ ["aarch64-darwin"]) (system: let
    pkgs = import nixpkgs { inherit system; };
    tex = (pkgs.texlive.combine {
      inherit (pkgs.texlive) scheme-small
      enumitem xifthen ifmtarg xstring fontawesome6 accsupp
      tcolorbox tikzfill;
    });

    resume = pkgs.stdenvNoCC.mkDerivation {
      name = "kireinahoro-resume";
      src = pkgs.lib.cleanSource ./.;
      FONTCONFIG_FILE = pkgs.makeFontsConf {
        fontDirectories = with pkgs; [ source-sans roboto ];
      };
      buildInputs = with pkgs; [ tex nukeReferences ];
      installPhase = ''
        nuke-refs build/cv.pdf
        mkdir -p $out
        mv build/cv.pdf $out/
      '';
    };
  in {
    packages.default = resume;
  });
}
