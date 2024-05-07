{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rajas";
  home.homeDirectory = "/home/rajas";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    ./git.nix
    ./vscode.nix
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    nodejs
    github-desktop
    # Rust
    jetbrains.rust-rover
    rustup
    clang

    git-credential-manager
    parabolic
    element-desktop
    discord
    nixpkgs-fmt
    tldr
    distrobox
    toolbox
    baobab
    mission-center
    eza
    # This looks super duper cool
    btop
    flameshot
    kdePackages.kdenlive
    ungoogled-chromium
    firefox
    libreoffice-qt
    lunar-client
    kdePackages.plasmatube
    # For automatically entering nix dev environments
    direnv

    freetube
    qbittorrent-qt5
    (callPackage ./tabby.nix { })
    brave
    cosmic-term
    cosmic-files
    freecad
    zed-editor
    radicle-cli
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/rajas/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nano";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  programs.plasma = {
    enable = true;

    workspace = {
      theme = "breeze-dark";
      colorScheme = "BreezeDark";
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    shortcuts = {
      "services/tabby.desktop"."_launch" = "Ctrl+Alt+T";
      "services/org.kde.konsole.desktop"."_launch" = [ ];
    };

    configFile = {
      # "kdeglobals"."General"."TerminalApplication".value = "warp-terminal %U";
      "kdeglobals"."General"."TerminalService".value = "tabby.desktop";
      "kcminputrc"."Libinput/1267/12859/ELAN2703:00 04F3:323B Touchpad"."NaturalScroll".value = true;
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true; # see note on other shells below
    nix-direnv.enable = true;
  };

  programs.bash = {
    enable = true;
  };

  programs.atuin = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
  };

  programs.obs-studio = {
    enable = true;
  };
}
