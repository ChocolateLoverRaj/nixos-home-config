{ ... }:

{
  programs.git = {
    enable = true;
    userName = "Rajas Paranjpe";
    userEmail = "52586855+ChocolateLoverRaj@users.noreply.github.com";

    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
