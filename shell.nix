{ pkgs ? import <nixpkgs> { } }:
let
  playDeep = pkgs.writeScriptBin "playdeep" ''
    play -n synth brownnoise synth pinknoise mix loudness -20
  '';
  playPink = pkgs.writeScriptBin "playpink" ''
    play -t sl -r48000 -c2 -n synth -1 pinknoise .1 60 loudness -10
  '';
in pkgs.mkShell {
  name = "reviewapps";
  buildInputs = with pkgs; [ sox playDeep playPink ];
  shellHook = "";
}
