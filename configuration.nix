# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }: {

  # Imports
  imports = [ ./hardware-configuration.nix ];

  # # Global system theme 
  stylix = {
    enable = true;
    # base16Scheme =
    # "${pkgs.base16-schemes}/share/themes/horizon-terminal-dark.yaml";
    image = ./img.png;
    homeManagerIntegration.followSystem = false;

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 24;

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 10;
        popups = 10;
      };

    };

    opacity = {
      applications = 1.0;
      terminal = 1.0;
      desktop = 1.0;
      popups = 1.0;
    };

    polarity = "dark";
  };

  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      default = "saved";
    };
    efi = { canTouchEfiVariables = true; };
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Bluetooth
  # hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;

  # Set your time zone and andd compatible with Windows
  time.timeZone = "Europe/Moscow";
  time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # services.xserver.displayManager.startx.enable = false;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us,ru";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable OpenCL
  # important for darktable
  environment.variables = { RUSTICL_ENABLE = "radeonsi"; };
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelParams = [ "radeon.si_support=0" "amdgpu.si_support=1" ];
  # hardware.graphics = {
  #   enable = true;
  #   enable32Bit = true;
  # };
  # hardware.graphics.extraPackages = with pkgs; [
  #   rocmPackages.clr.icd
  #   amdvlk
  # ];
  services.xserver.videoDrivers = [ "amdgpu" ];
  systemd.tmpfiles.rules =
    [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];
  # For 32 bit applications 
  # hardware.graphics.extraPackages32 = with pkgs; [
  #   driversi686Linux.amdvlk
  # ];

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ flatpak ];
  };

  # Allow unfree and experimental packages
  nixpkgs.config = { allowUnfree = true; };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run: nix search wget
  environment.systemPackages = with pkgs; [
    imagemagick
    pavucontrol
    gparted
    htop
    btop
    zsh
    oh-my-zsh
    git
    os-prober
    grub2
    wl-clipboard
    #   # home-manager
    swaylock
    darktable
    lact
    rocmPackages.rpp
    rocmPackages.clr
    microcodeAmd
  ];

  # Other programs and services
  # home-manager.users.user.programs.kitty.settings = {
  #   selection_background = lib.mkForce "#${config.stylix.base16Scheme.base0D}";
  #   # # black
  #   color0 = "#${config.lib.stylix.colors.base0D}";
  #   color8 = "#${config.lib.stylix.colors.base0D}";
  # };

  # Flatpak
  services.flatpak.enable = true;

  # Hyprland
  programs.hyprland.enable = true;

  # AMD GPU
  systemd.services.lactd = {
    description = "AMDGPU Control Daemon";
    enable = true;
    serviceConfig = { ExecStart = "${pkgs.lact}/bin/lact daemon"; };
    wantedBy = [ "multi-user.target" ];
  };

  # Authentication agent
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart =
          "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # screen lock
  security.pam.services.swaylock = { };

  # Battery life
  services.power-profiles-daemon.enable = false; # Disable GNOME service
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      # Helps save long term battery health (auto mode)
      CONSERVATION_MODE = 1;

      # Not supported for my laptop (manual mode)
      # START_CHARGE_THRESH_BAT0 = 70;
      # STOP_CHARGE_THRESH_BAT0 = 85;
      # START_CHARGE_THRESH_BAT1 = 70; 
      # STOP_CHARGE_THRESH_BAT1 = 85; 
    };
  };

  # Auto delete nix trash
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
