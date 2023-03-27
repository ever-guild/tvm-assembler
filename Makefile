clear:
	rm -fr build
build/smc.boc build/smc.dbg.json: src/smc.code
	mkdir -p build
	tvm-asm src/smc.code build/smc.boc build/smc.dbg.json
build/smc.addr build/smc-message.boc: build/smc.boc
	fift -s smc-message.fif | sed 's/ //'> build/smc.addr
deploy: build/smc.addr build/smc-message.boc
	npx everdev ct -n dev -a "$(shell cat build/smc.addr)" -v 1T
	tonos-cli -j -u https://devnet-sandbox.evercloud.dev sendfile build/smc-message.boc
read: build/smc.addr
	tonos-cli -j -u https://devnet-sandbox.evercloud.dev account --dumptvc build/acc.tvc "$(shell cat build/smc.addr)"
	fift -s src/smc-read.fif
touch: build/smc.addr
	npx everdev ct -n dev -a "$(shell cat build/smc.addr)" -v 3000000
