{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        # Desktop Monitors
        "DP-2,1920x1080@143,0x0,1"
        "HDMI-A-1,1920x1080@75,1920x0,1"
        # Laptop Monitor
        "eDP-1,1920x1080@60,0x0,1"
      ];

      env = [
        "SLURP_ARGS,-d -b -B F050F022 -b 10101022 -c ff00ff"
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt5ct"
      ];

      exec-once = [
        "waybar"
        "swww-daemon && swww img /home/$USER/nixos-dots/.background"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        resize_on_border = false;
        allow_tearing = false;
        layout = "master";
        "col.active_border" = "rgb(cba6f7) rgb(f5c2e7) 45deg";
        "col.inactive_border" = "rgb(1e1e2e)";
      };

      plugin.split-monitor-workspaces = {
        count = 5;
        keep_focused = 0;
        enable_notifications = 0;
        enable_persistent_workspaces = 1;
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master.new_status = "slave";

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
        enable_swallow = true;
        #swallow_regex = "^(kitty)$";
        swallow_regex = "^(steam)$";
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = -0.3;
        touchpad.natural_scroll = false;
      };

      gestures.workspace_swipe = true;

      "$mainMod" = "SUPER";
      "$term" = "kitty";
      "$fun-term" = "cool-retro-term";
      "$browser" = "firefox";
      "$qutebrowser" = "qutebrowser";
      "$fileManager" = "nautilus";
      "$menu" = "~/.config/rofi/launcher/launcher.sh";
      "$quickmenu" = "~/.config/rofi/applets/bin/apps.sh";
      "$logout" = "~/.config/rofi/powermenu/powermenu.sh";
      "$volIncrease" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
      "$volDecrease" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
      "$volToggle" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      "$micMute" = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
      "$screenshotarea" = "grim -g \"$(slurp)\" - | tee ~/Pictures/Screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png | wl-copy && notify-send \"Screenshot Taken\" \"Saved to ~/Pictures/Screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png and copied to clipboard.\"";

      bind = [
        "$mainMod, R, exec, ~/.config/rofi/applets/bin/quicklinks.sh"
        "$mainMod, Return, exec, $term"
        "$mainMod+SHIFT, Return, exec, $fun-term"
        "$mainMod, B, exec, $qutebrowser"
        "$mainMod+SHIFT, B, exec, $browser"
        "$mainMod, Q, killactive"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating"
        "$mainMod, P, exec, $menu"
        "$mainMod+SHIFT, P, exec, $quickmenu"
        "$mainMod+SHIFT, Q, exec, $logout"
        "$mainMod, ESCAPE, exec, hyprlock"
        "$mainMod, B, exec, ags -t bar-0 && ags -t bar-1"
        "$mainMod, C, exec, gnome-calculator"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
        "$mainMod, XF86AudioMute, exec, $micMute"
        ", XF86AudioMute, exec, $volToggle"
        ", XF86AudioRaiseVolume, exec, $volIncrease"
        ", XF86AudioLowerVolume, exec, $volDecrease"
        ", Print, exec, $screenshotarea"
        "$mainMod, Print, exec, grimblast --notify --cursor copysave screen ~/Pictures/Screenshots/screenshot_$(date +%Y%m%d_%H%M%S).png"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioStop, exec, playerctl stop"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, F, fullscreen"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "SUPER SHIFT, H, movewindow, l"
        "SUPER SHIFT, L, movewindow, r"
        "SUPER SHIFT, K, movewindow, u"
        "SUPER SHIFT, J, movewindow, d"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      workspace = [
        "1, monitor:DP-2, default:true"
        "2, monitor:HDMI-A-1, default:true"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "opacity 0.8 0.8,class:^(org.qutebrowser.qutebrowser)$"
        "opacity 0.8 0.8,class:^(firefox)$"
        "opacity 0.8 0.8,class:^(steam)$"
        "opacity 0.8 0.8,class:^(org.pwmt.zathura)$"
      ];
    };
  };
}
