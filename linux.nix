{ config, pkgs, ... }:
{
  home = {
    username = "alpha";
    homeDirectory = "/home/alpha";

    packages = with pkgs; [
      iotop
      nethogs
    ];
  };

  targets.genericLinux.enable = true;
  fonts.fontconfig.enable = true;
  xdg.enable = true;

  programs.aria2.systemd.enable = true;
}
