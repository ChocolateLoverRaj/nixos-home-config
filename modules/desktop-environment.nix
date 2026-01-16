{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    element-desktop
    discord
    prismlauncher
    qbittorrent
    mangohud
    mangojuice
    qalculate-qt
    ytdownloader
    # tuba (broken)
    ktailctl
    pinta
    slack
    kicad
    joplin-desktop
  ];
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "discord"
      "slack"
    ];
}
