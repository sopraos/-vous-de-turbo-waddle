# Changer le message d'accueil
set fish_greeting ""

# Titre Terminal
#function fish_title; end; funcsave fish_title
function fish_title
	echo "Wadzaa Inc."
end

# THEME #
set fish_function_path /Users/sopraos/.config/fish/functions/theme $fish_function_path

# Alias
alias phpd "php -S localhost:8000 -ddisplay_errors=1"
