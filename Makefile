CFLAGS:="-DPICO_BOARD=pico $(CFLAGS)"

.PHONY: clean build flash

clean:
	@rm -rf sensor/build

build:
	@cd sensor; mkdir -p build
	@cd sensor/build; cmake .. $(CFLAGS)
	@cd sensor/build; make main

flash:
	@picotool load -f sensor/build/main.uf2
