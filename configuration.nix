{ config, pkgs, lib, inputs, ... }: {

  # --------------------------------
  # SYSTEM THEME 
  # --------------------------------

  imports = [ ./modules/stylix.nix ];

  # TTYI colors
  console = with config.lib.stylix.colors; {
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

  environment = {
    variables = {
      EDITOR = "hx";
      SYSTEMD_EDITOR = "hx";
      VISUAL = "hx";
    };
    # Proxy for any program: proxychains [PROGRAM]
    etc."proxychains.conf".text = ''
      strict_chain
      proxy_dns
      remote_dns_subnet 224
      tcp_read_time_out 15000
      tcp_connect_time_out 8000
      localnet 127.0.0.0/255.0.0.0

      [ProxyList]
      socks5   127.0.0.1 10808
    '';
  };

  # --------------------------------
  # NETWORK, BlUETOOTH, SOUND, PRINT, TIMEZONE
  # --------------------------------

  # Network
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;

  # NixOS power management tool is compatible with similar tools, but the other tools may overwrite this setting.
  powerManagement.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [
    gutenprint # Drivers for many different printers from many different vendors.
    gutenprintBin # Additional, binary-only drivers for some printers.
    hplip # Drivers for HP printers.
    postscript-lexmark # Postscript drivers for Lexmark
    splix # Drivers for printers supporting SPL (Samsung Printer Language).
    brlaser # Drivers for some Brother printers
    brgenml1lpr # Generic drivers for more Brother printers
    fxlinuxprint # Fuji Xerox Linux Printer Driver

    # samsung-unified-linux-driver # Proprietary Samsung Drivers
    # cnijfilter2 # Drivers for some Canon Pixma devices (Proprietary driver)
    # foomatic-db-nonfree # OpenPrinting printer support database (unfree content)
    # foomatic-db-ppds-withNonfreeDb
  ];

  # Enable scanner
  hardware.sane.enable = true; # enables support for scanners
  hardware.sane.extraBackends = [ pkgs.sane-airscan ];
  # udev, a device manager for the Linux kernel.
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
    enable = false;
    displayManager.startx.enable = false;
    displayManager.lightdm.enable = false;

    # Enable the GNOME Desktop Environment.
    # displayManager.gdm.enable = false;
    # desktopManager.gnome.enable = false;

    # Configure keymap in X11
    xkb.layout = "us,ru";
    xkb.variant = "";
  };
  xdg.portal.wlr.enable = true;

  users.users.user = {
    isNormalUser = true;
    description = "user";
    shell = pkgs.fish;
    useDefaultShell = true;

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

    # gc = { # Auto delete nix trash
    #   automatic = true;
    #   dates = "weekly";
    #   options = "--delete-older-than 30d";
    # };
    optimise.automatic = true;
    settings.auto-optimise-store = true;
  };

  # --------------------------------
  # SYSTEM PACKAGES
  # --------------------------------

  environment.systemPackages = with pkgs; [
    hyprcursor
    gparted
    os-prober
    swaylock
    ntfs3g # ntfs support
    clinfo # opencl info
    mesa # video driver
    jdk # java
    impala # wifi tui
    iwd # wifi cli, don't delete!
    helix
    bluez

    grc # colors for fish
    fzf # cli search. Run: Ctrl+R
    fishPlugins.fzf-fish
    fishPlugins.forgit # fzf git support
    fishPlugins.done # notifications

    # VPN
    xray
    proxychains # run any program with xray proxy

    # for thunar
    nufraw-thumbnailer
  ];

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

    # For thunar
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images

    # Flatpak
    flatpak.enable = true;

    # Disable GNOME power service
    power-profiles-daemon.enable = false;
    # Thermald proactively prevents overheating 
    thermald.enable = true;

    # VPN xRay
    xray = {
      enable = true;
      settingsFile = "/etc/xray/config.json";
    };

    # Enable the OpenSSH daemon.
    openssh.enable = true;

  }; # close services

  systemd = {
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
  };

  # --------------------------------
  # OTHER PROGRAMS 
  # --------------------------------

  qt.enable = true;

  programs = {

    # For Hyprland
    uwsm = { enable = true; };
    hyprland = {
      enable = true;
      withUWSM = true;

      # package = pkgs.unstable.hyprland.override {
      package = pkgs.hyprland.override {
        # don't use override if you don't want compiling
        withSystemd = false;
        legacyRenderer = false;
      };

    };

    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 5";
      flake = "/home/user/nix";
    };

    htop.enable = true;
    git.enable = true;
    dconf.enable = true;
    fish.enable = true;

    # promt for any shell
    starship = with config.lib.stylix.colors; {
      enable = true;
      settings = {
        add_newline = true;
        command_timeout = 500;
        scan_timeout = 500;
        format = ''
          ''${custom.pwd}$nix_shell$lua$git_branch$git_commit$git_state$git_status$custom(:$user)$time
          $character'';

        git_branch = {
          style = "green";
          format = "[$branch(:$remote_branch)]($style) ";
        };
        git_commit = { style = "green"; };
        git_state = { style = "green"; };
        git_status = {
          # style = "green";
          deleted = "x";
          behind = "↓";
          ahead = "↑";
        };
        custom.pwd = {
          command = "echo $PWD";
          when = "true";
          style = "#${base0A}";
          format = "[$output]($style) ";
        };
        custom.user = {
          command = "echo $USER@$hostname ";
          when = "true";
          style = "#${base05}";
          format = "[\\[$output\\]]($style) ";
        };
        time = {
          disabled = false;
          format = "[\\[$time\\]]($style) ";
          style = "#${base05}";
          time_format = "%R";
        };
        character = {
          success_symbol = "[\\[I\\]>](green)";
          error_symbol = "[\\[I\\]>](red)";
          vimcmd_symbol = "[\\[N\\]>](#${base05})";
          vimcmd_replace_one_symbol = "[\\[r\\]>](purple)";
          vimcmd_replace_symbol = "[\\[R\\]>](purple)";
          vimcmd_visual_symbol = "[\\[V\\]>](yellow)";
        };
      };
    };

    thunar.enable = true;
    # thunar settings
    xfconf.enable = true;
    thunar.plugins = with pkgs.xfce; [ thunar-archive-plugin thunar-volman ];

  };

  # --------------------------------
  # BOOT OPTIONS
  # --------------------------------

  boot.kernelParams = [ "boot.shell_on_fail" ];
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      default = "saved";
      splashImage = lib.mkForce null;
      theme = lib.mkForce null;
      fontSize = lib.mkForce 30;
      extraConfig = lib.mkForce ''
        GRUB_CMDLINE_LINUX_DEFAULT="loglevel=1"
      '';
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
