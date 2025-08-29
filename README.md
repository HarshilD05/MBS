# Assembly Program using TASM

## Description
This project contains an assembly language program written for the 8086 microprocessor, assembled and executed using Turbo Assembler (TASM). The program demonstrates basic operations such as adding two values and displaying the result in hexadecimal format on the terminal.

## Prerequisites
- Turbo Assembler (TASM)
- TLINK linker
- DOS environment or DOSBox for running the executables

## How to Assemble, Link, and Run

1. **Write your Assembly Code**  
   Create your source file with a `.asm` extension, for example `program.asm`.

2. **Assemble the Source File**  
   Open the command prompt or DOSBox and navigate to the folder containing your `.asm` file, then run:  
   ```
   tasm program.asm
   ```
   This generates `program.obj` if there are no assembly errors.

3. **Link the Object File**  
   Link the object file to create an executable using:  
   ```
   tlink program.obj
   ```
   This generates the executable `program.exe`.

4. **Run the Executable**  
   Execute the program by typing:  
   ```
   program
   ```
   or
   ```
   program.exe
   ```
   Output will be displayed in the terminal window.

## Notes
- Ensure TASM and TLINK executables are accessible in your system PATH or run them from their installed directory.
- If using modern Windows, DOSBox emulation is recommended for running these commands.
- The program output will display hexadecimal characters representing results using DOS interrupt 21h services.
