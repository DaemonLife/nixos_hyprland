# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }: {

  # Imports
  imports = [ 
    ./hardware-configuration.nix
    ];

  # ----------------------------------------------------------------------------
  # Global system theme 
  # ----------------------------------------------------------------------------
  stylix = {
    enable = true;
    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/onedark.yaml";
    image = ./image.jpg;
    homeManagerIntegration.followSystem = false;

    targets.grub.enable = false;
    
    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 24;

    fonts = {
      monospace = {
        package = pkgs.nerdfonts;
        name = "GeistMono";
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
        desktop = 12;
        popups = 12;
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

  # Enable OpenCL
  # important for darktable
  environment.variables = {
    RUSTICL_ENABLE = "radeonsi";
    EDITOR = "nvim";
    SYSTEMD_EDITOR = "nvim";
    VISUAL = "nvim";
  };
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];
  systemd.tmpfiles.rules =
    [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];

  # For 32 bit applications 
  hardware.opengl.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];


  boot = {
    kernelParams = [
      "radeon.si_support=0"
      "amdgpu.si_support=1"
      "boot.shell_on_fail"
    ];
  };

  console = with config.lib.stylix.colors; {
    colors = lib.mkForce [
      "000000"          # background
      "${base08}"       # red
      "${base0B}"       # green
      "${base0A}"       # yellow
      "${base0D}"       # blue
      "${base0E}"       # magenta
      "${base0C}"       # cyan
      "${base05}"       # base05
      "${base03}"       # base03
      "${base08}"       # red
      "${base0B}"       # green
      "${base0A}"       # yellow
      "${base0D}"       # blue
      "${base0E}"       # magenta
      "${base0C}"       # cyan
      "${base06}"       # base06
    ];
  };

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      default = "saved";
      # font = lib.mkForce "${pkgs.hack-font}/share/fonts/hack/Hack-Regular.ttf";
      # fontSize = 36;
      # backgroundColor = lib.mkForce "#000000";
      splashImage = lib.mkForce null;
      theme = lib.mkForce null;
      gfxmodeEfi = "640x480";
      gfxmodeBios = "640x480";
      gfxpayloadBios = "640x480";
      gfxpayloadEfi = "640x480";
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
  # TTY start - true
  services.xserver.displayManager.startx.enable = true;

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

  # ----------------------------------------------------------------------------
  # List packages installed in system profile. To search, run: nix search wget
  # ----------------------------------------------------------------------------
  environment.systemPackages = with pkgs; [
    imagemagick
    pavucontrol
    gparted
    htop
    zsh
    oh-my-zsh
    git
    os-prober
    grub2
    wl-clipboard
    swaylock
    darktable
    lact # gui for amd gpu
    unstable.rocmPackages.rpp
    unstable.rocmPackages.clr
    unstable.microcodeAmd
    ntfs3g # ntfs support
    clinfo # for opencl
    unstable.gthumb # image viewer
    unstable.steam-run
    unstable.xorg.xcbutilwm
    unstable.xorg.libxcb
    nh # nix cli helper
    unstable.rtorrent # tui torrent cloent
    unstable.lutris # emulator
    unstable.winetricks
    unstable.wineWowPackages.waylandFull
    unstable.wineWow64Packages.waylandFull
    unstable.wine-wayland
    unstable.wine
    unstable.wine64
    unstable.amdvlk # amd Vulkan driver for emulator 
    unstable.mesa
    vimix-icon-theme
    overskride # bluetooth gui
    unstable.imv # cli image viewer 
  ];

  # ----------------------------------------------------------------------------
  # Other programs and services
  # ----------------------------------------------------------------------------
  
  # Flatpak
  services.flatpak.enable = true;

  # Hyprland
  programs.hyprland.enable = true;

  # AMD GPU
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd = {
    description = "AMDGPU Control Daemon";
    enable = true;
    wantedBy = [ "multi-user.target" ];
  };
  # opencl
  hardware.opengl.extraPackages = with pkgs; [
    rocmPackages.clr.icd
    amdvlk
  ];
  # graphics acceleration
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
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
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      CPU_BOOST_ON_AC = "1";
      CPU_BOOST_ON_BAT = "0";

      # Savings are made at the expense of color balance
      # 0 - off, 4 - max. 
      AMDGPU_ABM_LEVEL_ON_AC = "0";
      AMDGPU_ABM_LEVEL_ON_BAT = "3";

      # Controls runtime power management for PCIe devices (Fan).
      RUNTIME_PM_ON_AC = "auto";
      RUNTIME_PM_ON_BAT = "auto";

      # Helps save long term battery health (auto mode)
      CONSERVATION_MODE = 1;
      TLP_DEFAULT_MODE = "conservation";
      # Only for Lenovo non-ThinkPad series
      START_CHARGE_THRESH_BAT0 = 0;
      STOP_CHARGE_THRESH_BAT0 = 1; 

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
