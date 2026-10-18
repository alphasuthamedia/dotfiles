{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.username = "alpha";
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/alpha" else "/home/alpha";
  home.stateVersion = "26.05";

  fonts.fontconfig.enable = true;
  programs.home-manager.enable = true;

  home.packages =
    (with pkgs; [
      bash
      htop
      nerd-fonts.jetbrains-mono
      pinentry-curses
      wget
      jq
      curl
      fastfetch

      neovim
      nixd
      nixfmt
      ripgrep
      fd
      lua-language-server
      stylua
      gcc
      nodejs
    ])
    ++ lib.optionals pkgs.stdenv.isLinux (
      with pkgs;
      [
        (config.lib.nixGL.wrap alacritty)
        (config.lib.nixGL.wrap firefox)
        iotop
        nethogs
      ]
    )
    ++ lib.optionals pkgs.stdenv.isDarwin (
      with pkgs;
      [
        alacritty
        firefox
      ]
    );

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
    mouse = true;
    extraConfig = builtins.readFile ./config/tmux.conf;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.bash.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };

  xdg.enable = true;
  targets.genericLinux.enable = pkgs.stdenv.isLinux;

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/nvim";
  };

  xdg.configFile."alacritty".source = ./config/alacritty;

}
