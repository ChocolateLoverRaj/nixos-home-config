{ pkgs, ... }:

{
  home.username = "rajas";
  home.homeDirectory = "/home/rajas";
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    settings = {
      user = {
        name = "Rajas Paranjpe";
        email = "52586855+ChocolateLoverRaj@users.noreply.github.com";
      };
      credential.helper = "libsecret";
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
  programs.bash = {
    enable = true;
  };

  programs.nushell = {
    enable = true;
  };

  programs.starship = {
    enable = true;
  };

  programs.atuin = {
    enable = true;
    settings = {
      filter_mode_shell_up_key_binding = "session";
    };
  };

  programs.zoxide = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nano";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Get virt-manager to work
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };
}
