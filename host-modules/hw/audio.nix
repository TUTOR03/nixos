{ config, lib, pkgs, userName, ... }:

{
  options.hw.audio.enable = lib.mkEnableOption "Enable PipeWire audio system";

  config = lib.mkIf config.hw.audio.enable {
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };

    users.users.${userName}.extraGroups = [ "audio" ];
  };
}
