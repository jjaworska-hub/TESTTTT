#!/bin/bash

mkdir	Powtorzenie/Kartki_swiateczne/Pieski
	Powtorzenie/Kartki_swiateczne/Kotki
	Powtorzenie/Pozostale/Listy_zakupowe/Swieta_2022
	Powtorzenie/Pozostale/Listy_zakupowe/Swieta_2023
	Powtorzenie/Pozostale/Przepisy
	Powtorzenie/Prace_domowe
	Powtorzenie/Zadania


if [[ "$1" != "2022" && "$1" != "2023" ]]; then
 echo "Blad. Pierwszy parametr musi byc rokiem (2022 lub 2023)."
 exit 1
fi

if ! [[ "$2" =~ ^[0-9]+$ ]] || ! [[ "$3" =~ ^[0-9]+$ ]]; then
 echo "Blad. Drugi i trzeci parametr musza byc numeryczne."
 exit 1
fi

plik_lista_zakupow="Powtorzenie/Pozostale/Przepisy/plik_lista_zakupow.txt"
ciezkie_zakupy="Powtorzenie/Pozostale/Listy_zakupowe/ciezkie_zakupy.txt"
wybrane_zakupy="Powtorzenie/Pozostale/Listy_zakupowe/wybrane_zakupy.txt"

touch "$plik_lista_zakupow"
touch "$ciezkie_zakupy"
touch "$wybrane_zakupy"

lista_zakupow="świeża mięta
1 kg jabłek
1 kg cytryn
500 g kiszonej kapusty
1 mała główka świeżej kapusty
80 g suszonych, leśnych grzybów
200 g suszonych jabłek, śliwek, gruszek
4 kg ziemniaków
500 g drobnej, białej fasoli
bułka tarta
1 kg cukru
1 l barszczu w kartonie"

echo "$lista_zakupow" > "plik_lista_zakupow"

if [[ "$1" == "2022" ]]; then
 mv "$plik_lista_zakupow" "Powtorzenie/Pozostale/Listy_zakupowe/Swieta_2022/"
elif [[ "$1" == "2023" ]]; then
 mv "$plik_lista_zakupow" "Powtorzenie/Pozostale/Listy_zakupowe/Swieta_2023/"
fi

grep -E "^[0-9]+ kg|^[0-9]+ l" "$plik_lista_zakupowa" > "$ciezkie_zakupy" 

{
 head -n "$2" "$ciezkie_zakupy"
 tail -n "$3" "$ciezkie_zakupy"
} > "$wybrane_zakupy"

data=$(date +%Y-%m-%d)
archiwum="Powtorzenie_${data}_s33708.tar.gz"
tar -czf "$archiwum" Powtorzenie/*

echo "Skrytp wykonany poprawnie i zarchiwizowany."
