{ pkgs ? import <nixpkgs> { } playdeep playpink }:

pkgs.mkShell {
  name = "reviewapps";
  buildInputs = with pkgs; [ sox playdeep playpink ];
  shellHook = "";
}
