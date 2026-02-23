{ config, lib, ... }:

{
  config = lib.mkIf config.desktops.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      "$mod" = "SUPER";

      bindd = [
        "$mod, Q, Закрыть окно, killactive,"

        "$mod, LEFT, Переместить фокус влево, movefocus, l"
        "$mod, RIGHT, Переместить фокус вправо, movefocus, r"
        "$mod, UP, Переместить фокус вверх, movefocus, u"
        "$mod, DOWN, Переместить фокус вниз, movefocus, d"

        "$mod, code:10, Переключиться на рабочий стол 1, workspace, 1"
        "$mod, code:11, Переключиться на рабочий стол 2, workspace, 2"
        "$mod, code:12, Переключиться на рабочий стол 3, workspace, 3"
        "$mod, code:13, Переключиться на рабочий стол 4, workspace, 4"
        "$mod, code:14, Переключиться на рабочий стол 5, workspace, 5"
        "$mod, code:15, Переключиться на рабочий стол 6, workspace, 6"
        "$mod, code:16, Переключиться на рабочий стол 7, workspace, 7"
        "$mod, code:17, Переключиться на рабочий стол 8, workspace, 8"
        "$mod, code:18, Переключиться на рабочий стол 9, workspace, 9"
        "$mod, code:19, Переключиться на рабочий стол 10, workspace, 10"

        "$mod SHIFT, code:10, Переместить окно на рабочий стол 1, movetoworkspace, 1"
        "$mod SHIFT, code:11, Переместить окно на рабочий стол 2, movetoworkspace, 2"
        "$mod SHIFT, code:12, Переместить окно на рабочий стол 3, movetoworkspace, 3"
        "$mod SHIFT, code:13, Переместить окно на рабочий стол 4, movetoworkspace, 4"
        "$mod SHIFT, code:14, Переместить окно на рабочий стол 5, movetoworkspace, 5"
        "$mod SHIFT, code:15, Переместить окно на рабочий стол 6, movetoworkspace, 6"
        "$mod SHIFT, code:16, Переместить окно на рабочий стол 7, movetoworkspace, 7"
        "$mod SHIFT, code:17, Переместить окно на рабочий стол 8, movetoworkspace, 8"
        "$mod SHIFT, code:18, Переместить окно на рабочий стол 9, movetoworkspace, 9"
        "$mod SHIFT, code:19, Переместить окно на рабочий стол 10, movetoworkspace, 10"

        "$mod, page_up, Следующий рабочий стол, workspace, +1"
        "$mod, page_down, Предыдущий рабочий стол, workspace, -1"

        "$mod SHIFT, page_up, Переместить окно на следующий рабочий стол, movetoworkspace, +1"
        "$mod SHIFT, page_down, Переместить окно на предыдущий рабочий стол, movetoworkspace, -1"

        "$mod, code:20, Расширить окно влево, resizeactive, -100 0"
        "$mod, code:21, Сузить окно слева, resizeactive, 100 0"
        "$mod SHIFT, code:20, Сузить окно сверху, resizeactive, 0 -100"
        "$mod SHIFT, code:21, Расширить окно вниз, resizeactive, 0 100"

        "$mod, SPACE, Запуск приложений, exec, launch-walker"
        "$mod, GRAVE, Шпаргалка шорткатов, exec, keybindings-menu"
        "$mod, V, Буфер обмена, exec, launch-walker -m clipboard"
        "$mod, SLASH, Файлы, exec, launch-walker -m files"
        "$mod, EQUAL, Калькулятор, exec, launch-walker -m calc"

        "$mod, T, Терминал, exec, uwsm app -- ghostty"
        "$mod, B, Браузер, exec, uwsm app -- firefox"
      ];

      bindmd = [
        "$mod, mouse:272, Переместить окно, movewindow"
        "$mod ALT, mouse:272, Изменить размер окна, resizewindow"
      ];
    };
  };
}
