{ config, pkgs, ... }:
  let
    progs = [ 
    "bat" 
    "btop" 
    "mpv" 
    "cava" 
    ];
  in
  {
    programs = builtins.listToAttrs (map (p: { name = p; value = { enable = true; }; }) progs);
}
