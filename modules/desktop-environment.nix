{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    element-desktop
    discord
    prismlauncher
    qbittorrent
    mangohud
    qalculate-qt
    ytdownloader
    tuba
    ktailctl
    pinta
  ];
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "discord"
    ];
}
