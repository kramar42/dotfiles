{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "miller"; # Define your hostname.
  networking.networkmanager.enable = false;
  networking.wireless.enable = false;

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
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
    alacritty
    awscli
    babashka
    baobab
    bitwarden-cli bitwarden-menu
    bspwm sxhkd
    capitaine-cursors
    cocogitto
    dbt
    fastfetch
    feh
    fzf
    git
    htop
    httpie
    jdk jetbrains.idea-community maven
    jq yq
    k6
    k9s krew kubectl kubeseal
    lazygit
    neovim
    nodejs_22 yarn
    pcmanfm
    polybar
    ranger
    rcm
    rofi
    silver-searcher
    slack telegram-desktop
    sublime-merge
    tmux
    ungoogled-chromium
    unzip
    zoxide
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
  };

  hardware.nvidia = {
    open = false;
    # package = config.boot.kernelPackages.stable;
    modesetting.enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "*";

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  ### SOUND

  sound.enable = false;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = false;
  services.pipewire = {
    enable = true;
    # systemWide = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  system.stateVersion = "24.05"; # Did you read the comment?

  ### TODO trying to fix login hang-up
  # systemd.services."getty@tty1".enable = false;
  # systemd.services."autovt@tty1".enable = false;

  systemd.oomd.enable = false;

  security.tpm2.enable = true;

}
