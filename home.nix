{ config, pkgs, ... }: {
  home.username = "alpha";
  home.homeDirectory = "/home/alpha";
  home.stateVersion = "26.05";

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    htop
    (config.lib.nixGL.wrap alacritty)
    nerd-fonts.jetbrains-mono
    pinentry-curses
    (config.lib.nixGL.wrap firefox)
    iotop
    nethogs
    wget
    jq
    curl
    fastfetch

    # discord
    # (writeShellScriptBin "discord-1" ''
    #   exec ${discord}/bin/discord \
    #     --user-data-dir="$HOME/.local/share/discord-1" \
    #     "$@"
    # '')
    # (writeShellScriptBin "discord-2" ''
    #   exec ${discord}/bin/discord \
    #     --user-data-dir="$HOME/.local/share/discord-2" \
    #     "$@"
    # '')
  ];

  programs.aria2 = {
    enable = true;
    systemd.enable = true;
  };
  programs.fd = {
    enable = true;
    hidden = true;
  };

  programs.git = {
    enable = true;
    signing = {
      key = "189710A9F3ED18E110296F94B4C990B982D2E33E"; # key ID atau fingerprint lengkap
      format = "openpgp";
      signByDefault = true;
    };
    settings = {
      user.name = "alphasm";
      user.email = "alphasuthamedia@gmail.com";
      init.defaultBranch = "master";
      pull.rebase = false;
      lfs.enable = true;
    };
    ignores = [ ".DS_Store" ];
  };

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    enableBashIntegration = true;
    enableSshSupport = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    historySize = -1;
    historyFileSize = -1;
    historyControl = [ "erasedups" ];
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true; # termasuk Ctrls + r
    fileWidgetCommand = "fd --type f"; # Ctrl+T
    changeDirWidgetCommand = "fd --type d"; # Alt+C
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./config/tmux.conf;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      nixd
      nixfmt
      ripgrep
      fd
      lua-language-server
      stylua
      gcc
      nodejs
    ];
  };

  xdg.enable = true;
  targets.genericLinux.enable = true;
  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/alpha/dotfiles/config/nvim";
    recursive = false;
  };

  xdg.configFile."alacritty".source = ./config/alacritty;

}
