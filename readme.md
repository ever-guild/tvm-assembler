# tvm-assembler

```shell
make deploy # deploy contact, see build/smc.addr
make touch  # make internal message
make read   # read curren state uint 32
```

## Dependency

### `tvm-asm`

```shell
git clone  git@github.com:tonlabs/ever-assembler.git
cd ever-assembler
cargo build --release
mv target/release/asm /usr/bin/tvm-asm
```

### `everdev`

```shell
npm install --global everdev
```

### `tonos-cli`

```shell
npx everdev tonos-cli install
```

### `fift`

https://github.com/ton-blockchain/ton/releases


