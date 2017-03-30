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
        mov r0,#0
        b error


suma:
        bl getchar
        @pide y lee el numero
        ldr r0,=formatoS
        bl puts
        ldr r0,=formatoO
        ldr r1,=num2
        bl scanf

        @carga los numeros para sumar
        ldr r4,=num1
        ldr r1,[r4]
        ldr r4,=num2
        ldr r2,[r4]

        @sumar
        add r10,r1,r2
        ldr r4,=num1
        str r10,[r4]
        bl getchar
        b menu

resta:
        bl getchar
        @pide y lee el numero
        ldr r0,=formatoS
        bl puts
        ldr r0,=formatoO
        ldr r1,=num2
        bl scanf

        @carga los numeros para restar
        ldr r4,=num1
        ldr r1,[r4]
        ldr r4,=num2
        ldr r2,[r4]

        @restar
        sub r10,r1,r2
        ldr r4,=num1
        str r10,[r4]
        bl getchar
        b menu

multiplicacion:
        bl getchar
        @pide y lee el numero
        ldr r0,=formatoS
        bl puts
        ldr r0,=formatoO
        ldr r1,=num2
        bl scanf

        @carga los numeros para multiplicar
        ldr r4,=num1
        ldr r1,[r4]
        ldr r4,=num2
        ldr r2,[r4]

        @multiplicar
        mul r10,r1,r2
        ldr r4,=num1
        str r10,[r4]
        bl getchar
        b menu

igual:
        @muestra el valor guardado en memoria
        bl getchar
        ldr r0, =formatoIgual
        ldr r2, =num1
        ldr r1,[r2]
        bl printf
        b menu

error:
        @muestra un mensaje de error cuando se ingresa un comando invalido
        ldr r0, =formatoError
        bl puts
        bl getchar
        b menu

salir:
        mov r3, #0
        mov r0, r3
        ldmfd sp!, {lr}
        bx lr

.data
.align 2
opciones: .asciz "\nIngrese un comando: \n"
formatoS: .asciz "\nIngrese un valor: \n"
formatoO: .asciz "%d"
formatoIgual: .asciz "\n%d\n"
formatoError: .asciz "\nIngrese un comando valido\n"
num1: .word 0
num2: .word 0
