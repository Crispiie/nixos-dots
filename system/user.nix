{ pkgs, ... }:
{
  users.users.crispi = {
    isNormalUser = true;
    group = "crispi";  # Set primary group to crispi
    description = "crispi";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };

  users.groups.crispi = {};  # Ensure the group exists
}
