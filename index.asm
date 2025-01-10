include \masm32\include\masm32rt.inc

.data
    f dd ?
    s dd ?
    r dd ?
    choice dd ?
.code

addProc proc
    mov eax, f
    add eax, s
    mov r, eax
    print chr$(13, 10, "Addition result: ")
    print str$(r, 13, 10)
    call odCheck
    ret
addProc endp

subtractProc proc
    mov eax, f
    sub eax, s
    mov r, eax
    print chr$(13, 10, "Subtract result: ")
    print str$(r, 13, 10)
    call odCheck
    ret
subtractProc endp

multiplicationProc proc
    mov eax, f
    mul s
    mov r, eax
    print chr$(13, 10, "Multiplication result: ")
    print str$(r, 13, 10)
    call odCheck
    ret
multiplicationProc endp

odCheck proc
    mov eax, r
    cdq
    mov ebx, 2
    idiv ebx
    cmp edx, 0
    je chanFlag
    jg leFlag
    jmp close
    chanFlag:
        print chr$(13, 10, "Ket qua la so chan")
        jmp close
    leFlag:
        print chr$(13, 10, "Ket qua la so le")
        jmp close
    ret
odCheck endp

start:
    mov f, sval(input("Enter first number: "))
    mov s, sval(input("Enter second number: "))
    print chr$(13, 10, "Program menu:", 13, 10, "<1> Addition", 13, 10, "<2> Subtract", 13, 10, "<3> Multiplication", 13, 10)
    mov choice, sval(input("Your choose: "))
    mov eax, choice
    cmp eax, 1
    je callAddProc
    
    cmp eax, 2
    je subtractProc
    
    cmp eax, 3
    je multiplicationProc

    jmp close
    
    callAddProc:
        call addProc
        jmp close
            
    callSubtractProc:
        call subtractProc
        jmp close
            
    callMultiplicationProc:
        call multiplicationProc
        jmp close
        
    close:
        exit
end start