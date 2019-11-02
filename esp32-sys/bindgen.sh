#!/usr/bin/env bash

set -e

source ../setenv.sh

COMPS=$IDF_PATH/components
SYSROOT=$HOME/xtensa-esp32-elf/xtensa-esp32-elf/sysroot

BINDGEN=bindgen
CLANG_FLAGS="\
	--sysroot=$SYSROOT \
    -I$(pwd)/build/include \
	-D__bindgen \
	-target xtensa \
	-x c"

for INC in `ls -d $COMPS/**/*/include`; do
	#echo $INC
	CLANG_FLAGS+=" -I$INC"
done
for INC in `ls -d $COMPS/*/include`; do
	#echo $INC
	CLANG_FLAGS+=" -I$INC"
done

CLANG_FLAGS+=" -I../build/include"

#echo $CLANG_FLAGS

function generate_bindings ()
{
    declare -r crate=$1

    cd "$crate"
    #source ./bindings.env

	LIBCLANG_PATH="$LIBCLANG_PATH" \
	"$BINDGEN" \
		--use-core \
		--no-layout-tests \
		$BINDGEN_FLAGS \
		--output src/bindings.rs \
		src/bindings.h \
		-- $CLANG_FLAGS

	rustup run nightly rustfmt src/bindings.rs
}

generate_bindings $@
