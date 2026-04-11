# Bölüm 1: Temel & Hızlı Başlangıç

**📚 Kurs**: [AZD Yeni Başlayanlar İçin](../../README.md) | **⏱️ Süre**: 30-45 dakika | **⭐ Zorluk**: Başlangıç

---

## Genel Bakış

Bu bölüm Azure Developer CLI (azd) temel bilgilerini tanıtır. Temel kavramları öğrenecek, araçları kuracak ve ilk uygulamanızı Azure'a dağıtacaksınız.

> Mart 2026'da `azd 1.23.12` ile doğrulanmıştır.

## Öğrenme Hedefleri

Bu bölümü tamamladığınızda şunları yapabileceksiniz:
- Azure Developer CLI'nin ne olduğunu ve Azure CLI'den nasıl farklı olduğunu anlayacaksınız
- Platformunuzda AZD'yi yükleyecek ve yapılandıracaksınız
- İlk uygulamanızı `azd up` ile Azure'a dağıtacaksınız
- Kaynakları `azd down` ile temizleyeceksiniz

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [AZD Temelleri](azd-basics.md) | Temel kavramlar, terminoloji ve proje yapısı | 15 dk |
| 2 | [Kurulum ve Ayarlar](installation.md) | Platforma özel kurulum kılavuzları | 10 dk |
| 3 | [İlk Projeniz](first-project.md) | Uygulamalı: Bir web uygulamasını Azure'a dağıtma | 20 dk |

---

## ✅ Buradan Başlayın: Kurulumu Doğrulayın

Başlamadan önce, yerel makinenizin Bölüm 1 şablonu için hazır olduğunu doğrulayın:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Betik eksik araçlar bildiriyorsa, önce bunları düzeltin ve sonra bölüme devam edin.

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

# İşiniz bittiğinde temizleyin
azd down --force --purge
```

---

## ✅ Başarı Kriterleri

Bu bölümü tamamladıktan sonra şunları yapabiliyor olmalısınız:

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
| **Sonraki** | [Bölüm 2: Yapay Zeka-Öncelikli Geliştirme](../chapter-02-ai-development/README.md) |
| **Atla** | [Bölüm 3: Yapılandırma](../chapter-03-configuration/README.md) |

---

## 📖 İlgili Kaynaklar

- [Komut Hızlı Başvuru](../../resources/cheat-sheet.md)
- [SSS](../../resources/faq.md)
- [Terimler Sözlüğü](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge [Co-op Translator](https://github.com/Azure/co-op-translator) adlı Yapay Zeka çeviri hizmeti kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hata veya yanlışlıklar içerebileceğinin farkında olun. Orijinal belge, kendi ana dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucunda ortaya çıkan herhangi bir yanlış anlama veya yanlış yorumlamadan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->