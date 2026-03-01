rec {
  name = "gruvbox";

  colors = {
    dark0 = "#1D2021";
    dark1 = "#282828";
    dark2 = "#3C3836";
    dark3 = "#504945";
    dark4 = "#665C54";

    light0 = "#FBF1C7";
    light1 = "#EBDBB2";
    light2 = "#D5C4A1";
    light3 = "#BDAE93";
    light4 = "#A89984";

    bright-red = "#FB4934";
    bright-green = "#B8BB26";
    bright-yellow = "#FABD2F";
    bright-blue = "#83A598";
    bright-purple = "#D3869B";
    bright-aqua = "#8EC07C";
    bright-orange = "#FE8019";

    gray = "#928374";
  };

  hyprland = {
    activeBorder = builtins.substring 1 6 colors.light3;
    inactiveBorder = builtins.substring 1 6 colors.dark4;
    groupBorder = builtins.substring 1 6 colors.dark3;
    groupBorderActive = builtins.substring 1 6 colors.light3;
  };

  hyprlock = {
    accent = colors.bright-blue;
    background = colors.dark0;
    inputBg = colors.dark2;
    textColor = colors.light1;
    subtextColor = colors.light3;
  };

  mako = {
    background = colors.dark1;
    text = colors.light1;
    border = colors.dark3;
    lowUrgency = colors.bright-blue;
    normalUrgency = colors.bright-green;
    criticalUrgency = colors.bright-red;
  };

  swayosd = {
    background = colors.dark1;
    bar = colors.bright-blue;
    barBg = colors.dark3;
    text = colors.light1;
  };

  satty = {
    brush = colors.bright-red;
    text = colors.light1;
    shape = colors.bright-blue;
    arrow = colors.bright-yellow;
    highlight = colors.bright-green;
  };
}
