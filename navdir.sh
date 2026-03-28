#navdir command
navdir() {
    path="/mnt/d"
    selected=""

    while true; do
        selected=$( (echo ".."; ls "$path"; echo "quit") | fzf --reverse --cycle )

        if [[ "$selected" == ".." && "$path" != "/mnt/d" ]]; then
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
