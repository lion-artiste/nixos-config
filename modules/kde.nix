{ config, pkgs, lib, ... }:

{
    services.xserver = {
        enable = true;
        desktopManager.plasma5.enable = lib.mkForce true;
        displayManager.sddm.enable = lib.mkForce true;
        displayManager.defaultSession = "plasmawayland";
    };

    environment.systemPackages = with pkgs; [
        libsForQt5.qtstyleplugin-kvantum
        libsForQt5.kate
    ];
}