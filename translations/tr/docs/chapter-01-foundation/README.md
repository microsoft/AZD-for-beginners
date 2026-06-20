# Bölüm 1: Temel ve Hızlı Başlangıç

**📚 Kurs**: [AZD Yeni Başlayanlar](../../README.md) | **⏱️ Süre**: 30-45 dakika | **⭐ Zorluk**: Başlangıç

---

## Genel Bakış

Bu bölüm Azure Developer CLI (azd) temellerini tanıtır. Temel kavramları öğrenecek, araçları yükleyecek ve ilk uygulamanızı Azure'a dağıtacaksınız.

> Haziran 2026'da `azd 1.25.6` ile doğrulanmıştır.

## Öğrenme Hedefleri

Bu bölümü tamamladıktan sonra şunları yapabileceksiniz:
- Azure Developer CLI'nin ne olduğunu ve Azure CLI'den nasıl farklı olduğunu anlayın
- Platformunuzda AZD'yi yükleyin ve yapılandırın
- `azd up` ile ilk uygulamanızı Azure'a dağıtın
- `azd down` ile kaynakları temizleyin

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [AZD Temelleri](azd-basics.md) | Temel kavramlar, terminoloji ve proje yapısı | 15 dk |
| 2 | [Yükleme ve Kurulum](installation.md) | Platforma özel kurulum rehberleri | 10 dk |
| 3 | [İlk Projeniz](first-project.md) | Uygulamalı: Bir web uygulamasını Azure'a dağıtın | 20 dk |
| 4 | [Kendi Uygulamanızı Getirme](bring-your-own-app.md) | Zaten sahip olduğunuz mevcut bir projeye azd ekleyin | 15 dk |
| 5 | [Geliştirici Konteynerleri ve Codespaces](dev-containers.md) | Dev konteynerleri ile tekrarlanabilir azd ortamları | 15 dk |

---

## ✅ Buradan Başlayın: Kurulumunuzu Doğrulayın

Başlamadan önce, yerel makinenizin Bölüm 1 şablonu için hazır olduğunu doğrulayın:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If the script reports missing tools, fix those first and then continue with the chapter.

---

## 🚀 Hızlı Başlangıç

```bash
# Kurulumu kontrol et
azd version

# AZD için kimlik doğrulaması yap
# İsteğe bağlı: Azure CLI komutlarını doğrudan çalıştırmayı planlıyorsanız 'az login'
azd auth login

# İlk uygulamanızı dağıtın
azd init --template todo-nodejs-mongo
azd up

# İşiniz bittiğinde temizleyin
azd down --force --purge
```

---

## ✅ Başarı Kriterleri

Bu bölümü tamamladıktan sonra şunları yapabilmelisiniz:

```bash
azd version              # Yüklü sürümü gösterir
azd init --template todo-nodejs-mongo  # Projeyi başlatır
azd up                   # Azure'a dağıtır
azd show                 # Çalışan uygulamanın URL'sini gösterir
azd down --force --purge # Kaynakları temizler
```

---

## 🔗 Gezinme

| Yön | Bölüm |
|-----------|---------|
| **Sonraki** | [Bölüm 2: Yapay Zeka Odaklı Geliştirme](../chapter-02-ai-development/README.md) |
| **Atla** | [Bölüm 3: Yapılandırma](../chapter-03-configuration/README.md) |

---

## 📖 İlgili Kaynaklar

- [Komut Hızlı Başvuru](../../resources/cheat-sheet.md)
- [SSS](../../resources/faq.md)
- [Terimler Sözlüğü](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->