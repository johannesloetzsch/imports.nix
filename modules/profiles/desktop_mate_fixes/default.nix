{ pkgs, ... }:

{
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (
        action.id == "org.freedesktop.policykit.exec" &&
        action.lookup("program") == "${pkgs.mate-power-manager}/bin/mate-power-backlight-helper"
      ) {
        return polkit.Result.YES;
      }
    });
  '';
}
