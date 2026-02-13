# Bölüm 1: Temel ve Hızlı Başlangıç

**📚 Kurs**: [AZD Yeni Başlayanlar İçin](../../README.md) | **⏱️ Süre**: 30-45 dakika | **⭐ Zorluk**: Başlangıç

---

## Genel Bakış

Bu bölüm Azure Developer CLI (azd) temel kavramlarını tanıtır. Temel kavramları öğrenecek, araçları kuracak ve ilk uygulamanızı Azure'a dağıtacaksınız.

## Öğrenme Hedefleri

Bu bölümü tamamladıktan sonra şunları yapabileceksiniz:
- Azure Developer CLI'nin ne olduğunu ve Azure CLI'dan nasıl farklı olduğunu anlayacaksınız
- Platformunuzda AZD'yi yükleyip yapılandıracaksınız
- İlk uygulamanızı `azd up` ile Azure'a dağıtacaksınız
- Kaynakları `azd down` ile temizleyeceksiniz

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [AZD Temelleri](azd-basics.md) | Temel kavramlar, terminoloji ve proje yapısı | 15 dk |
| 2 | [Kurulum ve Ayarlar](installation.md) | Platforma özgü kurulum kılavuzları | 10 dk |
| 3 | [İlk Projeniz](first-project.md) | Uygulamalı: Azure'a bir web uygulaması dağıtma | 20 dk |

---

## 🚀 Hızlı Başlangıç

```bash
# Kurulumu kontrol et
azd version

# Azure'a giriş yap
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
| **Sonraki** | [Bölüm 2: AI-Öncelikli Geliştirme](../chapter-02-ai-development/README.md) |
| **Atla** | [Bölüm 3: Yapılandırma](../chapter-03-configuration/README.md) |

---

## 📖 İlgili Kaynaklar

- [Komut Hızlı Başvuru](../../resources/cheat-sheet.md)
- [SSS](../../resources/faq.md)
- [Sözlük](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Sorumluluk Reddi:
Bu belge, yapay zeka çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kaynak dilindeki hâliyle yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucunda ortaya çıkabilecek herhangi bir yanlış anlama veya yanlış yorumlamadan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->