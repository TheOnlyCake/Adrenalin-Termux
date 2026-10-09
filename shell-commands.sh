ADRENALIN_LIB="$HOME/.local/share/adrenalin-team"
clear() {
  command clear
  if [[ -f "$HOME/.config/adrenalin-team/enabled" ]]; then
    bash "$ADRENALIN_LIB/clear-banner.sh"
    printf '\033[38;2;255;210;0mBy: Adrenalin Team\033[0m\n'
  fi
}
python() {
  if [[ -f "$HOME/.config/adrenalin-team/enabled" ]]; then
    bash "$ADRENALIN_LIB/python-wrapper" "$@"
  else
    command python "$@"
  fi
}
ssh() {
  if [[ -f "$HOME/.config/adrenalin-team/enabled" ]]; then
    case "${1:-}" in
      info) source "$ADRENALIN_LIB/ssh-custom.sh"; ssh_info; return ;;
      init) source "$ADRENALIN_LIB/ssh-custom.sh"; ssh_init; return ;;
    esac
  fi
  command ssh "$@"
}
