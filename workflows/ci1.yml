name: Godot CI

on:
  pull_request:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Setup Godot
        uses: firebelley/godot-headless-action@v2
        with:
          godot-version: "4.0"

      - name: Verify Godot install
        run: godot4 --version

      - name: Check GDScript syntax
        run: godot4 --headless --path . --script-check

      - name: Run minimal test
        run: godot4 --headless --path . --script tests/test_smoke.gd
