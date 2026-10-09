# Adrenalin Team

Personalización de terminal para Termux basada en los ASCII originales del mantenedor.

## Instalación

```bash
pkg update
pkg install git python openssh
git clone https://github.com/TU-USUARIO/adrenalin-team.git
cd adrenalin-team
bash install.sh
source ~/.bashrc
adrenalin --on
```

Reemplaza `TU-USUARIO` por tu usuario de GitHub. En la primera activación se pide un nickname personal.

## Comandos

- `adrenalin --on`: activa la personalización.
- `adrenalin --off`: desactiva la personalización.
- `adrenalin --status`: muestra el estado y nickname.
- `list cmds -c`: muestra el catálogo de comandos.
- `clear`: limpia la terminal y muestra el ASCII.
- `python ...`: muestra el ASCII de Python y ejecuta el intérprete real.
- `ssh info`: muestra información de conexión local SSH/SFTP.
- `ssh init`: inicia el servidor SSH/SFTP de Termux.

## Seguridad SSH/SFTP

No se almacena ni se muestra una contraseña fija. Configura la tuya con `passwd`. Para un cliente SFTP en el mismo teléfono usa host `127.0.0.1`, puerto `8022`, tu usuario de Termux y la contraseña que configuraste. Mantén SSH en localhost o en una LAN de confianza; no expongas el servicio a Internet.

La configuración de Bash se respalda en `~/.config/adrenalin-team/bashrc.pre-install`. El nickname queda en `~/.config/adrenalin-team/config`.

Revisa los scripts antes de ejecutarlos. Los mensajes personalizados usan el crédito `By: Adrenalin Team`.

**Corrección del prompt:** la asignación `PS1` delimita ahora las secuencias ANSI con `\[` y `\]` para que Bash/Readline calcule correctamente el ancho del prompt al editar comandos largos.
