{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      rust-lang.rust-analyzer
      mkhl.direnv
      ms-vscode.cpptools-extension-pack
      ms-vscode-remote.remote-ssh
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
      "git.allowForcePush" = true;
    };
  };
}
