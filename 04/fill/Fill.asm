// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

//キーボードの入力が反映されるアドレスの値が0以外の時、キーボードが入力されていると判断



(LOOP)
    @KBD
    D=M
    @DISPLAYBLACK
    D;JNE    // if M[KBD] != 0 then goto DISPLAYBLACK
    @DISPLAYWHITE
    D;JEQ    // if M[KBD] != 0 then goto DISPLAYWHITE
    @LOOP
    0;JMP

(DISPLAYBLACK)
    @SCREEN
    D=A
    @i
    M=D
(BLACKLOOP)
    @i
    D=M
    @screenaddress
    A=D
    M=-1
    @i
    M=D+1
    D=M
    @KBD
    D=A-D
    @LOOP
    D;JEQ

    @KBD
    D=M
    @LOOP
    D;JEQ  //if M[KBD] == 0 goto LOOP
    @BLACKLOOP
    0;JMP


(DISPLAYWHITE)
    @SCREEN
    D=A
    @i
    M=D
(WHITELOOP)
    @i
    D=M
    @screenaddress
    A=D
    M=0
    @i
    M=M+1
    D=M
    @KBD
    D=A-D
    @LOOP
    D;JEQ

    @KBD
    D=M
    @LOOP
    D;JNE  //if M[KBD] != 0 goto LOOP
    @WHITELOOP
    0;JMP



