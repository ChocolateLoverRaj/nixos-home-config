{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        rust-lang.rust-analyzer
        mkhl.direnv
        ms-vscode-remote.remote-ssh
        vadimcn.vscode-lldb
        ms-vscode.hexeditor
        streetsidesoftware.code-spell-checker
        tamasfe.even-better-toml
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
        "terminal.integrated.profiles.linux" = {
          "bash" = null;
        };
        "git.openRepositoryInParentFolders" = "always";
        "explorer.confirmDragAndDrop" = false;
      };
    };
  };
}
