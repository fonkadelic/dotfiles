#! /bin/sh

echo "Hello!"

test ()
{
	echo "Positional parameter 1 in the function is $1."
	RETURN_VALUE=$?
	echo "The exit code of this function is $RETURN_VALUE."
}
