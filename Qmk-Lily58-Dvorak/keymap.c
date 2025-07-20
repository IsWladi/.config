#include QMK_KEYBOARD_H

extern keymap_config_t keymap_config;

extern uint8_t is_master;

enum layer_number {
    _QWERTY = 0,
    _LOWER,
    _HIGHER,
    _ADJUST,
    _NUMPAD,
};

// Tap Dance definitions
enum {
    TD_INTE,
    TD_EXCLA,
    TD_NN,
    TD_PS,
    TD_LEFT_K,
    TD_RIGHT_K,
    TD_CORCHETES_K,
    TD_FORWARD_SLASH,
    TD_TILDE,
    TD_DOTS,
    TD_MINT,
    TD_BIGT,
    TD_SIM2,
    TD_SIM4,
    TD_SIM5,
    TD_SIM8,
    TD_SIM9,
    TD_SIM10,
    TD_SIM12,
};

// Creamos nuestros keycodes personalizados
enum custom_keycodes {
  MAYUS = SAFE_RANGE,
  ROFI,
  TOGGLE_FS_I3,
  WLEFT_I3,
  WRIGHT_I3,
  WT,
  CLOSE_I3,
  COPY_WIN,
  PASTE_WIN,
  COPY_TERM,
  PASTE_TERM,
};

void keyboard_post_init_user(void) {
  // Desactiva la iluminación RGB al inicio
  rgblight_disable();
}

void ts_action_SIMB(tap_dance_state_t *state, void *user_data) {
    if (state->count == 1) {
        SEND_STRING(SS_LALT("227"));
    } else if (state->count == 2) {
        SEND_STRING(SS_LALT("251"));
    }
    reset_tap_dance(state);
}
void ts_action_LEFT_PAR_BRA(tap_dance_state_t *state, void *user_data) {
    if (state->count == 1) {
        SEND_STRING(SS_LSFT(SS_TAP(X_8)));
    } else if (state->count == 2) {
        SEND_STRING(SS_LSFT(SS_TAP(X_QUOTE)));
    }
    reset_tap_dance(state);
}
void ts_action_RIGHT_PAR_BRA(tap_dance_state_t *state, void *user_data) {
    if (state->count == 1) {
        SEND_STRING(SS_LSFT(SS_TAP(X_9)));
    } else if (state->count == 2) {
        SEND_STRING(SS_LSFT(SS_TAP(X_NUHS)));
    }
    reset_tap_dance(state);
}

void ts_action_corchetes(tap_dance_state_t *state, void *user_data) {
    if (state->count == 1) {
        SEND_STRING(SS_TAP(X_QUOTE));
    } else if (state->count == 2) {
        SEND_STRING(SS_TAP(X_NUHS));
    }
    reset_tap_dance(state);
}

void ts_action_forward_slash(tap_dance_state_t *state, void *user_data) {
    if (state->count == 1) {
        SEND_STRING(SS_LSFT(SS_TAP(X_7)));
    } else if (state->count == 2) {
        SEND_STRING(SS_TAP(X_PAST));
    }
    reset_tap_dance(state);
}

