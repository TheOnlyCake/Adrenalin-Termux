#!/data/data/com.termux/files/usr/bin/bash

# ============================================================
# ADRENALIN TEAM - SSH/SFTP CUSTOM TERMINAL
# ============================================================

ssh_info() {

TEXT='  /$$$$$$   /$$$$$$  /$$   /$$       /$$$$$$ /$$   /$$ /$$$$$$$$ /$$$$$$     
 /$$__  $$ /$$__  $$| $$  | $$      |_  $$_/| $$$ | $$| $$_____//$$__  $$    
| $$  \__/| $$  \__/| $$  | $$        | $$  | $$$$| $$| $$     | $$  \ $$ /$$
|  $$$$$$ |  $$$$$$ | $$$$$$$$        | $$  | $$ $$ $$| $$$$$  | $$  | $$|__/
 \____  $$ \____  $$| $$__  $$        | $$  | $$  $$$$| $$__/  | $$  | $$    
 /$$  \ $$ /$$  \ $$| $$  | $$        | $$  | $$\  $$$| $$     | $$  | $$ /$$
|  $$$$$$/|  $$$$$$/| $$  | $$       /$$$$$$| $$ \  $$| $$     |  $$$$$$/|__/
 \______/  \______/ |__/  |__/      |______/|__/  \__/|__/      \______/'

TOTAL=$(printf '%s\n' "$TEXT" | wc -l)
LINE=0

while IFS= read -r text; do

    T=$(awk "BEGIN {print $LINE/($TOTAL-1)}")

    # Verde -> Gris
    R=$(awk "BEGIN {printf \"%.0f\", 20 + 130*$T}")
    G=$(awk "BEGIN {printf \"%.0f\", 160 - 10*$T}")
    B=$(awk "BEGIN {printf \"%.0f\", 70 + 80*$T}")

    printf "\033[38;2;%s;%s;%sm%s\033[0m\n" "$R" "$G" "$B" "$text"

    LINE=$((LINE + 1))

done <<< "$TEXT"

printf '\n'

# Información cyan
printf '\033[38;2;0;230;255mUSER: %s\033[0m\n' "$(whoami)"
printf '\033[38;2;0;230;255mPORT: 8022\033[0m\n'
printf '\033[38;2;0;230;255mPASSWORD: la configurada con passwd\033[0m\n'
printf '\033[38;2;0;230;255mPROTOCOL: SSH/SFTP\033[0m\n'
printf '\033[38;2;0;230;255mHOST: 127.0.0.1 LOCAL\033[0m\n'

printf '\n'

# Crédito amarillo
printf '\033[38;2;255;210;0mBy: Adrenalin Team\033[0m\n'

printf '\n'
}


ssh_init() {

TEXT='  /$$$$$$   /$$$$$$  /$$   /$$        /$$$$$$                                                   
 /$$__  $$ /$$__  $$| $$  | $$       /$$__  $$                                                  
| $$  \__/| $$  \__/| $$  | $$      | $$  \__/  /$$$$$$   /$$$$$$  /$$    /$$ /$$$$$$   /$$$$$$ 
|  $$$$$$ |  $$$$$$ | $$$$$$$$      |  $$$$$$  /$$__  $$ /$$__  $$|  $$  /$$//$$__  $$ /$$__  $$
 \____  $$ \____  $$| $$__  $$       \____  $$| $$$$$$$$| $$  \__/ \  $$/$$/| $$$$$$$$| $$  \__/
 /$$  \ $$ /$$  \ $$| $$  | $$       /$$  \ $$| $$_____/| $$        \  $$$/ | $$_____/| $$      
|  $$$$$$/|  $$$$$$/| $$  | $$      |  $$$$$$/|  $$$$$$$| $$         \  $/  |  $$$$$$$| $$      
 \______/  \______/ |__/  |__/       \______/  \_______/|__/          \_/    \_______/|__/      

  /$$$$$$  /$$   /$$                                                                            
 /$$__  $$| $$$ | $$                                                                            
| $$  \ $$| $$$$| $$ /$$                                                                        
| $$  | $$| $$ $$ $$|__/                                                                        
| $$  | $$| $$  $$$$                                                                            
| $$  | $$| $$\  $$$ /$$                                                                        
|  $$$$$$/| $$ \  $$|__/                                                                        
 \______/ |__/  \__/'

TOTAL=$(printf '%s\n' "$TEXT" | wc -l)
LINE=0

while IFS= read -r text; do

    T=$(awk "BEGIN {print $LINE/($TOTAL-1)}")

    # Gris -> Carmesí
    R=$(awk "BEGIN {printf \"%.0f\", 100 + 100*$T}")
    G=$(awk "BEGIN {printf \"%.0f\", 100 - 70*$T}")
    B=$(awk "BEGIN {printf \"%.0f\", 100 - 55*$T}")

    printf "\033[38;2;%s;%s;%sm%s\033[0m\n" "$R" "$G" "$B" "$text"

    LINE=$((LINE + 1))

done <<< "$TEXT"

printf '\n'

printf '\033[38;2;0;230;255mType: ssh info to get SSH/SFTP information\033[0m\n'
printf '\n'

# Iniciar servidor SSH/SFTP
if pgrep -x sshd >/dev/null; then
    printf '\033[38;2;0;230;255mSSH/SFTP server is already running on port 8022.\033[0m\n'
else
    sshd

    if pgrep -x sshd >/dev/null; then
        printf '\033[38;2;0;230;255mSSH/SFTP server started successfully on port 8022.\033[0m\n'
    else
        printf '\033[38;2;255;80;80mFailed to start SSH/SFTP server.\033[0m\n'
    fi
fi

printf '\033[38;2;255;210;0mBy: Adrenalin Team\033[0m\n'
printf '\n'
}
