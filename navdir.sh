#navdir command
navdir() {
    path="$PWD"
    selected=""

    while true; do
        selected=$( (echo ".."; ls "$path"; echo "quit") | fzf --reverse --cycle --prompt="$path: " )

        if [[ "$selected" == ".." && "$path" != "/" ]]; then
            path=$(dirname "$path")

        elif [[ "$selected" == "quit" || -z "$selected" ]]; then
            break

        elif [[ -d "$path/$selected" ]]; then
            path="$path/$selected"

        else
            echo "Invalid directory"
            break
        fi
    done

    cd "$path"
}
