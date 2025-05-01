{
  config,
  pkgs,
  lib,
  ...
}:

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
    ./vscodium.nix
    ./plasma.nix
    ./bash.nix
    ./gnome.nix
    #./nextcloud.nix
    ./direnv.nix
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    nodejs
    # github-desktop
    # parabolic
    element-desktop
    # fractal
    discord
    nixpkgs-fmt
    nixfmt-rfc-style
    tldr
    distrobox
    # toolbox
    baobab
    # mission-center
    eza
    # This looks super duper cool
    btop
    # flameshot
    # kdePackages.kdenlive
    # ungoogled-chromium
    firefox
    libreoffice-qt
    # lunar-client
    kdePackages.plasmatube
    # For automatically entering nix dev environments
    prismlauncher
    # freetube
    qbittorrent
    # (callPackage ./tabby.nix { })
    brave
    # freecad
    zed-editor
    # radicle-node
    # gh
    # kdePackages.kasts
    # mindustry-wayland
    # kdePackages.kcalc
    # jetbrains.rust-rover
    # jetbrains.gateway
    # hoppscotch
    # fritzing
    # librepcb
    mangohud
    # kicad
    jdk
    # spacedrive
    # git-credential-manager
    sshfs
    qalculate-qt
    nixd
    nil
    rclone
    rclone-browser
    ytdownloader
    # networkmanagerapplet
    # thunderbird
    tuba
    ktailctl
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

  # Allow some unfree packages
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "vscode-extension-ms-vscode-remote-remote-ssh"
      "discord"
      "lunarclient"
      "rust-rover"
      "gateway"
    ];

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  # programs.obs-studio = {
  #   enable = true;
  # };
}
