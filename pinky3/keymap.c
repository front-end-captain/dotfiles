/* Copyright 2018 'Masayuki Sunahara'
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#include QMK_KEYBOARD_H

enum layer_names {
    _QWERTY,
    _LOWER,
    _RAISE,
    _ADJUST
};

enum custom_keycodes {
    QWERTY = SAFE_RANGE,
    LOWER,
    RAISE,
    ADJUST,

    MY_EMAIL,
    UNLOCK,
};

enum {
    TD_1,
    TD_2,
    TD_3,
    TD_4,
    TD_5,
    TD_6,
    TD_7,
    TD_8,
    // TD_9,
    // TD_0,
};

tap_dance_action_t tap_dance_actions[] = {
    [TD_1] = ACTION_TAP_DANCE_DOUBLE(KC_1, LSFT(KC_1)),
    [TD_2] = ACTION_TAP_DANCE_DOUBLE(KC_2, LSFT(KC_2)),
    [TD_3] = ACTION_TAP_DANCE_DOUBLE(KC_3, LSFT(KC_3)),
    [TD_4] = ACTION_TAP_DANCE_DOUBLE(KC_4, LSFT(KC_4)),
    [TD_5] = ACTION_TAP_DANCE_DOUBLE(KC_5, LSFT(KC_5)),
    [TD_6] = ACTION_TAP_DANCE_DOUBLE(KC_6, LSFT(KC_6)),
    [TD_7] = ACTION_TAP_DANCE_DOUBLE(KC_7, LSFT(KC_7)),
    [TD_8] = ACTION_TAP_DANCE_DOUBLE(KC_8, LSFT(KC_8)),
    // [TD_9] = ACTION_TAP_DANCE_DOUBLE(KC_9, LSFT(KC_9)),
    // [TD_0] = ACTION_TAP_DANCE_DOUBLE(KC_0, LSFT(KC_0)),
};

#define LCG(kc) (QK_LCTL | QK_LGUI | (kc))

// #define PREV_D LCTL(KC_LEFT)
// #define NEXT_D LCTL(KC_RGHT)

#define CENTER LAG(KC_C)
#define L_HALF LAG(KC_LEFT)
#define R_HALF LAG(KC_RGHT)
#define T_HALF LAG(KC_UP)
#define B_HALF LAG(KC_DOWN)
#define FULL LAG(KC_F)
#define LARGER MEH(KC_LEFT)
#define SMALLER MEH(KC_RGHT)
#define UNDO LAG(KC_Z)

#define TMUX LCTL(KC_B)
#define CTRL_C LCTL(KC_C)

#define SEARCH LGUI(KC_SPC)
// #define SEARCH KC_RGUI

#define FINDER LAG(KC_SPC)
// #define FINDER LGUI(KC_E)

// `ctrl + command + q` lock screen for macos
// `win + l` lock screen for windows11
#define LOCK LCG(KC_Q)
// #define LOCK KC_LGUI(KC_L)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [_QWERTY] = LAYOUT_split_3x7_4(
        KC_GRV,     KC_Q,       KC_W,       KC_E,       KC_R,       KC_T,       KC_UP,        KC_DOWN,    KC_Y,       KC_U,       KC_I,       KC_O,       KC_P,       KC_BSLS,
        KC_TAB,     KC_A,       KC_S,       KC_D,       KC_F,       KC_G,       KC_LEFT,      KC_RGHT,    KC_H,       KC_J,       KC_K,       KC_L,       KC_SCLN,    KC_QUOT,
        KC_LSFT,    KC_SLSH,    KC_Z,       KC_X,       KC_C,       KC_V,       KC_ESC,       KC_BSPC,    KC_B,       KC_N,       KC_M,       KC_COMM,    KC_DOT,     KC_RSFT ,
                                            KC_LALT,    KC_LGUI,    LOWER,      KC_SPC,       KC_ENT,     KC_RCTL,    RAISE,      ADJUST
    ),
    [_LOWER] = LAYOUT_split_3x7_4(
        _______,    TD(TD_1),   TD(TD_2),   TD(TD_3),   TD(TD_4),   TD(TD_5),   KC_HOME,      KC_END,     TD(TD_6),   TD(TD_7),   TD(TD_8),   KC_9,       KC_0,        _______,
        KC_CAPS,    TMUX,       KC_UNDS,    KC_PLUS,    KC_MINS,    KC_EQL,     KC_PGUP,      KC_PGDN,    KC_LBRC,    KC_RBRC,    KC_LCBR,    KC_RCBR,    KC_LPRN,     KC_RPRN,
        _______,    CTRL_C,     _______,    _______,    _______,    _______,    KC_INS,       KC_DEL,     _______,    _______,    _______,    _______,    _______,     _______,
                                            KC_LALT,    KC_LGUI,    LOWER,      KC_SPC,       KC_ENT,     KC_RCTL,    RAISE,      ADJUST
    ),
    [_RAISE] = LAYOUT_split_3x7_4(
        _______,    KC_F1,      KC_F2,      KC_F3,      KC_F4,      KC_F5,      _______,      _______,    _______,    _______,    _______,    _______,    _______,     _______,
        _______,    KC_F6,      KC_F7,      KC_F8,      KC_F9,      KC_F10,     _______,      _______,    KC_MPRV,    KC_VOLD,    KC_VOLU,    KC_MNXT,    KC_MUTE,     KC_MPLY,
        _______,    KC_F11,     KC_F12,     KC_F13,     KC_F14,     KC_F15,     _______,      _______,    _______,    _______,    _______,    _______,    _______,     _______,
                                            KC_LALT,    KC_LGUI,    LOWER,      KC_SPC,       KC_ENT,     KC_RCTL,    RAISE,      ADJUST
    ),
    [_ADJUST] = LAYOUT_split_3x7_4(
        _______,    LARGER,     T_HALF,     SMALLER,    _______,    _______,    _______,      _______,    _______,   MY_EMAIL,    _______,    _______,    UNLOCK,      SEARCH,
        _______,    L_HALF,     CENTER,     R_HALF,     _______,    _______,    _______,      _______,    _______,    _______,    _______,    _______,    _______,     FINDER,
        _______,    FULL,       B_HALF,     UNDO,       _______,    _______,    _______,      _______,    _______,    _______,    _______,    _______,    _______,     LOCK,
                                            KC_LALT,    KC_LGUI,    LOWER,      KC_SPC,       KC_ENT,     KC_RCTL,    RAISE,      ADJUST
    )
};

// KC_BTN1,    KC_MS_U,    KC_BTN2
// KC_MS_L,    KC_MS_D,    KC_MS_R

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
    if (record->event.pressed) {
        // set_timelog();
    }

    switch (keycode) {
        case LOWER:
            if (record->event.pressed) {
                layer_on(_LOWER);
                update_tri_layer(_LOWER, _RAISE, _ADJUST);
            } else {
                layer_off(_LOWER);
                update_tri_layer(_LOWER, _RAISE, _ADJUST);
            }
            return false;
            break;
        case RAISE:
            if (record->event.pressed) {
                layer_on(_RAISE);
                update_tri_layer(_LOWER, _RAISE, _ADJUST);
            } else {
                layer_off(_RAISE);
                update_tri_layer(_LOWER, _RAISE, _ADJUST);
            }
            return false;
            break;
        case ADJUST:
            if (record->event.pressed) {
                layer_on(_ADJUST);
            } else {
                layer_off(_ADJUST);
            }
            return false;
            break;

        case MY_EMAIL:
            if (record->event.pressed) {
                SEND_STRING("18810940932@163.com");
            } else {
            }
            return false;
            break;

        case UNLOCK:
            if (record->event.pressed) {
                SEND_STRING("1019");
            } else {
            }
            return false;
            break;
    }

    return true;
}
