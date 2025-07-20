# QMK Lily58 pro

**Configuración pensada solo y exclusivamente para el dueño del repositorio**

_Mejorar la ergonomia de trabajo integrando neovim con layout Dvorak en un split keyboard(Lily58 pro) usando QMK con apoyo de la configuracion de neovim_

## Funcionalidades más relevantes

---

- indicador de block mayus con led
- separación de codigo según logica del mismo
- numpad dinamico

## Requisitos para asegurar compatibilidad

---

- QMK Firmware 0.23.5
- Lily58 pro
- Linux Mint
- Kitty (no es necesario, pero es el terminal que uso actualmente)

## Referencia

- [Cómo disminuir bytes de compilación](https://github.com/qmk/qmk_firmware/issues/3224#issuecomment-399769416)

## Instalación

1. Clonar el repositorio
2. Ejecutar el script de actualización de la configuración de QMK
   ```bash
   ./update_lily58_kb.bash
   ```
3. Flashear el firmware en el teclado
   ```bash
   ./keyboard_flash.bash
   ```
