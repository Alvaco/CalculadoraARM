.text
.align 2
.global main
.type main,%function

main:
        stmfd sp!, {lr}

@mostrar menu
menu:
        ldr r0,=opciones
        bl puts
        bl getchar
        cmp r0,#'+'
        beq suma
        cmp r0,#'-'
        beq resta
        cmp r0,#'*'
        beq multiplicacion
        cmp r0,#'='
        beq igual
        cmp r0,#'q'
        beq salir
        bne error

suma:
        @pide y lee el numero
        ldr r0,=formatoS
        ldr r1,=num2
        bl scanf

        @carga los numeros para sumar
        ldr r4,=num1
        ldr r1,[r4]
        ldr r4,=num2
        ldr r2,=[r4]

        @sumar
        add r10,r1,r2

        b menu

resta:



.data
.align 2
opciones: .asciz "\nIngrese un comando: \n"
formatoS: .asciz "\nIngrese un valor: %d\n"
num1: .word 0
num2: .word 0
