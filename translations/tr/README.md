<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee9a026a572535444287d531dbd75d78",
  "translation_date": "2025-09-12T19:11:01+00:00",
  "source_file": "README.md",
  "language_code": "tr"
}
-->
# AZD Yeni Başlayanlar İçin

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.tr.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)

![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)

![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)

Bu kaynakları kullanmaya başlamak için aşağıdaki adımları izleyin:
1. **Depoyu Çatallayın**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) bağlantısına tıklayın.
2. **Depoyu Klonlayın**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Azure Discord Topluluklarına Katılın ve uzmanlarla, diğer geliştiricilerle tanışın**](https://discord.com/invite/ByRwuEEgH4)

### Çok Dilli Destek

#### GitHub Action ile Desteklenir (Otomatik ve Her Zaman Güncel)

[Fransızca](../fr/README.md) | [İspanyolca](../es/README.md) | [Almanca](../de/README.md) | [Rusça](../ru/README.md) | [Arapça](../ar/README.md) | [Farsça](../fa/README.md) | [Urduca](../ur/README.md) | [Çince (Basitleştirilmiş)](../zh/README.md) | [Çince (Geleneksel, Macau)](../mo/README.md) | [Çince (Geleneksel, Hong Kong)](../hk/README.md) | [Çince (Geleneksel, Tayvan)](../tw/README.md) | [Japonca](../ja/README.md) | [Korece](../ko/README.md) | [Hintçe](../hi/README.md) | [Bengalce](../bn/README.md) | [Marathi](../mr/README.md) | [Nepalce](../ne/README.md) | [Pencapça (Gurmukhi)](../pa/README.md) | [Portekizce (Portekiz)](../pt/README.md) | [Portekizce (Brezilya)](../br/README.md) | [İtalyanca](../it/README.md) | [Lehçe](../pl/README.md) | [Türkçe](./README.md) | [Yunanca](../el/README.md) | [Tayca](../th/README.md) | [İsveççe](../sv/README.md) | [Danca](../da/README.md) | [Norveççe](../no/README.md) | [Fince](../fi/README.md) | [Felemenkçe](../nl/README.md) | [İbranice](../he/README.md) | [Vietnamca](../vi/README.md) | [Endonezce](../id/README.md) | [Malayca](../ms/README.md) | [Tagalog (Filipince)](../tl/README.md) | [Swahili](../sw/README.md) | [Macarca](../hu/README.md) | [Çekçe](../cs/README.md) | [Slovakça](../sk/README.md) | [Romence](../ro/README.md) | [Bulgarca](../bg/README.md) | [Sırpça (Kiril)](../sr/README.md) | [Hırvatça](../hr/README.md) | [Slovence](../sl/README.md) | [Ukraynaca](../uk/README.md) | [Burmaca (Myanmar)](../my/README.md)

**Ek dil desteği talep etmek isterseniz, desteklenen diller [burada](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md) listelenmiştir.**

## Giriş

Azure Developer CLI (azd) için kapsamlı rehbere hoş geldiniz. Bu depo, öğrencilerden profesyonel geliştiricilere kadar her seviyedeki geliştiricinin Azure Developer CLI'yi öğrenmesi ve bulut dağıtımlarını verimli bir şekilde gerçekleştirmesi için tasarlanmıştır. **Özellikle Azure AI Foundry kullanarak AI uygulamalarını dağıtmaya odaklanmaktadır.** Bu yapılandırılmış öğrenme kaynağı, Azure bulut dağıtımları, yaygın sorunların giderilmesi ve başarılı AZD şablon dağıtımları için en iyi uygulamaları uygulama konusunda pratik deneyim sunar.

### **AI Geliştiricileri İçin Bu Rehber Neden Önemli?**
Azure AI Foundry Discord topluluğunda yapılan son ankete göre, **geliştiricilerin %45'i AI iş yükleri için AZD kullanmakla ilgileniyor** ancak şu zorluklarla karşılaşıyor:
- Karmaşık çok hizmetli AI mimarileri
- Üretim AI dağıtımı için en iyi uygulamalar
- Azure AI hizmet entegrasyonu ve yapılandırması
- AI iş yükleri için maliyet optimizasyonu
- AI'ya özgü dağıtım sorunlarının giderilmesi

## Öğrenme Hedefleri

Bu depoyu çalışarak:
- Azure Developer CLI'nin temel kavramlarını ve ana unsurlarını öğrenin
- Kod olarak Altyapı kullanarak Azure kaynaklarını dağıtmayı ve sağlamayı öğrenin
- Yaygın AZD dağıtım sorunlarını giderme becerileri geliştirin
- Dağıtım öncesi doğrulama ve kapasite planlamayı anlayın
- Güvenlik en iyi uygulamalarını ve maliyet optimizasyon stratejilerini uygulayın
- Azure'a üretime hazır uygulamalar dağıtma konusunda kendinize güven kazanın

## Öğrenme Çıktıları

Bu kursu tamamladıktan sonra:
- Azure Developer CLI'yi başarıyla kurabilir, yapılandırabilir ve kullanabilirsiniz
- AZD şablonlarını kullanarak uygulamalar oluşturabilir ve dağıtabilirsiniz
- Kimlik doğrulama, altyapı ve dağıtım sorunlarını giderebilirsiniz
- Kapasite planlaması ve SKU seçimi dahil olmak üzere dağıtım öncesi kontrolleri gerçekleştirebilirsiniz
- İzleme, güvenlik ve maliyet yönetimi en iyi uygulamalarını uygulayabilirsiniz
- AZD iş akışlarını CI/CD boru hatlarına entegre edebilirsiniz

## İçindekiler

- [Azure Developer CLI Nedir?](../..)
- [Hızlı Başlangıç](../..)
- [Öğrenme Yolu](../..)
  - [AI Geliştiricileri İçin (Buradan Başlayın!)](../..)
  - [Öğrenciler ve Yeni Başlayanlar İçin](../..)
  - [Geliştiriciler İçin](../..)
  - [DevOps Mühendisleri İçin](../..)
- [Dokümantasyon](../..)
  - [Başlarken](../..)
  - [Dağıtım ve Sağlama](../..)
  - [Dağıtım Öncesi Kontroller](../..)
  - [AI ve Azure AI Foundry](../..)
  - [Sorun Giderme](../..)
- [Örnekler ve Şablonlar](../..)
  - [Öne Çıkan: Azure AI Foundry Şablonları](../..)
  - [Öne Çıkan: Azure AI Foundry Uçtan Uca Senaryolar](../..)
  - [Ek AZD Şablonları](../..)
  - [Uygulamalı Laboratuvarlar ve Atölyeler](../..)
- [Kaynaklar](../..)
- [Katkıda Bulunma](../..)
- [Destek](../..)
- [Topluluk](../..)

## Azure Developer CLI Nedir?

Azure Developer CLI (azd), uygulamaları Azure'a hızlı bir şekilde oluşturma ve dağıtma sürecini hızlandıran geliştirici odaklı bir komut satırı arayüzüdür. Şunları sağlar:

- **Şablon tabanlı dağıtımlar** - Yaygın uygulama desenleri için önceden oluşturulmuş şablonlar kullanın
- **Kod olarak Altyapı** - Azure kaynaklarını Bicep veya Terraform ile yönetin
- **Entegre iş akışları** - Uygulamaları sorunsuz bir şekilde sağlama, dağıtma ve izleme
- **Geliştirici dostu** - Geliştirici verimliliği ve deneyimi için optimize edilmiştir

### **AZD + Azure AI Foundry: AI Dağıtımları İçin Mükemmel**

**AI Çözümleri İçin Neden AZD?** AZD, AI geliştiricilerinin karşılaştığı en büyük zorlukları ele alır:

- **AI Hazır Şablonlar** - Azure OpenAI, Cognitive Services ve ML iş yükleri için önceden yapılandırılmış şablonlar
- **Güvenli AI Dağıtımları** - AI hizmetleri, API anahtarları ve model uç noktaları için yerleşik güvenlik desenleri
- **Üretim AI Desenleri** - Ölçeklenebilir, maliyet etkin AI uygulama dağıtımları için en iyi uygulamalar
- **Uçtan Uca AI İş Akışları** - Model geliştirmeden üretim dağıtımına kadar uygun izleme ile
- **Maliyet Optimizasyonu** - AI iş yükleri için akıllı kaynak tahsisi ve ölçeklendirme stratejileri
- **Azure AI Foundry Entegrasyonu** - AI Foundry model kataloğu ve uç noktalarına sorunsuz bağlantı

## Hızlı Başlangıç

### Ön Koşullar
- Azure aboneliği
- Azure CLI yüklü
- Git (şablonları klonlamak için)

### Kurulum
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### İlk Dağıtımınız
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

### İlk AI Dağıtımınız
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```

## Öğrenme Yolu

### AI Geliştiricileri İçin (Buradan Başlayın!)
1. **Hızlı Başlangıç**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) şablonunu deneyin
2. **Temel Bilgileri Öğrenin**: [AZD Temelleri](docs/getting-started/azd-basics.md) + [Azure AI Foundry Entegrasyonu](docs/ai-foundry/azure-ai-foundry-integration.md)
3. **Uygulamalı Pratik**: [AI Atölye Laboratuvarı](docs/ai-foundry/ai-workshop-lab.md) tamamlayın
4. **Üretime Hazır**: [Üretim AI En İyi Uygulamaları](docs/ai-foundry/production-ai-practices.md) inceleyin
5. **İleri Düzey**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat) kurumsal şablonunu dağıtın

### Öğrenciler ve Yeni Başlayanlar İçin
1. [AZD Temelleri](docs/getting-started/azd-basics.md) ile başlayın
2. [Kurulum Kılavuzu](docs/getting-started/installation.md) takip edin
3. [İlk Projenizi](docs/getting-started/first-project.md) tamamlayın
4. [Basit Web Uygulaması Örneği](../../examples/simple-web-app) ile pratik yapın

### Geliştiriciler İçin
1. [Yapılandırma Kılavuzu](docs/getting-started/configuration.md) inceleyin
2. [Dağıtım Kılavuzu](docs/deployment/deployment-guide.md) çalışın
3. [Veritabanı Uygulaması Örneği](../../examples/database-app) üzerinde çalışın
4. [Konteyner Uygulaması Örneği](../../examples/container-app) keşfedin

### DevOps Mühendisleri İçin
1. [Kaynak Sağlama](docs/deployment/provisioning.md) konusunda uzmanlaşın
2. [Ön Kontroller](docs/pre-deployment/preflight-checks.md) uygulayın
3. [Kapasite Planlaması](docs/pre-deployment/capacity-planning.md) pratik yapın
4. İleri Düzey [Mikro Hizmetler Örneği](../../examples/microservices) çalışın

## Dokümantasyon

### Başlarken
- [**AZD Temelleri**](docs/getting-started/azd-basics.md) - Temel kavramlar ve terminoloji
- [**Kurulum ve Ayar**](docs/getting-started/installation.md) - Platforma özel kurulum kılavuzları
- [**Yapılandırma**](docs/getting-started/configuration.md) - Ortam ayarları ve kimlik doğrulama
- [**İlk Projeniz**](docs/getting-started/first-project.md) - Adım adım öğretici

### Dağıtım ve Sağlama
- [**Dağıtım Kılavuzu**](docs/deployment/deployment-guide.md) - Tam dağıtım iş akışları
- [**Kaynak Sağlama**](docs/deployment/provisioning.md) - Azure kaynak yönetimi

### Dağıtım Öncesi Kontroller
- [**Kapasite Planlaması**](docs/pre-deployment/capacity-planning.md) - Azure kaynak kapasite doğrulaması
- [**SKU Seçimi**](docs/pre-deployment/sku-selection.md) - Doğru Azure SKU'larını seçme
- [**Ön Kontroller**](docs/pre-deployment/preflight-checks.md) - Otomatik doğrulama betikleri

### AI ve Azure AI Foundry
- [**Azure AI Foundry Entegrasyonu**](docs/ai-foundry/azure-ai-foundry-integration.md) - AZD'yi Azure AI Foundry hizmetleriyle bağlayın
- [**AI Model Dağıtım Desenleri**](docs/ai-foundry/ai-model-deployment.md) - AZD ile AI modellerini dağıtın ve yönetin
- [**AI Atölye Laboratuvarı**](docs/ai-foundry/ai-workshop-lab.md) - Uygulamalı laboratuvar: AI çözümlerini AZD'ye hazır hale getirme
- [**Üretim AI En İyi Uygulamaları**](docs/ai-foundry/production-ai-practices.md) - AI iş yükleri için güvenlik, ölçeklendirme ve izleme

### Sorun Giderme
- [**Yaygın Sorunlar**](docs/troubleshooting/common-issues.md) - Sık karşılaşılan problemler ve çözümleri
- [**Hata Ayıklama Kılavuzu**](docs/troubleshooting/debugging.md) - Adım adım hata ayıklama stratejileri
- [**AI'ye Özel Sorun Giderme**](docs/troubleshooting/ai-troubleshooting.md) - AI hizmeti ve model dağıtım sorunları

## Örnekler ve Şablonlar

### [Öne Çıkan: Azure AI Foundry Şablonları](https://ai.azure.com/resource/build/templates)
**AI uygulamaları dağıtıyorsanız buradan başlayın!**

| Şablon | Açıklama | Zorluk | Hizmetler |
|----------|-------------|------------|----------|
| [**AI sohbetiyle başlayın**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Apps kullanarak verileriniz ve telemetri içgörülerinizle entegre edilmiş temel bir sohbet uygulaması oluşturun ve dağıtın. |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**AI ajanlarıyla başlayın**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Azure Container Apps kullanarak eylemler ve telemetri içgörülerine sahip temel bir ajan uygulaması oluşturun ve dağıtın. |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Çoklu ajan iş akışı otomasyonu**](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI ajanlarını organize ederek ve yöneterek görev planlamasını ve otomasyonu geliştirin. |⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Verilerinizden belgeler oluşturun**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Verilerinizden ilgili bilgileri bulup özetleyerek sözleşmeler, faturalar ve yatırım teklifleri gibi belgelerin oluşturulmasını hızlandırın. |⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Müşteri toplantılarını ajanlarla iyileştirin**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Eski kodları modern dillere taşıyarak bir ajan ekibinden yararlanın. |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Kodunuzu ajanlarla modernize edin**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Azure Container Apps kullanarak verileriniz ve telemetri içgörülerinizle entegre edilmiş temel bir sohbet uygulaması oluşturun ve dağıtın. |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Konuşma ajanınızı oluşturun**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Gelişmiş konuşma anlayışından yararlanarak belirleyici ve insan kontrollü iş akışlarıyla sohbet botları ve ajanlar oluşturun ve geliştirin. |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Konuşma verilerinden içgörüler elde edin**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Gelişmiş içerik anlama yeteneklerini kullanarak büyük ses ve metin tabanlı veri setlerinden içgörüler elde ederek çağrı merkezi verimliliğini artırın. |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Çok modlu içerik işleme**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Yapılandırılmamış içerikten bilgi çıkararak ve bunu yapılandırılmış bir formata eşleyerek talepler, faturalar, sözleşmeler ve diğer belgeleri hızlı ve doğru bir şekilde işleyin. Bu şablon metin, görüntü, tablo ve grafikleri destekler. |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Öne Çıkan: Azure AI Foundry Uçtan Uca Senaryolar
**AI uygulamaları dağıtıyorsanız buradan başlayın!**

| Şablon | Açıklama | Zorluk | Hizmetler |
|----------|-------------|------------|----------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Azure OpenAI ile basit sohbet arayüzü | ⭐ | AzureOpenAI + Container Apps |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG destekli sohbet uygulaması | ⭐⭐ | AzureOpenAI + Search + App Service |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | AI hizmetleriyle belge analizi | ⭐⭐ | Azure Document Intelligence + Functions |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Fonksiyon çağrısıyla AI ajan çerçevesi | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | AI orkestrasyonu ile kurumsal sohbet | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |

### Ek AZD Şablonları
- [**Örnekler Dizini**](examples/README.md) - Pratik örnekler, şablonlar ve gerçek dünya senaryoları
- [**Azure-Samples AZD Şablonları**](https://github.com/Azure-Samples/azd-templates) - Resmi Microsoft örnek şablonları  
- [**Awesome AZD Galerisi**](https://azure.github.io/awesome-azd/) - Topluluk katkılı şablonlar

### Uygulamalı Laboratuvarlar ve Atölyeler
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - **YENİ**: AI çözümlerinizi AZD ile dağıtılabilir hale getirin
- [**AZD For Beginners Workshop**](workshop/README.md) - AI Agents AZD şablon dağıtımına odaklanın

## Kaynaklar

### Hızlı Referanslar
- [**Komut Hile Sayfası**](resources/cheat-sheet.md) - Temel azd komutları
- [**Sözlük**](resources/glossary.md) - Azure ve azd terminolojisi
- [**SSS**](resources/faq.md) - Sıkça sorulan sorular
- [**Çalışma Kılavuzu**](resources/study-guide.md) - Kapsamlı öğrenme hedefleri ve pratik alıştırmalar

### Harici Kaynaklar
- [Azure Developer CLI Belgeleri](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Mimari Merkezi](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Fiyat Hesaplayıcı](https://azure.microsoft.com/pricing/calculator/)
- [Azure Durumu](https://status.azure.com/)

## Katkıda Bulunma

Katkılarınızı memnuniyetle karşılıyoruz! Lütfen [Katkı Kılavuzumuzu](CONTRIBUTING.md) okuyarak:
- Sorunları ve özellik isteklerini nasıl göndereceğinizi
- Kod katkı yönergelerini
- Belge iyileştirmelerini
- Topluluk standartlarını öğrenin

## Destek

- **Sorunlar**: [Hataları bildirin ve özellik istekleri gönderin](https://github.com/microsoft/azd-for-beginners/issues)
- **Tartışmalar**: [Microsoft Azure Discord Topluluğu Soru-Cevap ve tartışmalar](https://discord.gg/microsoft-azure)
- **AI'ye Özel Destek**: AZD + AI Foundry tartışmaları için [#Azure kanalına katılın](https://discord.gg/microsoft-azure)
- **E-posta**: Özel sorular için
- **Microsoft Learn**: [Resmi Azure Developer CLI belgeleri](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Azure AI Foundry Discord'dan Topluluk İçgörüleri

**#Azure Kanalından Anket Sonuçları:**
- **%45** geliştirici AZD'yi AI iş yükleri için kullanmak istiyor
- **En büyük zorluklar**: Çoklu hizmet dağıtımları, kimlik bilgisi yönetimi, üretim hazırlığı
- **En çok talep edilenler**: AI'ye özel şablonlar, sorun giderme kılavuzları, en iyi uygulamalar

**Topluluğumuza katılarak:**
- AZD + AI deneyimlerinizi paylaşabilir ve yardım alabilirsiniz
- Yeni AI şablonlarının erken önizlemelerine erişebilirsiniz
- AI dağıtım en iyi uygulamalarına katkıda bulunabilirsiniz
- Gelecekteki AI + AZD özellik geliştirmelerine etki edebilirsiniz

## Lisans

Bu proje MIT Lisansı altında lisanslanmıştır - ayrıntılar için [LICENSE](../../LICENSE) dosyasına bakın.

## Diğer Kurslar

Ekibimiz başka kurslar da üretiyor! Göz atın:

- [**YENİ** Model Context Protocol (MCP) For Beginners](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents for Beginners](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI for Beginners using .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI for Beginners](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI for Beginners using Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML for Beginners](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science for Beginners](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI for Beginners](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersecurity for Beginners](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web Dev for Beginners](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT for Beginners](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR Development for Beginners](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot ile AI Eşli Programlama Ustası](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [GitHub Copilot ile C#/.NET Geliştiricileri için Ustalık](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Kendi Copilot Maceranızı Seçin](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**Navigasyon**
- **Sonraki Ders**: [AZD Temelleri](docs/getting-started/azd-basics.md)

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.