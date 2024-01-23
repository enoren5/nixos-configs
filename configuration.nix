{ config, pkgs, ... }:

{
  imports = [ <nixpkgs/nixos/modules/installer/virtualbox-demo.nix> ];
  
  # nix.settings.experimental-features = [ "nix-command" "flakes" ];  

  nixpkgs.config.allowUnfree = true; 

  environment.systemPackages = with pkgs; [
    # ... other packages ...
    google-chrome
    # thunar
    vscode
    qbittorrent
    chromium
    libreoffice
    python312
    # anaconda
    sway
    # i3
    xdg-desktop-portal-hyprland    
    vim
    git
  ];

#   services.xserver = {
#     enable = true;   
#     desktopManager = {
#       xterm.enable = false;
#       xfce = {
#         enable = true;
#         noDesktop = true;
#         enableXfwm = false;
#       };
#    };
#    displayManager.defaultSession = "xfce";
#   };

   programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;

    # Optional
    # Whether to enable patching wlroots for better Nvidia support
    # enableNvidiaPatches = true;
  };

# Let demo build as a trusted user.
# nix.settings.trusted-users = [ "demo" ];

# Mount a VirtualBox shared folder.
# This is configurable in the VirtualBox menu at
# Machine / Settings / Shared Folders.
# fileSystems."/mnt" = {
#   fsType = "vboxsf";
#   device = "nameofdevicetomount";
#   options = [ "rw" ];
# };

# By default, the NixOS VirtualBox demo image includes SDDM and Plasma.
# If you prefer another desktop manager or display manager, you may want
# to disable the default.
# services.xserver.desktopManager.plasma5.enable = lib.mkForce false;
# services.xserver.displayManager.sddm.enable = lib.mkForce false;

# Enable GDM/GNOME by uncommenting above two lines and two lines below.
# services.xserver.displayManager.gdm.enable = true;
# services.xserver.desktopManager.gnome.enable = true;

# Set your time zone.
# time.timeZone = "Europe/Amsterdam";

# List packages installed in system profile. To search, run:
# \$ nix search wget
# environment.systemPackages = with pkgs; [
#   wget vim
# ];

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

}
