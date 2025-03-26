{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "Rajas Paranjpe";
    userEmail = "52586855+ChocolateLoverRaj@users.noreply.github.com";

    extraConfig = {
      credential.helper = "libsecret";
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
