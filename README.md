# Öğrenci Kayıt Programı
Zenity ve bash script ile kodlanmis, öğrenci kayıt, silme, arama ve listeleme işlemlerini yapabilen bir GUI programdır.

![1](https://user-images.githubusercontent.com/58481075/210172202-80756095-138d-44c2-9aff-ffdf3e52f568.png)

## Başlıklar
<ol>    
        <li><a href="#Uygalama Giriş Ekranı">Uygalama Giriş Ekranı</a></li>
        <li><a href="#Öğrenci Ekle">Öğrenci Ekle</a></li>
        <li><a href="#Öğrenci Ara">Öğrenci Ara</a></li>
        <li><a href="#Öğrenci Kaydı Sil">Öğrenci Kaydı Sil</a></li>
        <li><a href="#Tüm Öğrencileri Listele">Tüm Öğrencileri Listele</a></li>
        <li><a href="#Uygalama Çıkış Ekranı">Uygalama Giriş Ekranı</a></li>
</ol>

## Kurulum ve Çalıştırma
- Uygulamanın çalıştırılması için Linux tabanlı bir işletim sistemine sahip olmalısınız.
- Linux makinenizin içerisinde "Zenity" kurulumu için aşağıdaki adımları takip ediniz.

* `sudo apt-get install -y zenity` komutu ile Zenity'i makinenize kurabilirsiniz.
* Gerekli kütüphaneleri indirdikten sonra proje dosyalarına erişmek ve bunları makinenizde çalıştırmak için aşağıdaki adımları uygulayabilirsiniz:

- ```shell 
  git clone https://github.com/mfurkanolcer/Linux-Zenity-GUI-Student-Registration.git
  ``` 
  komutu ile projeyi kendi makinenize almış olucaksınız.
- ```shell
  cd Linux-Zenity-GUI-Student-Registration
  ```
- ```shell
  bash run.sh
  ```

# Uygulamanın Özellikleri 
- Ana menüden istediğimiz seçeneğe çift tıklayarak veya seçtikten sonra Seç butonunu kullanarak erişebilirsiniz.

## Uygulama Giriş Ekranı

![2](https://user-images.githubusercontent.com/58481075/210172203-94662825-188e-4e1b-a9be-2752d7c7f3c9.png)

- Uygulamayı çalıştırdıktan sonra bizi kullanıcı adı ve şifre ekranı karşılamaktadır.
- Kullanıcı adı ve şifre girişini yaptıktan sonra, herhangi biri yanlış olursa ekrana hata mesajı vermektedir. 
- Doğru kullanıcı adı ve şifre girildikten sonra uygulama ana menüsüne geçiş yapmaktadır. 

## Öğrenci Ekle

![3](https://user-images.githubusercontent.com/58481075/210172205-b480075e-d2f5-4329-bd41-3cf4db0d6f2a.png)

- Öğrenci ekleme kısmında karşımıza öğrenci bilgilerini almak için bir form çıkmaktadır.
- Formda ogrenci no, ad, soyad, cinsiyet, bölüm, sınıf ve doğum tarihi gibi bilgileri alınmaktadır. 
- Bilgiler girildikten sonra ekle butonuna basarak öğrenci veritabanına eklenmiş olucaktır. Eğer geri butonuna basılırsa öğrenci eklenmeden tekrar ana menüye dönülmektedir.

## Öğrenci Ara

![4](https://user-images.githubusercontent.com/58481075/210172208-930674df-f46c-4529-9c67-2994234f0559.png)
 
![5](https://user-images.githubusercontent.com/58481075/210172211-d79b223c-78f2-4a50-8a6a-a38502ff308a.png)

- Öğrenci arama kısmında karşımıza aranmak istenen öğrencinin öğrenci numarasını isteyen bir alan çıkmaktadır.
- Kullanıcı bu alana 11 haneli öğrenci numarasını yazmalıdır. Eksik veya fazla giriş yaptığında uygulama ekrana hata mesajı göstermektedir. 
- 11 haneli giriş yapıldıktan sonra öğrenci aranıyor progress bar ekran görünmektedir.
- Arama tamamlandıktan sonra eğer bulanan öğrenci varsa bilgileri ekranda görüntülenmektedir. Eğer girilen numara ile eşleşen bir öğrenci yoksa boş liste görüntülenmektedir.
- Tamam veya geri butonunu kullanarak tekrar ana menüye dönüş yapılabilmektedir.


## Öğrenci Kaydı Sil 

![6](https://user-images.githubusercontent.com/58481075/210172216-b8cfac6d-41f0-4402-98e1-0f5a1e0cbb8a.png)

- Öğrenci kaydı silme kısmında karşımıza kayıtlı öğrencilerin olduğu bir radiolist çıkmaktadır.
- Silinmesi istenen öğrenci seçildikten sonra ekrana soru mesajı gösterilmektedir. Eğer bu soru onaylanırsa öğrencinin kaydı silinmektedir. 
- Geri butonu kullanılarak tekrar ana menüye dönüş yapılabilmektedir. 


## Tüm Öğrencileri Listele

![7](https://user-images.githubusercontent.com/58481075/210172219-2fd66c77-d9d5-48ed-bdc5-5f438ef407f5.png)

- Tüm öğrencileri listele kısmında karşımıza kayıtlı tüm öğrencilerin listesi çıkmaktadır.
- Tamam veya geri butonuna basarak ana menüye dönüş yapılabilmektedir.

## Uygulama Çıkış Ekranı

![8](https://user-images.githubusercontent.com/58481075/210172224-6650da5f-b0d3-4bc6-a6b8-de6af91e3c6d.png)

- Uygulamadan çıkmaya karar verdiğinizde ana menüden seçim yaparak uygulamadan çıkış yapılabilmektedir.
- Çıkış yapmadan son kez emin misiniz ekranı gelmektedir. Eğer onaylanırsa uygulama kapanmaktadır.



