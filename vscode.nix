{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      tabnine.tabnine-vscode
      rust-lang.rust-analyzer
      mkhl.direnv
    ];
    keybindings = [
      {
        key = "ctrl+t";
        command = "explorer.newFile";
      }
    ];
    userSettings = {
      "editor.formatOnSave" = true;
      "git.autofetch" = true;
      "git.confirmSync" = false;
      "workbench.editor.wrapTabs" = true;
      "tabnine.experimentalAutoImports" = true;
      "git.enableSmartCommit" = true;
      "rust-analyzer.procMacro.attributes.enable" = true;
    };
  };
}