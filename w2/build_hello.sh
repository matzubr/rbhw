echo "-- hello.s"
clang -no-pie hello.s -o hello && ./hello
echo $?
echo "-- hello_syscal.s"
clang -nostdlib -no-pie hello_syscal.s -o hello_syscal && ./hello_syscal
echo $?
