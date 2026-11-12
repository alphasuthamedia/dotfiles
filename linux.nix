{ config, pkgs, nixgl, ... }:
{
  home = {
    username = "alpha";
    homeDirectory = "/home/alpha";

    packages = with pkgs; [
      iotop
      nethogs
      seadrive-gui
      lens
    ];
  };

  targets.genericLinux.enable = true;
  targets.genericLinux.nixGL.packages = nixgl.packages;
  fonts.fontconfig.enable = true;
  xdg.enable = true;

  programs = {
    alacritty.package = config.lib.nixGL.wrap pkgs.alacritty;
    aria2.systemd.enable = true;
  };
}
