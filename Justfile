features := 'adc dma exti gpio i2c rtc spi tim uart'
build_target := 'thumbv7em-none-eabihf'
cortex_m_core := 'cortex_m4f_r0p1'
stm32_mcu := 'stm32l4s9'

export CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS := '--cfg cortex_m_core="' + cortex_m_core + '" ' + '--cfg stm32_mcu="' + stm32_mcu + '"'

# Install dependencies
deps:
	rustup target add {{build_target}}
	rustup component add clippy
	rustup component add rustfmt
	type cargo-readme >/dev/null || cargo +stable install cargo-readme

# Reformat the source code
fmt:
	cargo fmt

# Check for mistakes
lint:
	cargo clippy --package drone-stm32-map-svd
	cargo clippy --target {{build_target}} --features "{{features}}" --all --exclude drone-stm32-map-svd

# Check each MCU
check-all:
	rustup target add thumbv7m-none-eabi
	rustup target add thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7M_NONE_EABI_RUSTFLAGS='--cfg cortex_m_core="cortex_m3_r1p1" --cfg stm32_mcu="stm32f100"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7m-none-eabi
	CARGO_TARGET_THUMBV7M_NONE_EABI_RUSTFLAGS='--cfg cortex_m_core="cortex_m3_r1p1" --cfg stm32_mcu="stm32f101"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7m-none-eabi
	CARGO_TARGET_THUMBV7M_NONE_EABI_RUSTFLAGS='--cfg cortex_m_core="cortex_m3_r1p1" --cfg stm32_mcu="stm32f102"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7m-none-eabi
	CARGO_TARGET_THUMBV7M_NONE_EABI_RUSTFLAGS='--cfg cortex_m_core="cortex_m3_r1p1" --cfg stm32_mcu="stm32f103"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7m-none-eabi
	CARGO_TARGET_THUMBV7M_NONE_EABI_RUSTFLAGS='--cfg cortex_m_core="cortex_m3_r1p1" --cfg stm32_mcu="stm32f107"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7m-none-eabi
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32f401"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32f405"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32f407"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32f410"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32f411"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32f412"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32f413"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32f427"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32f429"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32f446"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32f469"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32l4x1"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32l4x2"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32l4x3"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32l4x5"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32l4x6"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32l4r5"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32l4s5"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32l4r7"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32l4s7"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32l4r9"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf
	CARGO_TARGET_THUMBV7EM_NONE_EABIHF_RUSTFLAGS='--cfg cortex_m_core="cortex_m4f_r0p1" --cfg stm32_mcu="stm32l4s9"' cargo check --package drone-stm32-map --features "{{features}}" --target thumbv7em-none-eabihf

# Generate the docs
doc:
	cargo doc --package drone-stm32-map-svd
	cargo doc --target {{build_target}} --features "{{features}}" --package drone-stm32-map

# Open the docs in a browser
doc-open: doc
	cargo doc --target {{build_target}} --features "{{features}}" --package drone-stm32-map --open

# Update README.md
readme:
	cargo readme -o README.md

# Bump crate versions
version-bump version drone-core-version drone-cortex-m-version drone-svd-version:
	sed -i "s/\(api\.drone-os\.com\/drone-stm32-map\/\)[0-9]\+\(\.[0-9]\+\)\+/\1$(echo {{version}} | sed 's/\(.*\)\.[0-9]\+/\1/')/" \
		Cargo.toml src/pieces/*/Cargo.toml src/pieces/Cargo.toml src/periph/*/Cargo.toml svd/Cargo.toml src/lib.rs
	sed -i '/\[.*\]/h;/version = ".*"/{x;s/\[package\]/version = "{{version}}"/;t;x}' \
		Cargo.toml src/pieces/*/Cargo.toml src/pieces/Cargo.toml src/periph/*/Cargo.toml svd/Cargo.toml
	sed -i '/\[.*\]/h;/version = "=.*"/{x;s/\[.*drone-stm32-map-.*\]/version = "={{version}}"/;t;x}' \
		Cargo.toml src/pieces/*/Cargo.toml src/pieces/Cargo.toml src/periph/*/Cargo.toml
	sed -i '/\[.*\]/h;/version = ".*"/{x;s/\[.*drone-core\]/version = "{{drone-core-version}}"/;t;x}' \
		Cargo.toml src/pieces/*/Cargo.toml src/pieces/Cargo.toml src/periph/*/Cargo.toml
	sed -i '/\[.*\]/h;/version = ".*"/{x;s/\[.*drone-cortex-m\]/version = "{{drone-cortex-m-version}}"/;t;x}' \
		Cargo.toml src/pieces/*/Cargo.toml src/pieces/Cargo.toml src/periph/*/Cargo.toml
	sed -i '/\[.*\]/h;/version = ".*"/{x;s/\[.*drone-svd\]/version = "{{drone-svd-version}}"/;t;x}' \
		svd/Cargo.toml
	sed -i 's/\(drone-stm32-map.*\)version = "[^"]\+"/\1version = "{{version}}"/' \
		src/lib.rs

# Publish to crates.io
publish:
	cd svd && cargo publish
	sleep 5
	cd src/pieces/1 && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/pieces/2 && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/pieces/3 && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/pieces/4 && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/pieces/5 && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/pieces/6 && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/pieces/7 && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/pieces/8 && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/pieces/9 && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/pieces/10 && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/pieces/11 && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/pieces/12 && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/pieces && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/periph/adc && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/periph/dma && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/periph/exti && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/periph/gpio && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/periph/i2c && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/periph/rtc && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/periph/spi && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/periph/tim && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cd src/periph/uart && cargo publish --target {{build_target}} --features "{{features}}"
	sleep 5
	cargo publish --target {{build_target}} --features "{{features}}"

# Publish the docs to api.drone-os.com
publish-doc: doc
	dir=$(sed -n 's/.*api\.drone-os\.com\/\(.*\)"/\1/;T;p' Cargo.toml) \
		&& rm -rf ../drone-api/$dir \
		&& cp -rT target/doc ../drone-api/$dir \
		&& cp -rT target/{{build_target}}/doc ../drone-api/$dir \
		&& echo '<!DOCTYPE html><meta http-equiv="refresh" content="0; URL=./drone_stm32_map">' > ../drone-api/$dir/index.html \
		&& cd ../drone-api && git add $dir && git commit -m "Docs for $dir"
