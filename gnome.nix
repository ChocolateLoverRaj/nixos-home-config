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

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      clock-format = "12h";
      clock-show-weekday = true;
    };
    "org/gnome/mutter" = {
      edge-tiling = true;
      dynamic-workspaces = true;
      experimental-features = [
        "variable-refresh-rate"
        "scale-monitor-framebuffer"
      ];
    };
  };
}
