{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home = {
    stateVersion = "26.05";

    packages = with pkgs; [
      htop
      fastfetch

      wget
      curl
      jq
      ripgrep

      gcc
      nodejs
      stow

      terraform
      kubectl
      (google-cloud-sdk.withExtraComponents [
        google-cloud-sdk.components.gke-gcloud-auth-plugin
      ])

      nerd-fonts.jetbrains-mono
    ];

    sessionVariables = {
      USE_GKE_GCLOUD_AUTH_PLUGIN = "True";
    };

    shellAliases = {
      k = "kubectl";
    };
  };

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
      settings.font.normal.family = "JetBrainsMono Nerd Font";
    };

    aria2.enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentry.package = pkgs.pinentry-curses;
  };
}
