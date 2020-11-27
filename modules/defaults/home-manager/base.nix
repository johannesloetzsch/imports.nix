{ pkgs, ... }:
{
  home.packages = with pkgs; [
    networkmanagerapplet
    bat
  ];

  services.clipmenu.enable = true;

  ## To find entries, use `dconf list /` and tabcompletion
  ## To see the values use `dconf dump /`
  dconf.settings = {
    "org/mate/terminal/profiles/default" = {
      use-theme-colors = false;
      background-color = "#000000000000";
      bold-color = "#000000000000";
      foreground-color = "#FFFFFFFFFFFF";
      scrollbar-position = "hidden";
      use-system-font = false;
    };
    "org/mate/settings-daemon/plugins/media-keys" = {
      screensaver = "<Mod4>Escape";
    };
    "org/mate/desktop/keybindings/custom0" = {
      name = "terminal";
      action = "mate-terminal --full-screen --hide-menubar";
      binding = "<Mod4>space";
    };
    "org/mate/desktop/keybindings/custom1" = {
      name = "clipmenu";
      action = "clipmenu";
      binding = "<Mod4>h";
    };
  };
}
