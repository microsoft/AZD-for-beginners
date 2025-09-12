<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T19:48:16+00:00",
  "source_file": "workshop/README.md",
  "language_code": "tr"
}
-->
# AZD for AI Geliştiricileri Atölyesi

**Önceki:** [AI Sorun Giderme Kılavuzu](../docs/troubleshooting/ai-troubleshooting.md) | **Sonraki:** [Atölye Lab Modülleri](../../../workshop)

Azure Developer CLI (AZD) ile AI uygulamalarını dağıtmayı öğrenmek için düzenlenen uygulamalı atölyeye hoş geldiniz. Bu atölye, AZD temellerinden başlayarak üretime hazır AI çözümleri dağıtmaya kadar sizi yönlendirmek için tasarlanmıştır.

## Atölye Genel Bakış

**Süre:** 2-3 saat  
**Seviye:** Başlangıçtan Orta seviyeye  
**Ön Koşullar:** Azure, komut satırı araçları ve AI kavramları hakkında temel bilgi

### Öğrenecekleriniz

- **AZD Temelleri**: AZD ile Kod Olarak Altyapıyı Anlama
- 🤖 **AI Servis Entegrasyonu**: Azure OpenAI, AI Search ve diğer AI servislerini dağıtma
- **Konteyner Dağıtımı**: AI uygulamaları için Azure Container Apps kullanımı
- **Güvenlik En İyi Uygulamaları**: Yönetilen Kimlik ve güvenli yapılandırmalar uygulama
- **İzleme ve Görünürlük**: AI iş yükleri için Application Insights kurma
- **Üretim Kalıpları**: Kurumsal düzeyde dağıtım stratejileri

## Atölye Yapısı

### Modül 1: AZD Temelleri (30 dakika)
- AZD'nin kurulumu ve yapılandırılması
- AZD proje yapısını anlama
- İlk AZD dağıtımınız
- **Lab**: Basit bir web uygulaması dağıtın

### Modül 2: Azure OpenAI Entegrasyonu (45 dakika)
- Azure OpenAI kaynaklarını kurma
- Model dağıtım stratejileri
- API erişimi ve kimlik doğrulama yapılandırması
- **Lab**: GPT-4 ile bir sohbet uygulaması dağıtın

### Modül 3: RAG Uygulamaları (45 dakika)
- Azure AI Search entegrasyonu
- Azure Document Intelligence ile belge işleme
- Vektör gömme ve anlamsal arama
- **Lab**: Bir belge Soru-Cevap sistemi oluşturun

### Modül 4: Üretim Dağıtımı (30 dakika)
- Container Apps yapılandırması
- Ölçeklendirme ve performans optimizasyonu
- İzleme ve günlük kaydı
- **Lab**: Görünürlük ile üretime dağıtım yapın

### Modül 5: İleri Düzey Kalıplar (15 dakika)
- Çoklu ortam dağıtımları
- CI/CD entegrasyonu
- Maliyet optimizasyon stratejileri
- **Kapanış**: Üretim hazırlık kontrol listesi

## Ön Koşullar

### Gerekli Araçlar

Lütfen atölyeden önce bu araçları yükleyin:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Azure Hesap Kurulumu

