{ config, pkgs, ... }: {

  # Imports
  imports = [ ./hardware-configuration.nix ];

  # swap file
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16 * 1024; # 16GB
  }];

  services = {
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
        CPU_MAX_PERF_ON_BAT = 100;

        CPU_BOOST_ON_AC = "1";
        CPU_BOOST_ON_BAT = "0";

        # Controls runtime power management for PCIe devices (Fan).
        PCIE_ASPM_ON_AC = "default";
        PCIE_ASPM_ON_BAT = "powersupersave";

        CONSERVATION_MODE = 1;
        TLP_DEFAULT_MODE = "conservation";

        # Not supported for my laptop (manual mode)
        # START_CHARGE_THRESH_BAT0 = 70;
        # STOP_CHARGE_THRESH_BAT0 = 85;
        # START_CHARGE_THRESH_BAT1 = 70;
        # STOP_CHARGE_THRESH_BAT1 = 85;

        # improve disk IO
        DISK_IOSCHED = "mq-deadline";
      };
    };
  };
}
