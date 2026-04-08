{
  ## Without this fix, the keyboard might not work during systemd-boot, so luks-partitions can't be unlocked.
  boot.kernelParams = [ "i8042.nomux=1" "i8042.reset=1" ];
}
