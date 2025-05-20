{ ... }:

 
{
  fileSystems."/mnt/windows-share" = {
  device = "/dev/disk/by-uuid/4A7E8A2D7E8A11BD";
  fsType = "ntfs3";
  options = [ "uid=1000" "gid=100" "umask=0022" ];
  };
}
