{ pkgs, ... }:

{
  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/mate/terminal/profiles/default" = {
          use-theme-colors = false;
          background-color = "#000000000000";
          bold-color = "#000000000000";
          foreground-color = "#FFFFFFFFFFFF";
          scrollbar-position = "hidden";
          use-system-font = false;
        };
        "org/mate/desktop/keybindings/custom0" = {
          name = "terminal";
          action = "mate-terminal --full-screen --hide-menubar";
          binding = "<Mod4>space";
        };
      };
    }
  ];
}
