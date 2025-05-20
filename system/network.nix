{ ... }:
{
  # Networking setup
  networking.hostName = "crispi-nixos";
  networking.firewall.enable = true;
  networking.firewall = {
    allowedTCPPorts = [ 22 53 ];
    allowedUDPPorts = [ 53 51820 ];
    };
  networking.networkmanager.enable = true;
}
