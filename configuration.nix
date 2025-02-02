# NixOS manual accessible by running ‘nixos-help’.
{ config, pkgs, lib, inputs, ... }: {

  # --------------------------------
  # SYSTEM THEME 
  # --------------------------------

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/mountain.yaml";
    # image = config.lib.stylix.pixel "base00";
    image = ./images/image.jpg;

    # override = {
    #   author = "DaemonLife";
    # one tone gradient
    # base00 = "1F1F28"; # BACKGROUND (BLACK)
    # base01 = "1F1F28"; # bright green
    # base02 = "252535"; # bright yellow
    # base03 = "34344b"; # bright black
    # base04 = "DCD7BA"; # bright blue
    # base05 = "DCD7BA"; # FOREGROUND (WHITE)
    # base06 = "DCD7BA"; # bright magenta
    # base07 = "C8C093"; # bright white

    # colors
    # base08 = "C34043"; # RED
    # base09 = "E82424"; # bright red
    # base0A = "E6C384"; # YELLOW
    # base0B = "76946A"; # GREEN
    # base0C = "7393bc"; # CYAN
    # base0D = "7E9CD8"; # BLUE
    # base0E = "957FB8"; # MAGENTA
    # base0F = "7393bc"; # bright cyan
    # };

    homeManagerIntegration.followSystem = false;
    targets.grub.enable = false;

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 24;

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
        applications = 16;
        terminal = 16;
        desktop = 16;
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
    EDITOR = "hx";
    SYSTEMD_EDITOR = "hx";
    VISUAL = "hx";
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
  # time.timeZone = "Europe/Moscow";
  time.timeZone = "Asia/Colombo";
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
    displayManager.startx.enable = false;
    # windowManager.fvwm2.gestures = true;

    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = false;
    desktopManager.gnome.enable = true;

    # Configure keymap in X11
    xkb.layout = "us,ru";
    xkb.variant = "";
  };

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

    gc = { # Auto delete nix trash
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
    hyprcursor
    gparted
    htop
    os-prober
    grub2
    swaylock
    ntfs3g # ntfs support
    clinfo # opencl info
    nh # nix cli helper
    mesa
    patchelfUnstable
    jdk # java
    ly # enter to system
    impala
    iwd
    helix

    grc # colors for fish
    fzf # cli search. Run: Ctrl+R
    fishPlugins.fzf-fish
    fishPlugins.forgit # fzf git support
    fishPlugins.done # notifications

    # VPN
    xray
    proxychains # run any program with xray proxy
    # nekoray # GUI client
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
    displayManager.ly.enable = true;

    # Flatpak
    flatpak.enable = true;

    # Disable GNOME power service
    power-profiles-daemon.enable = false;

    # xRay 
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

  programs = {

    hyprland = {
      enable = true;
      # set the flake package
      # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      # make sure to also set the portal package, so that they are in sync
      # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    fish.enable = true;

    # promt for any shell
    starship = {
      enable = true;
      settings = {
        add_newline = true;
        command_timeout = 300;
        scan_timeout = 200;
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
          style = "bold cyan";
          format = "[$output]($style) ";
        };
        custom.user = {
          command = "echo $USER@$hostname ";
          when = "true";
          style = "gray";
          format = "[\\[$output\\]]($style) ";
        };
        time = {
          disabled = false;
          format = "[\\[$time\\]]($style) ";
          style = "gray";
          time_format = "%R";
        };
        character = {
          success_symbol = "[\\[I\\]>](green)";
          error_symbol = "[\\[I\\]>](red)";
          vimcmd_symbol = "[\\[N\\]>](white)";
          vimcmd_replace_one_symbol = "[\\[r\\]>](purple)";
          vimcmd_replace_symbol = "[\\[R\\]>](purple)";
          vimcmd_visual_symbol = "[\\[V\\]>](yellow)";
        };
      };
    };

    # run bin files
    nix-ld = {
      enable = true;
      libraries = with pkgs;
        [
          # ...
        ];
    };

  };

  # --------------------------------
  # BOOT 
  # --------------------------------

  boot = { kernelParams = [ "boot.shell_on_fail" ]; };

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      default = "saved";
      splashImage = lib.mkForce null;
      theme = lib.mkForce null;
      extraConfig = "";
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
