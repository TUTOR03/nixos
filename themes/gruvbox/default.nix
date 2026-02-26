# Gruvbox Color Theme
# https://github.com/morhetz/gruvbox

rec {
  name = "gruvbox";

  colors = {
    # Dark0-4 (backgrounds)
    dark0 = "#1D2021";
    dark1 = "#282828";
    dark2 = "#3C3836";
    dark3 = "#504945";
    dark4 = "#665C54";

    # Light0-4 (foregrounds)
    light0 = "#FBF1C7";
    light1 = "#EBDBB2";
    light2 = "#D5C4A1";
    light3 = "#BDAE93";
    light4 = "#A89984";

    # Bright colors
    bright-red = "#FB4934";
    bright-green = "#B8BB26";
    bright-yellow = "#FABD2F";
    bright-blue = "#83A598";
    bright-purple = "#D3869B";
    bright-aqua = "#8EC07C";
    bright-orange = "#FE8019";

    # Neutral colors
    neutral-red = "#CC241D";
    neutral-green = "#98971A";
    neutral-yellow = "#D79921";
    neutral-blue = "#458588";
    neutral-purple = "#B16286";
    neutral-aqua = "#689D6A";
    neutral-orange = "#D65D0E";

    # Faded colors
    faded-red = "#9D0006";
    faded-green = "#79740E";
    faded-yellow = "#B57614";
    faded-blue = "#076678";
    faded-purple = "#8F3F71";
    faded-aqua = "#427B58";
    faded-orange = "#AF3A03";

    # Gray
    gray = "#928374";
  };

  # Semantic aliases для удобства
  semantic = {
    bg-hard = colors.dark0;
    bg = colors.dark1;
    bg-soft = colors.dark2;
    bg-soft2 = colors.dark3;

    fg = colors.light1;
    fg-soft = colors.light2;
    fg-muted = colors.light3;
    fg-faded = colors.light4;

    accent = colors.bright-yellow;
    accent2 = colors.bright-orange;

    border = colors.light1;
    border-muted = colors.gray;

    active = colors.bright-yellow;
    inactive = colors.gray;

    error = colors.bright-red;
    success = colors.bright-green;
    warning = colors.bright-yellow;
    info = colors.bright-blue;
  };

  # Для hyprland (rgb формат без #)
  hyprland = {
    activeBorder = builtins.substring 1 6 semantic.active;
    inactiveBorder = builtins.substring 1 6 semantic.inactive;
    groupBorder = builtins.substring 1 6 colors.bright-blue;
    groupBorderActive = builtins.substring 1 6 semantic.active;
  };

  # Для CSS (с #)
  css = {
    bg-hard = semantic.bg-hard;
    bg = semantic.bg;
    bg-soft = semantic.bg-soft;
    fg = semantic.fg;
    fg-soft = semantic.fg-soft;
    fg-muted = semantic.fg-muted;
    accent = semantic.accent;
    border = semantic.border;
  };
}
