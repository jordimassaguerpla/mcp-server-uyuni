mkdir -p release/py_patches
git format-patch --root -o release/py_patches -- '*.py'
