{
  programs.waybar = {
    enable = true;
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        "height" = 35;
        "spacing" = 20;

        "modules-left" = [ "hyprland/workspaces" "network" "cava" ];
        "modules-center" = [ "clock" ];
        "modules-right" = [ "custom/media" "pulseaudio" "bluetooth" "battery" "tray" ];

        "hyprland/workspaces" = {
          "active-only" = false;
          "all-outputs" = true;
          "format" = "{icon}";
          "show-special" = false;
          "on-click" = "activate";
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
          "persistent-workspaces" = {
            "eDP-1" = 4;
            "HDMI-A-1" = 4;
            "DP-2" = 2;
          };
          "format-icons" = {
            "active" = "";
            "default" = "";
          };
        };

        "hyprland/window" = {
          "format" = "{}";
          "separate-outputs" = true;
          "rewrite" = {
            "^(.*) — Mozilla Firefox$" = " $1";
            "^(.*) - qutebrowser$" = " $1";
          };
        };

    "battery" = {
        "states" = {
            "high" = 90;
            "upper-medium" = 70;
            "medium" = 50;
            "lower-medium" = 30;
            "low" = 10;
        };
        "format" = "{icon} {capacity}%";
        "format-charging" = "󱐋{icon} {capacity}%";
        "format-plugged" = "󰚥{icon} {capacity}%";
        "format-time" = "{H} h {M} min";
        "format-icons" = [ "󱃍" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        "tooltip-format" = "{timeTo}";
    };

        "bluetooth" = {
          "format" = "󰂯";
          "format-disabled" = "󰂲";
          "format-connected" = "󰂱 {device_alias}";
          "format-connected-battery" = "󰂱 {device_alias} (󰥉 {device_battery_percentage}%)";
          # "format-device-preference" = [ "device1", "device2" ], // preference list deciding the displayed device;
          "tooltip-format" = "{controller_alias}\t{controller_address} ({status})\n\n{num_connections} connected";
          "tooltip-format-disabled" = "bluetooth off";
          "tooltip-format-connected" = "{controller_alias}\t{controller_address} ({status})\n\n{num_connections} connected\n\n{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
          "tooltip-format-enumerate-connected-battery" = "{device_alias}\t{device_address}\t({device_battery_percentage}%)";
          "max-length" = 35;
          "on-click" = "fish -c bluetoothctl disconnect {controller_address}";
          "on-click-right" = "overskride";
        };


        "custom/media" = {
          "format" = "{icon} {text}";
          "restart-interval" = 2;
          "return-type" = "json";
          "format-icons" = {
            "Playing" = "";
            "Paused" = "";
          };
          "max-length" = 35;
          "exec" = "fish -c /home/$USER/nixos-dots/scripts/fetch_music_player_data.sh";
          "on-click" = "playerctl play-pause";
          "on-click-right" = "playerctl next";
          "on-click-middle" = "playerctl prev";
          "on-scroll-down" = "playerctl volume 0.05-";
          "on-scroll-up" = "playerctl volume 0.05+";
          "smooth-scrolling-threshold" = "0.1";
        };

        "network" = {
          "format" = "󰤭";
          "format-wifi" = "{icon} {essid} ({signalStrength}%)";
          "format-icons" = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          "format-disconnected" = "󰤫 Disconnected";
          "tooltip-format" = "wifi <span color='#ee99a0'>off</span>";
          "tooltip-format-wifi" = ''
            SSID: {essid}({signalStrength}%), {frequency} MHz
            Interface: {ifname}
            IP: {ipaddr}
            GW: {gwaddr}

            <span color='#a6da95'>{bandwidthUpBits}</span> <span color='#ee99a0'>{bandwidthDownBits}</span> <span color='#c6a0f6'>󰹹{bandwidthTotalBits}</span>
          '';
          "tooltip-format-disconnected" = "<span color='#ed8796'>disconnected</span>";
          "format-ethernet" = "󰈀 {ipaddr}/{cidr}";
          "max-length" = 35;
          "on-click-right" = "iwgtk";
        };

        "pulseaudio" = {
          "states" = {
            "high" = 90;
            "upper-medium" = 70;
            "medium" = 50;
            "lower-medium" = 30;
            "low" = 10;
          };
          "tooltip-format" = "{desc}";
          "format" = "{icon}{volume}% {format_source}";
          "format-bluetooth" = "󰂱 {icon}{volume}% {format_source}";
          "format-bluetooth-muted" = "󰂱 󰝟 {volume}% {format_source}";
          "format-muted" = "󰝟 {volume}% {format_source}";
          "format-source" = " 󰍬";
          "format-source-muted" = " 󰍭";
          "format-icons" = {
            "headphone" = "󰋋 ";
            "headset" = "󰋎 ";
            "speaker" = "󰓃 ";
            "hdmi" = "󰡁 ";
            "default" = [ "󰕿" "󰖀" "󰕾 " ];
          };
          "reverse-scrolling" = true;
          "reverse-mouse-scrolling" = true;
          "on-click" = "pavucontrol";
        };

        "cava" = {
          "framerate" = 30;
          "autosens" = 1;
          "sleep_timer" = 3;
          "bars" = 14;
          "lower_cutoff_freq" = 50;
          "higher_cutoff_freq" = 10000;
          "method" = "pipewire";
          "source" = "auto";
          "stereo" = true;
          "data_format" = "asci";
          "reverse" = false;
          "bar_delimiter" = 0;
          "monstercat" = false;
          "waves" = false;
          "noise_reduction" = 0.77;
          "input_delay" = 2;
          "format-icons" = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
          "actions" = {
            "on-click-right" = "mode";
          };
        };

        "clock" = {
          "timezone" = "America/Chicago";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format-alt" = "{:%Y-%m-%d}";
        };

        "tray" = {
          "icon-size" = 21;
          "spacing" = 10;
        };
      }
    ];

    style = ''
      * {
        font-family: JetBrainsMono Nerd Font;
        font-size: 13px;
      }

      window#waybar {
        background-color: transparent;
      }

      window#waybar.empty {
        background-color: rgba(30, 30, 46, 0.7);
      }

      button {
        box-shadow: inset 0 -3px transparent;
        border: none;
        border-radius: 0;
      }

      button:hover {
        background: inherit;
        box-shadow: inset 0 -3px #45475a;
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: #f2cdcd;
      }

      #workspaces button:hover {
        background: rgba(0, 0, 0, 0.2);
        border-radius: 15px;
        padding-left: 10px;
        padding-right: 15px;
        margin: 2px;
      }

      #workspaces button.focused {
        background-color: #f2cdcd;
        box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button.urgent {
        background-color: #f2cdcd;
      }

      #network, #clock, #tray, #pulseaudio, #cava, #custom-media, #workspaces, #battery, #bluetooth {
        background-color: #313244;
        border-radius: 15px;
        padding-left: 15px;
        padding-right: 15px;
        margin: 2px;
      }

      #network {
        color: #f5c2e7;
      }

      #battery {
        background-color: #313244;
        border-radius: 15px;
        padding-left: 15px;
        padding-right: 15px;
        margin: 2px;
        color: #f2cdcd;
      }

      #bluetooth {
        color: #f5c2e7;
      }

      #clock {
        color: #f2cdcd;
      }

      #tray, #workspaces {
        color: #f2cdcd;
      }

      #pulseaudio {
        color: #f5c2e7;
      }

      #pulseaudio.bluetooth {
        color: #74c7ec;
      }

      #pulseaudio.muted {
        color: #f38ba8;
      }

      #cava {
        color: #b4befe;
      }

      #cava.silent {
        background-color: transparent;
        color: transparent;
      }

      #custom-media {
        color: #b4befe;
        font-family: "JetBrainsMono Nerd Font", monospace;
      }

      #custom-media.Paused {
        color: #f5e0dc;
      }

      #custom-media.silent {
        color: transparent;
        background: transparent;
      }
    '';
  };
}
