GNAT Pro CCG Example
====================

This project serves to demonstrate how to compile Ada code using the [Common Code Generator](https://docs.adacore.com/live/wave/gnat-ccg/html/gnatccg_ug/gnat_ccg/gnat_ccg.html) (also known as GNAT Pro CCG), which compiles Ada/SPARK into C code in order to support platforms not supported natively by GNAT.

Build
-----

Install GNAT and gprbuild, then run gprbuild from the root of the repository to get a native Ada executable.

If you have AdaCore's CCG, you can also run `make` to generate C code and compile the resulting executable, whose behaviour should be the same as the native Ada executable.

```
$ gprbuild
using project file cgen_int64.gpr
Setup
   [mkdir]        object directory for project cgen_int64
   [mkdir]        exec directory for project cgen_int64
Compile
   [Ada]          main.adb
Bind
   [gprbind]      main.bexch
   [Ada]          main.ali
Link
   [link]         main.adb

$ make
rm -rf obj/
gprbuild --target=c
using project file cgen_int64.gpr
Setup
   [mkdir]        object directory for project cgen_int64
Compile
   [Ada]          main.adb
Bind
   [gprbind]      main.bexch
   [Ada]          main.ali
mkdir -p src/generated_c
mv obj/* src/generated_c/
gcc -I/opt/GNAT/2021/libexec/gnat_ccg/lib/gcc/x86_64-pc-linux-gnu/10.3.1/rts-ccg/adalib/ /opt/GNAT/2021/libexec/gnat_ccg/lib/gcc/x86_64-pc-linux-gnu/10.3.1/rts-ccg/adalib/s-imgint.c src/generated_c/*.c -o b
in/cgen_main

$ ./bin/native_main 
 9223372036854775807

$ ./bin/cgen_main 
 2147483647
```
