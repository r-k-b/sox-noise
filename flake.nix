{
  description = "Play a mix of pink and brown noise";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        inherit (pkgs) lib callPackage;

        playdeep = pkgs.writeScriptBin "playdeep" ''
          ${pkgs.sox}/bin/play -n synth brownnoise synth pinknoise mix loudness -20
        '';

        playpink = pkgs.writeScriptBin "playpink" ''
          ${pkgs.sox}/bin/play -t sl -r48000 -c2 -n synth -1 pinknoise .1 60 loudness -10
        '';

      in {
        devShell = import ./shell.nix { inherit pkgs; };
        packages = { inherit playdeep playpink; };
      });
}
