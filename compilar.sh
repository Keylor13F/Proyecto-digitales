#!/bin/bash

# -----------------------------------------------------
# Script para compilar el programa de Burbuja
# para la arquitectura nativa (x86_64) Y para RISC-V
# -----------------------------------------------------

# --- Variables ---
CPP_FILE="burbuja.cpp"

# Compilador nativo
NATIVE_COMPILER="g++"
EXEC_NATIVE="burbuja_ejecutable"
ASM_NATIVE="burbuja_x86.s"

# Compilador cruzado RISC-V
# (Prueba también riscv64-linux-gnu-g++ si este no funciona)
RISCV_COMPILER="riscv64-unknown-elf-g++"
ASM_RISCV="burbuja_riscv.s"

# --- Verificación de Archivo Fuente ---
echo "Verificando que $CPP_FILE exista..."
if [ ! -f "$CPP_FILE" ]; then
    echo "Error: ¡No se encuentra el archivo $CPP_FILE!"
    echo "Por favor, guarda el código C++ primero."
    exit 1
fi

# --- Proceso Nativo (x86_64) ---
echo ""
echo "--- Proceso Nativo (x86_64) ---"
echo "1. Compilando C++ a ejecutable nativo..."
$NATIVE_COMPILER -Wall -std=c++17 $CPP_FILE -o $EXEC_NATIVE
if [ $? -eq 0 ]; then
    echo "   Éxito: Se creó $EXEC_NATIVE"
else
    echo "   Error: Falló la compilación nativa"
    exit 1
fi

echo "2. Generando ensamblador nativo ($ASM_NATIVE)..."
$NATIVE_COMPILER -Wall -std=c++17 -S -O2 $CPP_FILE -o $ASM_NATIVE
echo "   Éxito: Se generó $ASM_NATIVE"


# --- Proceso RISC-V ---
echo ""
echo "--- Proceso de Compilación Cruzada (RISC-V) ---"

# 1. Comprobar si el compilador cruzado existe
if ! command -v $RISCV_COMPILER &> /dev/null
then
    echo "¡AVISO! El compilador cruzado $RISCV_COMPILER no se encontró."
    echo "Omitiendo la generación de ensamblador RISC-V."
    echo "Por favor, instálalo (ej: sudo apt install g++-riscv64-unknown-elf)"
    exit 0
fi

# 2. Generar ensamblador RISC-V
echo "1. Generando ensamblador RISC-V ($ASM_RISCV)..."
$RISCV_COMPILER -Wall -std=c++17 -S -O2 $CPP_FILE -o $ASM_RISCV
if [ $? -eq 0 ]; then
    echo "   Éxito: Se generó $ASM_RISCV"
else
    echo "   Error: Falló la generación de ensamblador RISC-V"
    exit 1
fi

echo ""
echo "¡Compilación completada!"
echo "Puedes ejecutar el programa nativo con: ./$EXEC_NATIVE"
echo "Puedes inspeccionar el ensamblador RISC-V en: $ASM_RISCV"

# --- NOTA IMPORTANTE ---
echo ""
echo "Nota: El archivo $ASM_RISCV contiene código ensamblador RISC-V."
echo "No puedes ejecutarlo en tu PC, pero puedes analizarlo o usarlo en un simulador RISC-V (como QEMU)."