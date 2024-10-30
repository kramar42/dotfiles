{
  description = "system flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, ... }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
        argocd
        awscli
        alacritty
        google-chrome
        obsidian
        slack
        spotify
        # vlc
        babashka
        go
        postgresql
        qbittorrent
        spotify
        unnaturalscrollwheels
        python3
        broot
        cloc
        yazi
        clojure
        jdk maven
        # qv
        # visidata
        cocogitto
        # dbt
        delta
        fastfetch
        fzf
        git
        htop
        httpie
        hugo
        inetutils
        jq
        k6
        k9s
        kcat
        kubeseal
        lazygit
        neovim
        qemu
        rcm
        silver-searcher ripgrep
        tmux
        tree
        wget
        yarn
        yq-go
        yt-dlp
        zoxide
        # broken?
        # telegram-desktop
      ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      services.skhd.enable = true;
      services.yabai.enable = true;

      security.pam.enableSudoTouchIdAuth = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      # programs.zsh.enable = true;  # default shell on catalina
      programs.bash.enable = true;
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
      nixpkgs.config.allowUnfree = true;
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations.romilly = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    # darwinPackages = self.darwinConfigurations."simple".pkgs;

    nixosConfigurations.miller = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ];
    };
  };
}
