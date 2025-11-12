# ======== CONSTANTES PARA EL SNAKE ========
.equ LED_MATRIX_0_BASE,  0xFF200000
.equ LED_MATRIX_0_WIDTH, 24

.equ D_PAD_0_BASE,       0xFF200100
.equ D_PAD_0_RIGHT_OFFSET, 0xC
.equ D_PAD_0_LEFT_OFFSET,  0x8
.equ D_PAD_0_UP_OFFSET,    0x0
.equ D_PAD_0_DOWN_OFFSET,  0x4


# Archivo de constantes para el Snake en RISC-V
# Definiciones de direcciones base ficticias para compilar sin errores

LED_MATRIX_0_BASE = 0xFF000000
SW_BASE           = 0xFF000010
KEY_BASE          = 0xFF000020
HEX_BASE          = 0xFF000030
TIMER_BASE        = 0xFF000040
UART_BASE         = 0xFF000050
JTAG_BASE         = 0xFF000060

