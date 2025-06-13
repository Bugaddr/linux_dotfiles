#!/usr/bin/env bash

## prefs.js cleaner — auto-run after profile selection
## based on claustromaniac's original script

VERSION="2.1-auto"

PROFILE_DIR=""

get_profiles() {
    local ini_file="$HOME/.mozilla/firefox/profiles.ini"
    [ ! -f "$ini_file" ] && {
        echo "profiles.ini not found! Are you sure Firefox is installed?"
        exit 1
    }

    awk '
    BEGIN { profile=0 }
    /^\[Profile/ { profile++ }
    /^Name=/ { name=substr($0,6); names[profile]=name }
    /^Path=/ { path=substr($0,6); paths[profile]=path }
    END {
        for (i=1; i<=profile; i++) {
            printf "%d) %s (%s)\n", i, names[i], paths[i]
        }
        print "0) Exit"
    }' "$ini_file"
}

select_profile() {
    local ini_file="$HOME/.mozilla/firefox/profiles.ini"
    mapfile -t paths < <(awk -F= '/^Path=/{print $2}' "$ini_file")

    echo -e "\nAvailable Firefox profiles:"
    get_profiles

    while true; do
        read -rp "Select a profile by number: " idx
        if [[ "$idx" =~ ^[0-9]+$ && "$idx" -le "${#paths[@]}" ]]; then
            [ "$idx" -eq 0 ] && echo "Aborted." && exit 0
            PROFILE_DIR="$HOME/.mozilla/firefox/${paths[$((idx-1))]}"
            [ -d "$PROFILE_DIR" ] && break
        fi
        echo "Invalid selection. Try again."
    done
}

check_firefox_closed() {
    [ -e "$1/lock" ] && {
        echo -e "\nFirefox appears to be running in this profile. Close Firefox and try again.\n"
        read -rp "Press Enter when ready..."
    }
}

clean_prefs() {
    local dir="$1"
    local userjs="$dir/user.js"
    local prefsjs="$dir/prefs.js"

    [ ! -f "$userjs" ] && echo "user.js not found in $dir" && exit 1
    [ ! -f "$prefsjs" ] && echo "prefs.js not found in $dir" && exit 1

    check_firefox_closed "$dir"

    mkdir -p "$dir/prefsjs_backups"
    local backup="$dir/prefsjs_backups/prefs.js.backup.$(date +'%Y-%m-%d_%H%M')"
    cp "$prefsjs" "$backup" || { echo "Failed to back up prefs.js"; exit 1; }

    echo "prefs.js backed up: $backup"
    echo "Cleaning prefs.js..."

    local prefs="@@"
    local prefexp='user_pref[ \t]*\([ \t]*["'\'']([^"'\'']+)["'\''][ \t]*,'

    while read -r line; do
        if [[ "$line" =~ $prefexp && $prefs != *"@@${BASH_REMATCH[1]}@@"* ]]; then
            prefs="${prefs}${BASH_REMATCH[1]}@@"
        fi
    done < <(grep -E "$prefexp" "$userjs")

    {
        while IFS='' read -r line || [[ -n "$line" ]]; do
            if [[ "$line" =~ ^$prefexp ]]; then
                [[ $prefs != *"@@${BASH_REMATCH[1]}@@"* ]] && echo "$line"
            else
                echo "$line"
            fi
        done < "$backup"
    } > "$prefsjs"

    echo -e "\n✅ All done!"
}

# === Main ===
echo -e "\n🧼 prefs.js cleaner — v$VERSION"
select_profile
clean_prefs "$PROFILE_DIR"
