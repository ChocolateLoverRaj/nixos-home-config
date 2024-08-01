{ ... }:

{
  programs.plasma = {
    enable = true;

    workspace = {
      theme = "breeze-dark";
    };

    powerdevil = {
      AC = {
        powerButtonAction = "sleep";
      };
      battery = {
        powerButtonAction = "sleep";
      };
    };
  };
}
