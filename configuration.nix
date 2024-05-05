{ config, pkgs, lib, ... }:

{
  imports = [ <nixpkgs/nixos/modules/installer/virtualbox-demo.nix> ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];  

  nixpkgs.config.allowUnfree = true; 
	  # Hyprland

  # Next six lines courtesy of Jennifer Darlene on 22 Jan 2024 to get basic Hyprland working
  programs.hyprland = {
    enable = true;
    xwayland.enable = true; # allow x11 applications
  };
  programs.sway.enable = true;
  console.useXkbConfig = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  environment.systemPackages = with pkgs; [
    # ... other packages ...
    pfetch
    screenfetch
    blesh
    tig
    nix-output-monitor
    starship
    nerdfonts
    google-chrome
    # thunar
    atuin
    curl
    wget
    vscode
    qbittorrent
    chromium
    libreoffice
    python312
    # anaconda
    # sway
    # i3
    xdg-desktop-portal-hyprland    
    vim
    git
    gedit
    # gnome-terminal
    
    neofetch
    nnn # terminal file manager
    eza
    
    # archives
    zip
    xz
    unzip
    p7zip
    findutils
    mlocate
    cowsay

    # Next ten lines courtest of Jennifer Darlene on 22 Jan 2024 to get basic Hyprland working
    waybar # status bar
    mako # notification daemon
    libnotify # for mako
    swww # wallpaper daemon
    kitty # terminal
    rofi-wayland # wl equiv of rofi app launcher, window switcher ...
    networkmanagerapplet # tray applet for network manager -- nm-applet
    grim # screenshot utility
    grimblast # grim helper
    udiskie # automount removable media

  ];

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    gedit # text editor
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

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

fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
];

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
services.xserver.desktopManager.plasma5.enable = lib.mkForce false;
services.xserver.displayManager.sddm.enable = lib.mkForce false;

# Enable GDM/GNOME by uncommenting above two lines and two lines below.
services.xserver.displayManager.gdm.enable = true;
services.xserver.desktopManager.gnome.enable = true;

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

