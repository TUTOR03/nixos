{ pkgs, ... }:

let
  launch-walker = pkgs.writeShellScriptBin "launch-walker"
    (builtins.readFile ./launch-walker.sh);
in
{
  home.packages = with pkgs; [
    launch-walker
  ];
}
