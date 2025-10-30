{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ptyxis
    dconf-editor
    networkmanagerapplet
  ];

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
      # {
      #   package = gsconnect;
      # }
      {
        package = caffeine;
      }
      {
        package = tailscale-qs;
      }
      {
        package = appindicator;
      }
      {
        package = lock-keys;
      }
      {
        package = custom-osd;
      }
      {
        package = happy-appy-hotkey;
      }
      {
        package = blur-my-shell;
      }
      {
        package = quick-settings-tweaker;
      }
      {
        package = gnome-40-ui-improvements;
      }
    ];
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      clock-format = "12h";
      clock-show-weekday = true;
      clock-show-seconds = true;
      # Gamers don't need animations. They don't get disoriented when their actions cause sudden  changes to what's on the screen.
      enable-animations = false;
    };
    "org/gnome/desktop/screensaver" = {
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/map-l.svg";
      primary-color = "#241f31";
      secondary-color = "#000000";
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      natural-scroll = false;
    };
    "org/gnome/desktop/datetime" = {
      automatic-timezone = true;
    };
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "org.gnome.Ptyxis.desktop"
        "dev.zed.Zed.desktop"
        "org.gnome.Nautilus.desktop"
        "io.github.Qalculate.qalculate-qt.desktop"
      ];
    };
    "org/gnome/shell/keybindings" = {
      toggle-message-tray = [ ];
    };
    "org/gnome/shell/extensions/vitals" = {
      show-battery = true;
      show-gpu = true;
      update-time = 5;
      hot-sensors = [
        "_battery_rate_"
      ];
      position-in-panel = 2;
    };
    "org/gnome/shell/extensions/clipboard-indicator" = {
      toggle-menu = [ "<Super>v" ];
      history-size = 10000;
    };
    "org/gnome/mutter" = {
      edge-tiling = true;
      dynamic-workspaces = true;
      experimental-features = [
        "variable-refresh-rate"
        "scale-monitor-framebuffer"
      ];
    };
    "org/gnome/Ptyxis" = {
      cursor-shape = "ibeam";
    };
    "org/gnome/Ptyxis/Shortcuts" = {
      copy-clipboard = "<Control>c";
      paste-clipboard = "<Control>v";
      move-next-tab = "<Control>Tab";
      move-previous-tab = "<Shift><Control>Tab";
      close-tab = "<Control>w";
      search = "<Control>f";
      new-tab = "<Control>t";
      new-window = "<Control>n";
    };
    "org/gnome/nautilus/preferences" = {
      search-filter-time-type = "last_modified";
    };
    "org/gnome/shell/extensions/lockkeys" = {
      notification-preferences = "osd";
      style = "show-hide-capslock";
    };
  };
}
