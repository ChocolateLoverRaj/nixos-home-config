{ pkgs, ... }:
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
}
