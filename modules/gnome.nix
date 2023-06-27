{ config, pkgs, lib, ... }:

{
    services.xserver = {
        enable = true;
        displayManager.gdm.enable = lib.mkDefault true;
        desktopManager.gnome.enable = lib.mkDefault true;
        excludePackages = [ pkgs.xterm ];
    };
}