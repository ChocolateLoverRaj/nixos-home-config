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
    initExtra = ''
      # Press F5 to instantly execute the previous command
      bind '"\e[15~": "!!\n"'
    '';
    shellAliases = {
      f = "pay-respects";
    };
  };

  programs.starship = {
    enable = true;
  };

  programs.atuin = {
    enable = true;
    settings = {
      filter_mode_shell_up_key_binding = "session";
      enter_accept = true;
    };
  };

  programs.zoxide = {
    enable = true;
  };

  programs.pay-respects = {
    enable = true;
    enableBashIntegration = true;
  };

  home.sessionVariables = {
    EDITOR = "vim";
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

  programs.vim.enable = true;
}
