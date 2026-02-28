{ config, lib, ... }:

{
  xdg = {
    enable = true;
    mimeApps.enable = true;

    # Базовые XDG пути
    cacheHome = "\${HOME}/.cache";
    configHome = "\${HOME}/.config";
    dataHome = "\${HOME}/.local/share";
    stateHome = "\${HOME}/.local/state";
  };
}
