# Bölüm 1: Temel & Hızlı Başlangıç

**📚 Kurs**: [Başlangıç İçin AZD](../../README.md) | **⏱️ Süre**: İlk dağıtım dahil 75-120 dakika; ek alıştırmalar daha uzun sürer | **⭐ Zorluk**: Başlangıç

---

## Genel Bakış

Bu bölüm Azure Developer CLI (azd) temellerini tanıtır. Temel kavramları öğrenecek, araçları kuracak ve ilk uygulamanızı Azure'a dağıtacaksınız.

> Komut ve yapılandırma inceleme hedefi: `azd 1.37.2` (Kasım 2026). İnceleme sırasında canlı Azure sağlama çalıştırılmadı.

## Öğrenme Hedefleri

Bu bölümü tamamlayarak:
- Azure Developer CLI'nin ne olduğunu ve Azure CLI'dan nasıl farklılaştığını anlayacaksınız
- Platformunuzda AZD'yi kurup yapılandıracaksınız
- İlk uygulamanızı Azure'a `azd up` ile dağıtacaksınız
- `azd down` ile kaynakları temizleyeceksiniz

---

## 📚 Dersler

| # | Ders | Açıklama | Süre |
|---|--------|-------------|------|
| 1 | [AZD Temelleri](azd-basics.md) | Temel kavramlar, terminoloji ve proje yapısı | 15 dk |
| 2 | [Kurulum & Ayarlar](installation.md) | Platforma özgü kurulum rehberleri | 10 dk |
| 3 | [İlk Projeniz](first-project.md) | Uygulamalı: Azure'a web uygulaması dağıtımı | 20 dk |
| 4 | [Mevcut Uygulamanızı Getirin](bring-your-own-app.md) | Sahip olduğunuz mevcut bir projeye azd ekleyin | 15 dk |
| 5 | [Geliştirici Konteynerleri & Codespaces](dev-containers.md) | Geliştirici konteynerleri ile çoğaltılabilir azd ortamları | 15 dk |

---

## ✅ Buradan Başlayın: Kurulumunuzu Doğrulayın

Başlamadan önce, yerel bilgisayarınızın Bölüm 1 şablonuna hazır olduğundan emin olun:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Komut dosyası eksik araçları bildirirse, önce bunları düzeltin ve ardından bölüme devam edin.

---

## 🚀 Hızlı Başlangıç

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Başarı Kriterleri

Bu bölümü tamamladıktan sonra şunları yapabilmelisiniz:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigasyon

| Yön | Bölüm |
|-----------|---------|
| **Sonraki** | [Bölüm 2: AI-İlk Geliştirme](../chapter-02-ai-development/README.md) |
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