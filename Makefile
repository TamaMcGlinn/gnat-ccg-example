cgen_main: src/generated_c/main.c
	gcc -I/opt/GNAT/2021/libexec/gnat_ccg/lib/gcc/x86_64-pc-linux-gnu/10.3.1/rts-ccg/adalib/ /opt/GNAT/2021/libexec/gnat_ccg/lib/gcc/x86_64-pc-linux-gnu/10.3.1/rts-ccg/adalib/s-imglli.c src/generated_c/*.c -o bin/cgen_main

src/generated_c/main.c: src/main.adb obj/target_config.atp
	gprbuild --target=c -gnatp -gnatL -g -O3 -gnateT=${PWD}/obj/target_config.atp
	mkdir -p src/generated_c
	mv obj/*.[ch] src/generated_c/

obj/target_config.atp:
	gprbuild -gnatet=target_config.atp

.PHONY: clean
clean:
	rm -rf obj bin src/generated_c
