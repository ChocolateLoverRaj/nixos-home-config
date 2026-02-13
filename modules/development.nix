{ pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true; # see note on other shells below
    nix-direnv.enable = true;
  };
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    profiles.default = {
      extensions =
        with pkgs.vscode-extensions;
        [
          jnoortheen.nix-ide
          rust-lang.rust-analyzer
          mkhl.direnv
          vadimcn.vscode-lldb
          ms-vscode.hexeditor
          streetsidesoftware.code-spell-checker
          tamasfe.even-better-toml
          gruntfuggly.todo-tree
          a5huynh.vscode-ron
          marp-team.marp-vscode
          ms-python.python
          shd101wyy.markdown-preview-enhanced
          vscodevim.vim
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "graphviz-preview";
            publisher = "EFanZh";
            version = "1.7.5";
            hash = "sha256-SYYWfVMEjwBWXLcFp8rDmqhXCef7ixrrxpdcybJXLGg=";
          }
          {
            name = "probe-rs-debugger";
            publisher = "probe-rs";
            version = "0.24.2";
            hash = "sha256-1Gs5D5was/ZOZQrVD3/UiRm5bb12vGIl60AZV2EnazQ=";
          }
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
        "tabnine.experimentalAutoImports" = true;
        "git.enableSmartCommit" = true;
        "rust-analyzer.procMacro.attributes.enable" = true;
        "git.allowForcePush" = true;
        "terminal.integrated.profiles.linux" = {
          "bash" = null;
        };
        "git.openRepositoryInParentFolders" = "always";
        "explorer.confirmDragAndDrop" = false;
        "git.blame.statusBarItem.enabled" = true;
        "git.blame.editorDecoration.enabled" = true;
        "redhat.telemetry.enabled" = false;
        "workbench.editor.wrapTabs" = true;
        "workbench.secondarySideBar.defaultVisibility" = "hidden";
        "vim.handleKeys" = {
          "<C-space>" = false;
        };
      };
    };
  };
  programs.zed-editor = {
    enable = true;
    installRemoteServer = true;
  };
  home.packages = with pkgs; [
    # For Java development
    jdk
    python3
    # As a calculator
    nodejs
    # To edit .nix files
    nixfmt
    nixd
    nil
    # To use containers
    distrobox
    sshfs
    tokei
    # To make wiring diagrams
    # fritzing
    # For using signal analyzers
    pulseview
  ];
}
