[[ $- == *i* ]] || return 0
CFG="$HOME/.config/adrenalin-team/config"
[[ -f "$CFG" ]] && source "$CFG"
ADRENALIN_NICK="${ADRENALIN_NICK:-User}"

_adrenalin_color_nick() {
  local s="$1" n=${#1} i t r g b
  for ((i=0;i<n;i++)); do
    if ((n<2)); then t=0; else t=$((i*1000/(n-1))); fi
    if ((t<500)); then
      r=$((100+(255-100)*t/500)); g=$((100-100*t/500)); b=$((100-100*t/500))
    else
      r=255; g=$(((t-500)*255/500)); b=$(((t-500)*255/500))
    fi
    printf '\\[\\033[38;2;%d;%d;%dm\\]%s' "$r" "$g" "$b" "${s:i:1}"
  done
  printf '\\[\\033[0m\\]'
}
_adrenalin_set_prompt() {
  local path="${PWD/#$HOME/~}" nick route="" n i t r g
  nick="$(_adrenalin_color_nick "$ADRENALIN_NICK")"
  n=${#path}
  for ((i=0;i<n;i++)); do
    if ((n<2)); then t=0; else t=$((i*1000/(n-1))); fi
    r=$((50+(255-50)*t/1000)); g=$((110+(255-110)*t/1000))
    route+="\\[\\033[38;2;${r};${g};255m\\]${path:i:1}"
  done
  route+='\\[\\033[0m\\]'
  PS1='\[\033[38;2;255;255;255m\][\[\033[38;2;255;50;50m\]$\[\033[38;2;255;255;255m\]] '"$nick"' \[\033[38;2;255;255;255m\](\[\033[38;2;0;255;255m\]DEV\[\033[38;2;255;255;255m\]) \[\033[38;2;0;255;80m\]on\[\033[38;2;255;255;255m\] ~ '"$route"'\[\033[0m\] '
}
PROMPT_COMMAND="_adrenalin_set_prompt"
