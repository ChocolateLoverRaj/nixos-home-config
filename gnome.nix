{ pkgs, ... }:

{
  programs.gnome-shell = {
    enable = true;
    extensions = with pkgs.gnomeExtensions; [
      {
        package = vitals;
      }
      {
        package = clipboard-indicator;
      }
      {
        package = battery-time-percentage-compact;
      }
      {
        package = gsconnect;
      }
      {
        package = caffeine;
      }
    ];
  };
}
