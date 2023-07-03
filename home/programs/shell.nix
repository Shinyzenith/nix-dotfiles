{ config, pkgs, ... }:

{
  programs = {

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };

    fish = {
      enable = false;
      shellInit = "${pkgs.lib.fileContents ../config/configs/fish/extra.fish}";
    };

    zsh = {
      enable = true;
      history.size = 50000;
      history.save = 50000;
      history.path = "${config.xdg.cacheHome}/zsh/.zsh_history";
      dotDir = ".config/zsh";

      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;

      oh-my-zsh = {
        enable = true;
        plugins = [ "vi-mode" ];
      };

      initExtra = "${pkgs.lib.fileContents ../config/configs/zsh/.zshrc-extra}";
    };

  };
  home = {
    sessionVariables = {
      XDG_CACHE_HOME = "$HOME/.cache/";
      XDG_CONFIG_HOME = "$HOME/.config/";
      XDG_DATA_HOME = "$HOME/.local/share/";
      XDG_STATE_HOME = "$HOME/.local/state/";
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "sway";
			XDG_DATA_DIRS="$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"; # Flatpak stuff

      CARGO_HOME = "${config.xdg.dataHome}/cargo";
      GNUPGHOME = "${config.xdg.dataHome}/gnupg";
      GOPATH = "${config.xdg.dataHome}/go";
      LEIN_HOME = "${config.xdg.dataHome}/lein";
      PASSWORD_STORE_DIR = "${config.xdg.dataHome}/pass";
      RUSTUP_HOME = "${config.xdg.dataHome}/rustup";

      CUDA_CACHE_PATH = "${config.xdg.cacheHome}/nv";

      DOOMDIR = "${config.xdg.configHome}/doom";
      GTK2_RC_FILES = "${config.xdg.configHome}/gtk-2.0/gtkrc-2.0";
      PYTHONSTARTUP = "${config.xdg.configHome}/python/pythonrc";
      WGETRC = "${config.xdg.configHome}/wget/wgetrc";

      BAT_THEME = "base16";
      DEBUGINFOD_URLS = "https://debuginfod.archlinux.org";
      EDITOR = "nvim";
      GOPROXY = "direct";
      GTK_USE_PORTAL = "0";
      LESSHISTFILE = "-";
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      MOZ_ENABLE_WAYLAND = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER = "wayland";
      XKB_DEFAULT_OPTIONS = "caps:swapescape";
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };

    shellAliases = {
      optimise-store = "sudo nix-store --optimise";
      nixfmt = ''find ./ -type f -name "*.nix" -exec nixfmt "{}" \;'';
      duplicates = "ls -1 /nix/store | sort -R -t - -k 2 | less";
      c = "tput reset";
      cat = "bat";
      "cd.." = "z ..";
      cd = "z";
      clear = "tput reset";
      decrypt = "gpg --no-symkey-cache";
      df = "duf";
      e = "exit";
      encrypt = "gpg -c --no-symkey-cache --cipher-algo AES256";
      gpgexportprivkey = "gpg --export-secret-keys --armor";
      gpgimportkey = "gpg --import";
      gpglistkeys = "gpg --list-keys --keyid-format LONG";
      grep = "grep --color=auto";
      l =
        "exa -lahF --color=always --icons --sort=name --group-directories-first";
      less = "bat";
      listfonts = "fc-list";
      ls =
        "exa -lhF --color=always --icons --sort=name --group-directories-first";
      lst =
        "exa -lahFT --color=always --icons --sort=name --group-directories-first";
      pdw = "pwd";
      q = "exit";
      rg = "rg --sort path --no-ignore --hidden";
      rm = "rm -i";
      updatefonts = "sudo fc-cache -fv";
      vim = "nvim";
      webcam =
        "setsid -f mpv --profile=low-latency --no-cache --untimed $(/bin/ls /dev/video* | fzf )";
      wget = "wget -c";
    };
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.bin"
    "${config.home.homeDirectory}/.config/bin"
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/.local/share/cargo/bin"
    "${config.home.homeDirectory}/.local/share/cargo/bin"
    "${config.home.homeDirectory}/.nimble/bin"
  ];
}
