{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  system.stateVersion = "24.05"; # Did you read the comment?

  boot.kernelParams = [ "nvidia-drm.modeset=1" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "miller"; # Define your hostname.
  networking.networkmanager.enable = false;
  networking.wireless.enable = false;

  fileSystems."/home/kramar/mnt/gentoo" =
    { device = "/dev/nvme0n1p2";
      fsType = "ext4";
    };

  services.openssh = {
    enable = true;
    ports = [ 42 ];
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "dvorak";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  security.sudo.wheelNeedsPassword = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kramar = {
    isNormalUser = true;
    description = "kramar";
    extraGroups = [ "wheel" "docker" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    terminus_font
  ];

  virtualisation.docker.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty sublime-merge pcmanfm
    scrot (polybar.override { pulseSupport = true; }) rofi
    awscli nodePackages.aws-cdk
    babashka cocogitto
    # dbt
    fzf git htop httpie lazygit
    baobab fastfetch
    bspwm sxhkd capitaine-cursors feh
    jdk jetbrains.idea-community maven
    jq yq-go
    k6 k9s krew kubectl kubeseal
    neovim obsidian
    nodejs_22 yarn
    rcm
    tree
    silver-searcher ripgrep
    slack telegram-desktop
    tmux
    ungoogled-chromium
    unzip
    yazi
    zoxide
    zig
  ];

  ### DISPLAY

  services.xserver = {
    enable = true;
    # layout = "us;ua";
    xkb = {
      layout = "us";
      variant = "dvorak";
    };
    windowManager.bspwm = {
      enable = true;
    };
    videoDrivers = [ "nvidia" ];

    config = ''
      Section "Device"
          Identifier "nvidia"
          Driver "nvidia"
          BusID "PCI:1:0:0"
          Option "AllowEmptyInitialConfiguration"
      EndSection
    '';
    screenSection = ''
      Option         "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
      Option         "AllowIndirectGLXProtocol" "off"
      Option         "TripleBuffer" "on"
    '';
  };

  hardware.nvidia = {
    open = false;
    # package = config.boot.kernelPackages.stable;
    modesetting.enable = true;
  };

  services.xserver.displayManager.startx.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "*";

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  ### SOUND
  hardware.pulseaudio.enable = true;
  services.pipewire.enable = false;

  systemd.oomd.enable = false;
  hardware.bluetooth.enable = false;

  security.tpm2.enable = true;
  services.dbus.implementation = "broker";
}
