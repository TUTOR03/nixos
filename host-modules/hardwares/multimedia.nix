{ config, lib, pkgs, ... }:

{
  options.hardwares.multimedia.enable = lib.mkEnableOption "Enable multimedia codecs and libraries";

  config = lib.mkIf config.hardwares.multimedia.enable {
    environment.systemPackages = with pkgs; [
      ffmpeg-full

      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      gst_all_1.gst-libav
      gst_all_1.gst-vaapi
    ];
  };
}
