# Bölüm 1: Temeller & Hızlı Başlangıç

**📚 Kurs**: [Yeni Başlayanlar için AZD](../../README.md) | **⏱️ Süre**: 30-45 dakika | **⭐ Zorluk**: Başlangıç

---

## Genel Bakış

Bu bölüm Azure Developer CLI (azd) temel bilgilerini tanıtır. Temel kavramları öğrenecek, araçları kuracak ve ilk uygulamanızı Azure'a dağıtacaksınız.

> Temmuz 2026'da `azd 1.27.1` sürümü ile doğrulanmıştır.

## Öğrenme Hedefleri

Bu bölümü tamamladığınızda:
- Azure Developer CLI'nın ne olduğunu ve Azure CLI'dan nasıl farklılaştığını anlayacaksınız
- Platformunuza AZD'yi kurup yapılandıracaksınız
- `azd up` ile ilk uygulamanızı Azure'a dağıtacaksınız
- `azd down` komutuyla kaynakları temizleyeceksiniz

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [AZD Temelleri](azd-basics.md) | Temel kavramlar, terimler ve proje yapısı | 15 dk |
| 2 | [Kurulum & Ayar](installation.md) | Platforma özel kurulum rehberleri | 10 dk |
| 3 | [İlk Projeniz](first-project.md) | Pratik: Bir web uygulamasını Azure'a dağıtın | 20 dk |
| 4 | [Kendi Uygulamanızı Getirin](bring-your-own-app.md) | Sahip olduğunuz mevcut projeye azd ekleyin | 15 dk |
| 5 | [Geliştirici Konteynerleri & Codespaces](dev-containers.md) | Geliştirici konteynerleri ile tekrarlanabilir azd ortamları | 15 dk |

---

## ✅ Buradan Başlayın: Kurulumunuzu Doğrulayın

Başlamadan önce, yerel bilgisayarınızın Bölüm 1 şablonu için hazır olduğunu doğrulayın:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Eğer betik eksik araçlar bildiriyorsa, önce onları düzeltin, sonra bölüme devam edin.

---

## 🚀 Hızlı Başlangıç

```bash
# Kurulumu kontrol et
azd version

# AZD için kimlik doğrulaması yap
# İsteğe bağlı: Azure CLI komutlarını doğrudan çalıştırmayı planlıyorsanız az login yapın
azd auth login

# İlk uygulamanızı dağıtın
azd init --template todo-nodejs-mongo
azd up

# İşiniz bittiğinde temizlik yapın
azd down --force --purge
```

---

## ✅ Başarı Kriterleri

Bu bölümü tamamladıktan sonra yapabilmelisiniz:

```bash
azd version              # Yüklenen sürümü gösterir
azd init --template todo-nodejs-mongo  # Projeyi başlatır
azd up                   # Azure'a dağıtır
azd show                 # Çalışan uygulama URL'sini gösterir
azd down --force --purge # Kaynakları temizler
```

---

## 🔗 Gezinme

| Yön | Bölüm |
|-----------|---------|
| **Sonraki** | [Bölüm 2: Yapay Zeka Öncelikli Geliştirme](../chapter-02-ai-development/README.md) |
| **Atla** | [Bölüm 3: Yapılandırma](../chapter-03-configuration/README.md) |

---

## 📖 İlgili Kaynaklar

- [Komut Hile Sayfası](../../resources/cheat-sheet.md)
- [SSS](../../resources/faq.md)
- [Sözlük](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->