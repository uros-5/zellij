function zr () { zellij run --name "$*" -- zsh -ic "$*";}
function zrf () { zellij run --name "$*" --floating -- zsh -ic "$*";}
function zri () { zellij run --name "$*" --in-place -- zsh -ic "$*";}
function ze () { zellij edit "$*";}
function zef () { zellij edit --floating "$*";}
function zei () { zellij edit --in-place "$*";}
function zpipe () { 
  if [ -z "$1" ]; then
    zellij pipe;
  else 
    zellij pipe -p $1;
  fi
}

function _zellij_layouts() {
    local -a layouts
    
    layout=$(zellij setup --dump-config | awk 'match($0, /layout_dir.*"(.*)"/, l) {print l[1]}')
    [[ $layout = "/path/to/my/layout_dir" ]] && layout=".config/zellij/layouts"

    layouts=()
    layouts+=($(ls $layout 2>/dev/null | xargs -n1 basename | cut -d. -f1 ))

    _describe '_zellij_layouts' layouts
    
}
