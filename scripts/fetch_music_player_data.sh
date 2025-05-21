#!/run/current-system/sw/bin/bash

fetch_music_player_data() {
    # Get the first player
    player=$(playerctl -l 2>/dev/null | head -n1)

    if [[ -z "$player" ]]; then
        # No player found → exit silently (no output at all)
        exit 0
    fi

    # Get metadata from the player
    title=$(playerctl -p "$player" metadata xesam:title 2>/dev/null)
    artist=$(playerctl -p "$player" metadata xesam:artist 2>/dev/null)
    player_status=$(playerctl -p "$player" status 2>/dev/null)

    # Don't display if nothing is playing or paused
    if [[ "$player_status" != "Playing" && "$player_status" != "Paused" ]]; then
        exit 0
    fi

    # Fallback values
    text="${artist:+$artist - }$title"
    tooltip="<i><span color='#a6da95'>$player</span></i>: <b><span color='#f5a97f'>$artist</span> - <span color='#c6a0f6'>$title</span></b>"

    # Output JSON
    echo "{\"text\": \"$text\", \"tooltip\": \"$tooltip\", \"alt\": \"$player_status\", \"class\": \"$player_status\"}"
}

fetch_music_player_data
