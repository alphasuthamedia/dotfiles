{ config, pkgs, ... }: {
  home.username = "alpha";
  home.homeDirectory = "/home/alpha";
  home.stateVersion = "26.05";

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    neovim
    fd
    ripgrep
    nixfmt
    nixd
    htop
    (config.lib.nixGL.wrap alacritty)
    nerd-fonts.jetbrains-mono
    pinentry-curses
    (config.lib.nixGL.wrap firefox)
    iotop
    nethogs
  ];

  home.sessionVariables.EDITOR = "nvim";

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
  services.gpg-agent.enable = true;

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

  xdg.enable = true;
  targets.genericLinux.enable = true;

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/nvim";
  xdg.configFile."alacritty".source = ./config/alacritty;
}
