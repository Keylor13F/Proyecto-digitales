#!/bin/bash
# ====================================================
# Script para compilar programas RISC-V en Linux
# Autor: (tu nombre)
# Descripción:
#   - Compila burbuja.cpp (C++)
#   - Compila SNAKEfinal.s (ensamblador)
#   - Genera archivos .elf y .txt con código máquina
# ====================================================

# ======== Compilar burbuja.cpp ========
echo "?? Compilando programa en C++ (burbuja.cpp)..."

/mnt/vol_NFS_rh003/Est_Digitales_2S_2025/materiales/tools_riscv/bin/riscv32-unknown-elf-g++ -march=rv32im -mabi=ilp32 -o burbuja.elf burbuja.cpp


# Generar el archivo con el código máquina en texto (hexadecimal)
echo "?? Generando burbuja_hex.txt..."
/mnt/vol_NFS_rh003/Est_Digitales_2S_2025/materiales/tools_riscv/bin/riscv32-unknown-elf-objdump -d burbuja.elf > burbuja_hex.txt

echo "? burbuja.cpp compilado y convertido a código máquina (burbuja_hex.txt)"

# ======== Compilar SNAKEfinal.s ========
echo ""
echo "?? Compilando programa ensamblador (SNAKEfinal.s)..."

# Ensamblar y enlazar (requiere constantes.s en la misma carpeta)
 /mnt/vol_NFS_rh003/Est_Digitales_2S_2025/materiales/tools_riscv/bin/riscv32-unknown-elf-as -march=rv32im -mabi=ilp32 -o snake.o SNAKEfinal.s
 /mnt/vol_NFS_rh003/Est_Digitales_2S_2025/materiales/tools_riscv/bin/riscv32-unknown-elf-as -march=rv32im -mabi=ilp32 -o const.o constantes.s
 /mnt/vol_NFS_rh003/Est_Digitales_2S_2025/materiales/tools_riscv/bin/riscv32-unknown-elf-ld -o snake.elf snake.o const.o

# Generar el archivo de código máquina
echo "?? Generando snake_hex.txt..."
 /mnt/vol_NFS_rh003/Est_Digitales_2S_2025/materiales/tools_riscv/bin/riscv32-unknown-elf-objdump -d snake.elf > snake_hex.txt

echo "? SNAKEfinal.s ensamblado y convertido a código máquina (snake_hex.txt)"
echo ""
echo "?? Proceso completado."
echo ""

# Mostrar verificación rápida
echo "?? Archivos generados:"
ls -lh burbuja* snake*

