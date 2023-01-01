#!/bin/bash

kullaniciAdi="furkan"
sifre="12345"

function sifreEkrani (){
	ENTRY=`zenity --password --title="Ogrenci Kayit Programi" --width 700 --height 500 --username --ok-label="Giris Yap" --cancel-label="Cikis"`

	case $? in
        0)
	 		if [ `echo $ENTRY | cut -d'|' -f1` == $kullaniciAdi -a `echo $ENTRY | cut -d'|' -f2` == $sifre ]
			then
				anaMenu
			else
				zenity --error --title "Hata Mesaji" --width 500 --height 100 \
                       --text "Kullanici adini veya sifreyi yanlis girdiniz! Tekrar deneyiniz."
					   sifreEkrani
			fi;;
        1) exit ;;
	esac
}

function anaMenu (){

	secimler=("Ogrenci Ekle" "Ogrenci Ara" "Ogrenci Kaydi Sil" "Tum Ogrencileri Listele" "Cikis Yap")

	while secim=$(zenity --title="Ogrenci Kayit Programi" --width 700 --height 500 --ok-label="Sec" --cancel-label="Cikis" --text="Hosgeldin $kullaniciAdi" --list \
				--column="Islemler" "${secimler[@]}")
	do
		if [[ "$?" != 0 ]]; then
			exit 1
		fi	
		case "$secim" in
			"${secimler[0]}") ogrenciEkle break;;
			"${secimler[1]}") ogrenciAra break;;
			"${secimler[2]}") ogrenciSil break;;
			"${secimler[3]}") ogrencileriListele break;;
			"${secimler[4]}")
				zenity --question \
				--width 300 \
			    --height 80 \
				--text="Cikmak istediginize emin misiniz?"
				case $? in
					0) exit 1 ;;
					1) anaMenu ;;
					*)
						zenity --error \
						--title="Hata Mesaji" \
						--text="Beklenmedik bir hata olustu !" ;;
				esac		
			;;
			*) zenity --error --title "Hata Mesaji" --width 300 \
                       --height 80 \
                       --text "Herhangi bir islem secmediniz !";;
		esac
	done
}

function ogrenciEkle (){

	yeniOgrenci=`zenity --forms --title="Yeni Ogrenci Kayit" --width 700 --height 500 --ok-label="Ekle" --cancel-label="Geri" \
       --text "Ogrenci bilgilerinizi giriniz." --separator="," \
	   --add-combo "Okul" --combo-values "Universite" \
       --add-entry "Ogrenci No" --add-entry "Ad" --add-entry "Soyad" \
	   --add-combo "Cinsiyet" --combo-values "Erkek|Kiz" \
	   --add-combo "Bolum" --combo-values "Bilgisayar Muh.|Biyomuhendislik|Cevre Muh.|Elektrik-Elektronik Muh.|Endustri Muh.|Gida Muh.|Insaat Muh.|Isletme|Kimya Muh.|Makine Muh.|Mekatronik Muh.|Orman Muh." \
	   --add-combo "Sinif" --combo-values "Hazirlik Sinifi|1. Sinif|2. Sinif|3. Sinif|4. Sinif|Y. Lisans" \
       --add-calendar "Dogum Tarihi" \ >> ogrenciler.csv`

	   case $? in
			0)
				zenity --info \
						--title "Bilgi Ekrani" \
						--width 300 \
						--height 80 \
						--text "Ogrenci basariyla eklenmistir."
				ogrenciEkle	;;
			1) anaMenu ;;
			*)
				zenity --error \
				--title="Hata Mesaji" \
				--text="Beklenmedik bir hata olustu !"
			;;
		esac
}

function ogrenciSil (){

	silinecekOgrenci=$(cat ogrenciler.csv | tr ',' '\n' | zenity --list --radiolist --cancel-label="Geri" --title="Ogrenciler" --text="" \
	--width 1000 --height 500 --column="" --column="Ogrenci No" --column="Ad" \
	--column="Soyad" --column="Cinsiyet" --column="Bolum" --column="Sinif" --column="Dogum Tarihi")

	case $? in
		0)
			if [ -z "$silinecekOgrenci" ]; then
				zenity --error \
				--title="Hata Mesaji" \
				--text="Silinecek bir ogrenci secmediniz !"
				ogrenciSil
			else
				zenity --question \
				--width 300 \
			    --height 80 \
				--text="Silmek istediginize emin misiniz?"
				case $? in
					0) `grep -v -w $silinecekOgrenci ogrenciler.csv > tmpfile && mv tmpfile ogrenciler.csv`
						
						zenity --info \
								--title "Bilgi Ekrani" \
								--width 300 \
								--height 80 \
								--text "Ogrenci basariyla silinmistir."
						ogrenciSil ;;
					1) ogrenciSil ;;
					*)
						zenity --error \
						--title="Hata Mesaji" \
						--text="Beklenmedik bir hata olustu !" ;;
				esac		
			fi ;;
		1) anaMenu ;;
		*)	zenity --error \
			--title="Hata Mesaji" \
			--text="Beklenmedik bir hata olustu !" ;;
	esac
}

function ogrenciAra (){

	arananOgrenci=$(zenity --entry --title="Ogrenci Ara" --width 500 --height 100 --text="11 haneli ogrenci no giriniz:")		

	case $? in
        0)
			if [ "$arananOgrenci" != "" ] && [ ${#arananOgrenci} -eq 11 ]; then
				( 
				echo "10" ; sleep 0.15
				echo "# Ogrenci araniyor" ; sleep 0.30
				echo "20" ; sleep 0.5
				echo "# Ogrenci araniyor" ; sleep 0.30
				echo "50" ; sleep 0.5
				echo "Ogrenci araniyor" ; sleep 1
				echo "75" ; sleep 0.5
				echo "# Ogrenci araniyor" ; sleep 1
				echo "100" ; sleep 0.5
				) |
				zenity --progress --title="Ogrenci Arama" --width 300 --height 80 --percentage=0 --auto-close \

				if [ "$?" != 0 ] ;
				then
						zenity --error --text="Arama iptal edildi. Ana menuye yonlendiriliyorsunuz !"
						anaMenu
				else
					cat ogrenciler.csv | grep -i "$arananOgrenci" | tr ',' '\n' | zenity --list --cancel-label="Geri"\
					--title="Ogrenci Listesi" \
					--text "" \
					--width 1000 --height 500 --column="Okul" --column="Ogrenci No" --column="Ad" \
					--column="Soyad" --column="Cinsiyet" --column="Bolum" --column="Sinif" --column="Dogum Tarihi"
				fi				
			else
				zenity --error \
				--title="Hata Mesaji" \
				--text="Eksik veya fazla giris yaptiniz. Lütfen 11 haneli okul no giriniz !"
				ogrenciAra	
			fi
		;;
        1) anaMenu;;
		*) zenity --error --title="Hata Mesaji" --text="Beklenmedik bir hata olustu !" ;;
		esac
	anaMenu			
}

function ogrencileriListele (){

	cat ogrenciler.csv | tr ',' '\n' | zenity --list --cancel-label="Geri" --title="Ogrenci Listesi" --text=""\
	--width 1000 --height 500 --column="Okul" --column="Ogrenci No" --column="Ad" \
	--column="Soyad" --column="Cinsiyet" --column="Bolum" --column="Sinif" --column="Dogum Tarihi"

	case $? in
		0) anaMenu ;;
		1) anaMenu ;;
		*)
			zenity --error \
			--title="Hata Mesaji" \
			--text="Beklenmedik bir hata olustu !"
		;;
	esac
}
sifreEkrani
