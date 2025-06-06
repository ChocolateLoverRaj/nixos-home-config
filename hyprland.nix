{ inputs, pkgs, ... }:

{
  programs.kitty.enable = true; # required for the default Hyprland config
  wayland.windowManager.hyprland = {
    enable = true; # enable Hyprland
    settings = {
      bind = [ "SUPER" "grave" "hyprexpo:expo" "toggle" ]; # can be: toggle, off/disable or on/enable
      plugins = with inputs.hyprland-plugins.packages.${pkgs.system}; [
        hyprexpo
        hyprtrails
        hyprbars
      ];
      plugin = {
        hyprexpo = {
          columns = 3;
          gap_size = 5;
          bg_col = "rgb(111111)";
          workspace_method = [ "center" "current" ]; # [center/first] [workspace] e.g. first 1 or center m+1
          enable_gesture = true; # laptop touchpad
          gesture_fingers = 3; # 3 or 4
          gesture_distance = 300; # how far is the "max"
          gesture_positive = true; # positive = swipe down. Negative = swipe up.
        };
      };
    };
  };
}