1. **Azure Aboneliği**: [Ücretsiz kaydolun](https://azure.microsoft.com/free/)  
2. **Azure OpenAI Erişimi**: [Erişim talep edin](https://aka.ms/oai/access)  
3. **Gerekli İzinler**:
   - Abonelik veya kaynak grubunda Katkıda Bulunan rolü
   - Kullanıcı Erişim Yöneticisi (RBAC atamaları için)

### Ön Koşulları Doğrulama

Kurulumunuzu doğrulamak için bu komutu çalıştırın:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## Atölye Materyalleri

### Lab Egzersizleri

Her modül, başlangıç kodu ve adım adım talimatlarla uygulamalı lab içerir:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - İlk AZD dağıtımınız  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Azure OpenAI ile sohbet uygulaması  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - AI Search ile RAG uygulaması  
- **[lab-4-production/](../../../workshop/lab-4-production)** - Üretim dağıtım kalıpları  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - İleri düzey dağıtım senaryoları  

### Referans Materyaller

- **[AI Foundry Entegrasyon Kılavuzu](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Kapsamlı entegrasyon kalıpları  
- **[AI Model Dağıtım Kılavuzu](../docs/ai-foundry/ai-model-deployment.md)** - Model dağıtım en iyi uygulamaları  
- **[Üretim AI Uygulamaları](../docs/ai-foundry/production-ai-practices.md)** - Kurumsal dağıtım kalıpları  
- **[AI Sorun Giderme Kılavuzu](../docs/troubleshooting/ai-troubleshooting.md)** - Yaygın sorunlar ve çözümler  

### Örnek Şablonlar

Yaygın AI senaryoları için hızlı başlangıç şablonları:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Başlarken

### Seçenek 1: GitHub Codespaces (Önerilen)

Atölyeye başlamak için en hızlı yol:

[![GitHub Codespaces'te Aç](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Seçenek 2: Yerel Geliştirme

1. **Atölye deposunu klonlayın:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Azure'a giriş yapın:**
```bash
az login
azd auth login
```

3. **Lab 1 ile başlayın:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Seçenek 3: Eğitmenli Atölye

Eğitmenli bir oturuma katılıyorsanız:

- 🎥 **Atölye Kaydı**: [Talep üzerine mevcut](https://aka.ms/azd-ai-workshop)  
- 💬 **Discord Topluluğu**: [Canlı destek için katılın](https://aka.ms/foundry/discord)  
- **Atölye Geri Bildirimi**: [Deneyiminizi paylaşın](https://aka.ms/azd-workshop-feedback)  

## Atölye Zaman Çizelgesi

### Kendi Kendine Öğrenme (3 saat)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Eğitmenli Oturum (2.5 saat)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## Başarı Kriterleri

Atölye sonunda şunları yapabileceksiniz:

✅ **AI uygulamaları dağıtın** AZD şablonlarını kullanarak  
✅ **Azure OpenAI'yi yapılandırın** uygun güvenlik ile  
✅ **RAG uygulamaları oluşturun** Azure AI Search entegrasyonu ile  
✅ **Üretim kalıplarını uygulayın** kurumsal AI iş yükleri için  
✅ **AI uygulama dağıtımlarını izleyin ve sorun giderin**  
✅ **Maliyet optimizasyonu stratejilerini uygulayın** AI iş yükleri için  

## Topluluk ve Destek

### Atölye Sırasında

- 🙋 **Sorular**: Atölye sohbetini kullanın veya el kaldırın  
- 🐛 **Sorunlar**: [Sorun giderme kılavuzunu](../docs/troubleshooting/ai-troubleshooting.md) kontrol edin  
- **İpuçları**: Diğer katılımcılarla keşiflerinizi paylaşın  

### Atölye Sonrasında

- 💬 **Discord**: [Azure AI Foundry Topluluğu](https://aka.ms/foundry/discord)  
- **GitHub Sorunları**: [Şablon sorunlarını bildirin](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **Geri Bildirim**: [Atölye değerlendirme formu](https://aka.ms/azd-workshop-feedback)  

## Sonraki Adımlar

### Öğrenmeye Devam Edin

1. **İleri Düzey Senaryolar**: [Çok bölgeli dağıtımları](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment) keşfedin  
2. **CI/CD Entegrasyonu**: [GitHub Actions iş akışlarını](../docs/deployment/github-actions.md) kurun  
3. **Özel Şablonlar**: Kendi [AZD şablonlarınızı](../docs/getting-started/custom-templates.md) oluşturun  

### Projelerinizde Uygulayın

1. **Değerlendirme**: [Hazırlık kontrol listemizi](./production-readiness-checklist.md) kullanın  
2. **Şablonlar**: [AI'ye özel şablonlarımızla](../../../workshop/templates) başlayın  
3. **Destek**: [Azure AI Foundry Discord'a](https://aka.ms/foundry/discord) katılın  

### Başarılarınızı Paylaşın

- ⭐ **Depoyu yıldızlayın** eğer bu atölye size yardımcı olduysa  
- 🐦 **Sosyal medyada paylaşın** #AzureDeveloperCLI #AzureAI ile  
- 📝 **Bir blog yazısı yazın** AI dağıtım yolculuğunuz hakkında  

---

## Atölye Geri Bildirimi

Geri bildiriminiz, atölye deneyimini geliştirmemize yardımcı olur:

| Alan | Derecelendirme (1-5) | Yorumlar |
|------|----------------------|----------|
| İçerik Kalitesi | ⭐⭐⭐⭐⭐ | |
| Uygulamalı Lablar | ⭐⭐⭐⭐⭐ | |
| Dokümantasyon | ⭐⭐⭐⭐⭐ | |
| Zorluk Seviyesi | ⭐⭐⭐⭐⭐ | |
| Genel Deneyim | ⭐⭐⭐⭐⭐ | |

**Geri bildirim gönderin**: [Atölye Değerlendirme Formu](https://aka.ms/azd-workshop-feedback)

---

**Önceki:** [AI Sorun Giderme Kılavuzu](../docs/troubleshooting/ai-troubleshooting.md) | **Sonraki:** [Lab 1: AZD Temelleri ile başlayın](../../../workshop/lab-1-azd-basics)

**AZD ile AI uygulamaları oluşturmaya hazır mısınız?**

[Lab 1: AZD Temelleri ile başlayın →](./lab-1-azd-basics/README.md)

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalardan sorumlu değiliz.