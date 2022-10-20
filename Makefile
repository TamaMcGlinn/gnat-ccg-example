cgen_main: src/generated_c/main.c
	gcc -I/opt/GNAT/2021/libexec/gnat_ccg/lib/gcc/x86_64-pc-linux-gnu/10.3.1/rts-ccg/adalib/ /opt/GNAT/2021/libexec/gnat_ccg/lib/gcc/x86_64-pc-linux-gnu/10.3.1/rts-ccg/adalib/s-imgint.c src/generated_c/*.c -o bin/cgen_main

src/generated_c/main.c: src/main.adb
	rm -rf obj/
	gprbuild --target=c
	mkdir -p src/generated_c
	mv obj/* src/generated_c/

.PHONY: clean
clean:
	rm -rf obj bin src/generated_c
