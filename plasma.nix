{ ... }:

{
  programs.plasma = {
    enable = true;

    workspace = {
      theme = "breeze-dark";
      colorScheme = "BreezeDark";
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    # shortcuts = {
    #   "services/tabby.desktop"."_launch" = "Ctrl+Alt+T";
    #   "services/org.kde.konsole.desktop"."_launch" = [ ];
    # };

    # configFile = {
    #   # "kdeglobals"."General"."TerminalApplication".value = "warp-terminal %U";
    #   "kdeglobals"."General"."TerminalService".value = "tabby.desktop";
    #   "kcminputrc"."Libinput/1267/12859/ELAN2703:00 04F3:323B Touchpad"."NaturalScroll".value = true;
    # };
  };
}
