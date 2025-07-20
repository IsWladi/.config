switch (keycode) {
    case LT(0,KC_N):
        if (!record->tap.count && record->event.pressed) {
            tap_code16(KC_SCLN); // Intercept hold function to send Ñ
            return false;
        }
        return true; // Return true for normal processing of tap keycode

    case ROFI: //Macro abrir rofi, ejecutador de aplicaciones
        if (record->event.pressed){
            register_code(KC_LGUI);
            tap_code(KC_D);
            unregister_code(KC_LGUI);
        }
        return false;

    case TOGGLE_FS_I3: //Macro: Toggle max o min en i3
        if (record->event.pressed){
            register_code(KC_LGUI);
            tap_code(KC_F);
            unregister_code(KC_LGUI);
        }
        return false;

    case WLEFT_I3: //Macro mover a ventana izquierda en i3
        if (record->event.pressed){
            register_code(KC_LGUI);
            tap_code(KC_LEFT);
            unregister_code(KC_LGUI);
        }
        return false;

    case WRIGHT_I3: //Macro mover a ventana derecha en i3
        if (record->event.pressed){
            register_code(KC_LGUI);
            tap_code(KC_RIGHT);
            unregister_code(KC_LGUI);
        }
        return false;

    case WT: //Macro abrir terminal en i3
        if (record->event.pressed) {
            register_code(KC_LGUI);
            tap_code(KC_ENTER);
            unregister_code(KC_LGUI);
        }
        return false;

    case CLOSE_I3:
        if (record->event.pressed) {
            register_code(KC_LGUI);
            register_code(KC_LSFT);
            tap_code(KC_Q);
            unregister_code(KC_LSFT);
            unregister_code(KC_LGUI);
        }
        return false; // evita enviar el keycode base accidentalmente

    case MAYUS:
        if (record->event.pressed) {
            // Comprueba si la iluminación está apagada antes de alternar
            if (!rgblight_is_enabled()) {
                rgblight_enable(); // Enciende la iluminación si está apagada
                rgblight_increase_hue(); // Opcional: ajusta el tono al encender
            } else {
                rgblight_disable(); // Apaga la iluminación si está encendida
            }
            tap_code(KC_CAPS); // Envia la señal de bloqueo de mayúsculas
        }
        return false;

    case COPY_TERM:
        if (record->event.pressed) {
            tap_code16(C(S(KC_C)));  // Terminal: Ctrl+Shift+C
        }
        return false;

    case PASTE_TERM:
        if (record->event.pressed) {
            tap_code16(C(S(KC_V)));  // Terminal: Ctrl+Shift+V
        }
        return false;

    case COPY_WIN:
        if (record->event.pressed) {
            tap_code16(C(KC_C));  // Ctrl+C
        }
        return false;

    case PASTE_WIN:
        if (record->event.pressed) {
            tap_code16(C(KC_V));  // Ctrl+V
        }
        return false;
    }
        return true;
}