tap_dance_action_t tap_dance_actions[] = {
    [TD_INTE]    = ACTION_TAP_DANCE_DOUBLE(KC_EQUAL, KC_UNDS), // ¿?
    [TD_EXCLA]    = ACTION_TAP_DANCE_DOUBLE(S(KC_EQUAL), S(KC_1)), // ¡!
    [TD_NN]       = ACTION_TAP_DANCE_DOUBLE(KC_N, KC_SCLN), // n ñ
    [TD_TILDE]    = ACTION_TAP_DANCE_DOUBLE(S(KC_2), KC_MINS), // " '
    [TD_DOTS]     = ACTION_TAP_DANCE_DOUBLE(S(KC_DOT), S(KC_COMM)), // : ;
    [TD_MINT]     = ACTION_TAP_DANCE_DOUBLE(KC_COMM, KC_NUBS), // , <
    [TD_BIGT]     = ACTION_TAP_DANCE_DOUBLE(KC_DOT, S(KC_NUBS)), // . >
    [TD_SIM2]     = ACTION_TAP_DANCE_DOUBLE(S(KC_6), KC_GRV), // & |
    [TD_SIM4]     = ACTION_TAP_DANCE_DOUBLE(KC_PERC, S(KC_3)), // % #
    [TD_SIM5]     = ACTION_TAP_DANCE_DOUBLE(S(KC_SLSH), RALT(KC_RBRC)), // _  ~

    [TD_SIM8]     = ACTION_TAP_DANCE_DOUBLE(S(KC_0),  RALT(KC_Q)), // = @
    [TD_SIM9]     = ACTION_TAP_DANCE_DOUBLE(RALT(KC_QUOT), S(KC_4)), //^ $
    [TD_SIM10]    = ACTION_TAP_DANCE_DOUBLE(RALT(KC_NUHS), RALT(KC_MINS)), // ` BACKSLASH
    [TD_SIM12]    = ACTION_TAP_DANCE_DOUBLE(KC_PPLS, KC_SLASH), // + -

    [TD_LEFT_K]   = ACTION_TAP_DANCE_FN(ts_action_LEFT_PAR_BRA), // ( { [ 
    [TD_RIGHT_K]  = ACTION_TAP_DANCE_FN(ts_action_RIGHT_PAR_BRA), // ) } ]
    [TD_CORCHETES_K]  = ACTION_TAP_DANCE_FN(ts_action_corchetes), // {}
    [TD_FORWARD_SLASH]     = ACTION_TAP_DANCE_FN(ts_action_forward_slash), // / *
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

    [_QWERTY] = LAYOUT( \

    KC_DEL,         LGUI(KC_1),     LGUI(KC_2),     LGUI(KC_3),       LGUI(KC_4),    LGUI(KC_5),                    KC_6,    KC_7,    KC_8,    KC_9,         KC_0,    KC_PSCR, \
    MAYUS,          TD(TD_TILDE),   TD(TD_MINT),    TD(TD_BIGT),      KC_P,    KC_Y,                                  KC_F,    KC_G,    KC_C,    KC_H,         KC_L,    LSFT_T(KC_LBRC), \
    LSFT_T(KC_TAB), KC_A,           KC_O,           KC_E, LT(_NUMPAD, KC_U),   KC_I,                                  KC_D,    KC_R,    KC_T,    TD(TD_NN),    KC_S,    KC_BSPC, \
    XXXXXXX,        TD(TD_DOTS),    KC_Q,           KC_J,             KC_K,    KC_X, TD(TD_LEFT_K),   TD(TD_RIGHT_K), KC_B,    KC_M,    KC_W,    KC_V,         KC_Z,    KC_RGUI, \
                                          XXXXXXX, XXXXXXX, LT(_LOWER,KC_SPC),   LALT_T(KC_ESC),         LCTL_T(KC_COMM), LT(_HIGHER,KC_ENT), TD(TD_CORCHETES_K), XXXXXXX \
                       ),

    [_LOWER] = LAYOUT( \
    _______, KC_F1,   KC_F2,   KC_F3,   KC_F4,    KC_F5,                       KC_F6,       KC_F7,       KC_F8,       KC_F9,       KC_F10,      XXXXXXX,\
    _______, XXXXXXX, XXXXXXX, COPY_TERM, PASTE_TERM,   XXXXXXX,                     XXXXXXX,     XXXXXXX,     XXXXXXX,     XXXXXXX,     XXXXXXX,     KC_AUDIO_VOL_UP, \
    _______, XXXXXXX, XXXXXXX, COPY_WIN,  PASTE_WIN, XXXXXXX,                     TD(TD_FORWARD_SLASH), TD(TD_INTE), TD(TD_SIM2), TD(TD_SIM4), TD(TD_SIM5), KC_AUDIO_MUTE, \
    _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,  XXXXXXX, XXXXXXX,    XXXXXXX,XXXXXXX,     XXXXXXX,     XXXXXXX,     XXXXXXX,     XXXXXXX,     KC_AUDIO_VOL_DOWN, \
                           _______, _______, _______, _______,             _______, _______, _______, _______\
    ),


    [_HIGHER] = LAYOUT( \
    XXXXXXX, XXXXXXX,     XXXXXXX,     XXXXXXX,      XXXXXXX,      XXXXXXX,                             XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_BSPC, \
    XXXXXXX, KC_HOME,     KC_PGUP,     KC_PSCR,      XXXXXXX,      XXXXXXX,                             ROFI,    TOGGLE_FS_I3,     WLEFT_I3,     WRIGHT_I3,   WT, CLOSE_I3, \
    XXXXXXX, TD(TD_SIM8), TD(TD_SIM9), TD(TD_SIM10), TD(TD_EXCLA), TD(TD_SIM12),                        XXXXXXX, KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, XXXXXXX, \
    XXXXXXX, XXXXXXX,     XXXXXXX,     XXXXXXX,      XXXXXXX,      XXXXXXX,       XXXXXXX,     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, \
                                                     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,         XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX \
    ),


    // https://docs.qmk.fm/keycodes#rgb-matrix-lighting
    [_ADJUST] = LAYOUT( \
    RGB_TOG,       RGB_MOD, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                   XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, \
    QK_BOOTLOADER, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, RGB_TOG,                   XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, QK_BOOTLOADER, \
    QK_REBOOT,     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                   XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, QK_REBOOT, \
    XXXXXXX,       XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,\
                                   XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,     XXXXXXX,  XXXXXXX, XXXXXXX, XXXXXXX \
    ),

    [_NUMPAD] = LAYOUT( \
    XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                     XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, \
    XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                     XXXXXXX, KC_7,    KC_8,    KC_9,    XXXXXXX, XXXXXXX, \
    XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                     KC_0,    KC_4,    KC_5,    KC_6,    XXXXXXX, _______, \
    XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,   XXXXXXX, XXXXXXX, KC_1,    KC_2,    KC_3,    XXXXXXX, XXXXXXX,\
                             XXXXXXX, XXXXXXX, _______, XXXXXXX,       XXXXXXX,  _______, XXXXXXX, XXXXXXX \
    ),

    };

#include "oled.c"
#include "macros.c"
