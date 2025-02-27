{ ... }:

{
  # Bash and other terminal utilities
  programs.bash = {
    enable = true;
  };

  programs.nushell = {
    enable = true;
  };

  programs.starship = {
    enable = true;
  };

  programs.atuin = {
    enable = true;
    settings = {
      filter_mode_shell_up_key_binding = "session";
    };
  };

  programs.zoxide = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
  };
}
