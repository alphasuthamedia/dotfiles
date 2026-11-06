{ config, lib, pkgs, ... }:
let
  dotfiles = "/home/alpha/dotfiles";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${path}";
in
{
  nixpkgs.config.allowUnfree = true;

  home = {
    username = "alpha";
    homeDirectory = "/home/alpha";
    stateVersion = "26.05";

    packages = with pkgs; [
      htop
      iotop
      nethogs
      fastfetch

      wget
      curl
      jq
      ripgrep

      neovim
      nixd
      nixfmt
      lua-language-server
      stylua
      gcc
      nodejs

      lens
      terraform
      kubectl
      (google-cloud-sdk.withExtraComponents [
        google-cloud-sdk.components.gke-gcloud-auth-plugin
      ])

      nerd-fonts.jetbrains-mono
    ];

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      USE_GKE_GCLOUD_AUTH_PLUGIN = "True";
    };

    shellAliases = {
      vi = "nvim";
      vim = "nvim";
      k = "kubectl";
    };
  };

  fonts.fontconfig.enable = true;
  targets.genericLinux.enable = true;

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      lfs.enable = true;
      ignores = [ ".DS_Store" ];
      signing = {
        key = "189710A9F3ED18E110296F94B4C990B982D2E33E";
        format = "openpgp";
        signByDefault = true;
      };
      settings = {
        user.name = "alphasm";
        user.email = "alphasuthamedia@gmail.com";
        init.defaultBranch = "master";
        pull.rebase = false;
      };
    };

    gpg.enable = true;

    bash = {
      enable = true;
      enableCompletion = true;
      historySize = -1;
      historyFileSize = -1;
      historyControl = [ "erasedups" ];
    };

    starship.enable = true;
    zoxide.enable = true;

    fzf = {
      enable = true;
      enableBashIntegration = true; # termasuk Ctrl+R
      fileWidgetCommand = "fd --type f"; # Ctrl+T
      changeDirWidgetCommand = "fd --type d"; # Alt+C
    };

    fd = {
      enable = true;
      hidden = true;
    };

    tmux.enable = true;

    alacritty = {
      enable = true;
      package = config.lib.nixGL.wrap pkgs.alacritty;
      settings.font.normal.family = "JetBrainsMono Nerd Font";
    };

    aria2 = {
      enable = true;
      systemd.enable = true;
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentry.package = pkgs.pinentry-curses;
  };

  xdg = {
    enable = true;
    configFile."nvim".source = link "config/nvim";
  };
}
