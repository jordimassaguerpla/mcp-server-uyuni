if [ ! -d release/py_patches ];then
	mkdir -p release/py_patches
fi
if [ -f release/py_patches/last_fix ];then
	. release/py_patches/last_fix
	echo "last commit: $LAST_COMMIT"
	echo "next number: $NEXT_NUMBER"
	git format-patch $LAST_COMMIT -o release/py_patches/ --start-number $NEXT_NUMBER  -- '*.py'
else
	git format-patch --root -o release/py_patches -- '*.py'
fi
echo "Review patches in release/patches"
echo "Update release/patches/last_fix"

