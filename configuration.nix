# NixOS manual accessible by running ‘nixos-help’.
{ config, pkgs, lib, inputs, ... }: {

  # Imports
  imports = [ ./hardware-configuration.nix ];

  # --------------------------------
  # SYSTEM THEME 
  # --------------------------------

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ashes.yaml";
    image = config.lib.stylix.pixel "base00";

    homeManagerIntegration.followSystem = false;
    targets.grub.enable = false;

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 18;

    fonts = {
      monospace = {
        package = pkgs.nerdfonts;
        name = "GeistMono Nerd Font Mono";
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
        applications = 14;
        terminal = 14;
        desktop = 14;
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

  # TTYI colors
  console = with config.lib.stylix.colors; {
    # font = "monospace 32";
    colors = lib.mkForce [
      "000000" # background
      "${base08}" # red
      "${base0B}" # green
      "${base0A}" # yellow
      "${base0D}" # blue
      "${base0E}" # magenta
      "${base0C}" # cyan
      "${base05}" # base05
      "${base03}" # base03
      "${base08}" # red
      "${base0B}" # green
      "${base0A}" # yellow
      "${base0D}" # blue
      "${base0E}" # magenta
      "${base0C}" # cyan
      "${base06}" # base06
    ];
  };

  # --------------------------------
  # ENVIRONMENTS 
  # --------------------------------

  # proxy for any program: proxychains [program]
  environment.etc."proxychains.conf".text =
    "\n    strict_chain\n    proxy_dns \n    remote_dns_subnet 224\n    tcp_read_time_out 15000\n    tcp_connect_time_out 8000\n    localnet 127.0.0.0/255.0.0.0\n\n    [ProxyList]\n    socks5   127.0.0.1 10808 \n  ";

  environment.variables = {
    # Enable OpenCL
    RUSTICL_ENABLE = "radeonsi";
    EDITOR = "nvim";
    SYSTEMD_EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Optional, hint electron apps to use wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # --------------------------------
  # NETWORK, BlUETOOTH, SOUND, PRINT, TIMEZONE
  # --------------------------------

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # hardware.bluetooth.enable = true;

  hardware.bluetooth.powerOnBoot = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable scanner
  hardware.sane.enable = true; # enables support for scanners
  hardware.sane.extraBackends = [ pkgs.sane-airscan ];
  services.udev.packages = [ pkgs.sane-airscan ];

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  # rtkit is optional but recommended for pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

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

  # --------------------------------
  # DE, USER
  # --------------------------------

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    displayManager.startx.enable = true;
    windowManager.fvwm2.gestures = true;

    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # Configure keymap in X11
    xkb.layout = "us,ru";
    xkb.variant = "";
  };

  programs.hyprland.enable = true;

  users.users.user = {
    isNormalUser = true;
    description = "user";
    # Users in the scanner group will gain access to the scanner, or the lp group if it’s also a printer.
    extraGroups = [ "networkmanager" "wheel" "input" "scanner" "lp" ];
    packages = with pkgs; [ flatpak ];
  };

  # --------------------------------
  # NIX SETTING 
  # --------------------------------

  nixpkgs.config = { allowUnfree = true; };
  nix = {
    # Allow unfree and experimental packages
    settings.experimental-features = [ "nix-command" "flakes" ];
    # Auto delete nix trash
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true;
    settings.auto-optimise-store = true;
  };

  # --------------------------------
  # SYSTEM PACKAGES
  # --------------------------------

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
    unstable.steam-run
    zlib
    unstable.patchelfUnstable
    jdk

    # VPN
    xray
    proxychains # run any program with xray proxy
    # nekoray # GUI client

    # -- QTILE --
    kanshi # monitor config tool for qtile
    mypy # check code errors for qtile check

    # gestures for qtile:
    wmctrl
    libinput
    libinput-gestures
    xdotool

  ];

  systemd.packages = with pkgs; [ lact ];

  # --------------------------------
  # SECURITY 
  # --------------------------------

  security = {
    # authentication support
    polkit.enable = true;
    # screen lock
    pam.services.swaylock = { };
  };

  # --------------------------------
  # OTHER SERVICES
  # --------------------------------

  services = {

    # gestures
    libinput.enable = true;

    # Flatpak
    flatpak.enable = true;

    # Disable GNOME power service
    power-profiles-daemon.enable = false;

    # Battery life / TLP
    tlp = {
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
        CPU_MAX_PERF_ON_BAT = 40;

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
        # START_CHARGE_THRESH_BAT0 = 0;
        # STOP_CHARGE_THRESH_BAT0 = 1; 

        # Not supported for my laptop (manual mode)
        START_CHARGE_THRESH_BAT0 = 70;
        STOP_CHARGE_THRESH_BAT0 = 85;
        START_CHARGE_THRESH_BAT1 = 70;
        STOP_CHARGE_THRESH_BAT1 = 85;
      };
    };

    # xRay 
    xray = {
      enable = true;
      settingsFile = "/etc/xray/config.json";
    };

    # Enable the OpenSSH daemon.
    openssh.enable = true;

  }; # close services

  systemd = {
    # AMD ROCM driver
    tmpfiles.rules =
      [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];

    services.lactd = {
      description = "AMDGPU Control Daemon";
      enable = true;
      # disable autostart 
      wantedBy = lib.mkForce [ ];
      # wantedBy = [ "multi-user.target" ];
    };

    # disable autostart Xray
    services.xray.wantedBy = lib.mkForce [ ];

    # User service authentication agent
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

    user.services = {
      set-display-rotation = {
        description = "Set display rotation before GDM starts";
        after = [ "gdm.service" ];
        wantedBy = [ "gdm.service" ];
        serviceConfig = {
          ExecStart =
            "${pkgs.dbus}/bin/dbus-send --print-reply --dest=org.gnome.SettingsDaemon /org/gnome/SettingsDaemon/Plugins/Rotation org.gnome.SettingsDaemon.Plugins.Rotation.SetRotation string:'left'"; # Замените 'left' на нужное значение
          Type = "oneshot";
          RemainAfterExit = true;
        };
      };
    };

    services.set-display-rotation.enable = true;

  };

  # --------------------------------
  # OTHER PROGRAMS 
  # --------------------------------

  programs = {
    # run bin files
    nix-ld = {
      enable = true;
      libraries = with pkgs;
        [
          zlib
          # ...
        ];
    };
  };

  # --------------------------------
  # OTHER HARDWARE
  # --------------------------------

  # opencl / graphics acceleration
  hardware.graphics = {
    extraPackages = with pkgs; [ rocmPackages.clr.icd amdvlk ];
    extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];

    enable = true;
  };

  # --------------------------------
  # BOOT 
  # --------------------------------

  boot = {
    initrd.kernelModules = [ "amdgpu" ];
    kernelParams =
      [ "radeon.si_support=0" "amdgpu.si_support=1" "boot.shell_on_fail" ];
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

  # --------------------------------
  # OTHER STUFF 
  # --------------------------------

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
