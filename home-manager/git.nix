{ ... }:
{
  programs.git = {
    enable = true;
    userName = "crispi";
    userEmail = "austinbunn1@icloud.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
