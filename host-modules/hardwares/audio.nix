{ config, lib, pkgs, userName, ... }:

{
  options.hardwares.audio.enable = lib.mkEnableOption "Enable PipeWire audio system";

  config = lib.mkIf config.hardwares.audio.enable {
    security.rtkit.enable = lib.mkDefault true;

    services.pipewire = {
      enable = lib.mkDefault true;
      alsa = {
        enable = lib.mkDefault true;
        support32Bit = lib.mkDefault true;
      };
      pulse.enable = lib.mkDefault true;
      jack.enable = lib.mkDefault true;
    };

    users.users.${userName}.extraGroups = [ "audio" ];
  };
}
