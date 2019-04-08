PATH=$PATH:~/bin

cd() {
    builtin cd "$@" && ls -lA
}