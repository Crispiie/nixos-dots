{ pkgs, ... }:
{
  # Enable SDDM (Display Manager)
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.package = pkgs.kdePackages.sddm;
}
