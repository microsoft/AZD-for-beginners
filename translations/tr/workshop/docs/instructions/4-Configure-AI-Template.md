# 4. Bir Şablonu Yapılandırma

!!! tip "BU MODÜLÜN SONUNDA ŞUNLARI YAPABİLİRSİNİZ"

    - [ ] `azure.yaml` dosyasının amacını anlayın
    - [ ] `azure.yaml` yapısını anlayın
    - [ ] azd yaşam döngüsündeki `hooks` değerini anlayın
    - [ ] **Lab 4:** Ortam değişkenlerini keşfedin ve değiştirin

---

!!! prompt "Bu `azure.yaml` dosyası ne yapar? Bir kod bloğu kullanarak satır satır açıklayın"

      `azure.yaml` dosyası, Azure Developer CLI (azd) için **yapılandırma dosyasıdır**. Bu dosya uygulamanızın Azure'a nasıl dağıtılacağını, altyapı, hizmetler, dağıtım kancaları ve ortam değişkenleri dahil olmak üzere tanımlar.

---

## 1. Amaç ve İşlevsellik

Bu `azure.yaml` dosyası bir AI ajan uygulaması için **dağıtım planı** görevi görür ve şunları yapar:

1. **Dağıtımdan önce ortamı doğrular**
2. **Azure AI hizmetlerini sağlar** (AI Hub, AI Project, Search, vb.)
3. **Bir Python uygulamasını Azure Container Apps'e dağıtır**
4. **Hem sohbet hem de embedding işlevselliği için AI modellerini yapılandırır**
5. **AI uygulaması için izleme ve takip** yapılandırır
6. **Yeni ve mevcut** Azure AI proje senaryolarını ele alır

Bu dosya, uygun doğrulama, sağlama ve dağıtımdan sonraki yapılandırma ile eksiksiz bir AI ajan çözümünün tek komutla (**tek komutla dağıtım**) (`azd up`) dağıtılmasını sağlar.

??? info "Genişletmek İçin Görüntüle: `azure.yaml`"

      `azure.yaml` dosyası, Azure Developer CLI'nin bu AI Ajan uygulamasını Azure'da nasıl dağıtıp yöneteceğini tanımlar. Hadi satır satır inceleyelim.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: do we need hooks? 
      # TODO: do we need all of the variables?

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. Dosyanın Parçalanması

Dosyanın ne yaptığını ve neden yaptığını anlamak için bölümler halinde inceleyelim.

### 2.1 **Başlık ve Şema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: IDE desteği ve IntelliSense için YAML dil sunucusu şema doğrulaması sağlar

### 2.2 Proje Meta Verileri (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Azure Developer CLI tarafından kullanılan proje adını tanımlar
- **Lines 6-7**: Bunun bir 1.0.2 sürüm şablonuna dayandığını belirtir
- **Lines 8-9**: Azure Developer CLI sürümünün 1.14.0 veya daha üstünü gerektirir

### 2.3 Dağıtım Kancaları (11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **Lines 11-20**: **Dağıtımdan önceki kanca (pre-deployment hook)** - `azd up` çalışmadan önce çalışır

      - Unix/Linux üzerinde: Doğrulama betiğini çalıştırılabilir hale getirir ve çalıştırır
      - Windows üzerinde: PowerShell doğrulama betiğini çalıştırır
      - Her iki durumda da etkileşimlidir ve başarısız olursa dağıtımı durdurur

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **Lines 21-30**: **Kaynak sağlama sonrasındaki kanca (post-provision hook)** - Azure kaynakları oluşturulduktan sonra çalışır

  - Ortam değişkenlerini yazma betiklerini çalıştırır
  - Bu betikler başarısız olsa bile dağıtıma devam eder (`continueOnError: true`)

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **Lines 31-40**: **Dağıtım sonrası kanca (post-deploy hook)** - uygulama dağıtımından sonra çalışır

  - Son kurulum betiklerini çalıştırır
  - Betikler başarısız olsa bile devam eder

### 2.4 Hizmet Yapılandırması (41-48)

Bu, dağıttığınız uygulama hizmetini yapılandırır.

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **Line 42**: "api_and_frontend" adlı bir hizmet tanımlar
- **Line 43**: Kaynak kod için `./src` dizinine işaret eder
- **Line 44**: Programlama dili olarak Python'u belirtir
- **Line 45**: Barındırma platformu olarak Azure Container Apps'i kullanır
- **Lines 46-48**: Docker yapılandırması

      - "api_and_frontend" adlı görüntü adını kullanır
      - Docker görüntüsünü yerel yerine Azure'da uzaktan derler

### 2.5 Pipeline Değişkenleri (49-76)

Bunlar otomasyon için CI/CD pipeline'larında `azd` çalıştırmanıza yardımcı olacak değişkenlerdir

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

Bu bölüm dağıtım sırasında kullanılan ortam değişkenlerini tanımlar ve kategorilere ayrılmıştır:

- **Azure Kaynak İsimleri (Lines 51-60)**:
      - Kaynak Grubu, AI Hub, AI Project vb. gibi temel Azure hizmet kaynak adları
- **Özellik Bayrakları (Lines 61-63)**:
      - Belirli Azure hizmetlerini etkinleştirmek/devre dışı bırakmak için boolean değişkenler
- **AI Ajan Yapılandırması (Lines 64-71)**:
      - Ana AI ajan için ad, ID, dağıtım ayarları, model ayrıntıları gibi yapılandırma
- **AI Embedding Yapılandırması (Lines 72-79)**:
      - Vektör arama için kullanılan embedding modeli yapılandırması
- **Arama ve İzleme (Lines 80-84)**:
      - Arama dizini adı, mevcut kaynak ID'leri ve izleme/takip ayarları

---

## 3. Ortam Değişkenlerini Bilin
Aşağıdaki ortam değişkenleri dağıtımınızın yapılandırmasını ve davranışını kontrol eder; birincil amaçlarına göre düzenlenmiştir. Çoğu değişken için makul varsayılanlar vardır, ancak bunları kendi gereksinimlerinize veya mevcut Azure kaynaklarınıza uyacak şekilde özelleştirebilirsiniz.

### 3.1 Gerekli Değişkenler 

```bash title="" linenums="0"
# Temel Azure Yapılandırması
AZURE_ENV_NAME                    # Ortam adı (kaynak adlandırmasında kullanılır)
AZURE_LOCATION                    # Dağıtım bölgesi
AZURE_SUBSCRIPTION_ID             # Hedef abonelik
AZURE_RESOURCE_GROUP              # Kaynak grubu adı
AZURE_PRINCIPAL_ID                # RBAC için kullanıcı ilkesi

# Kaynak adları (belirtilmezse otomatik oluşturulur)
AZURE_AIHUB_NAME                  # Microsoft Foundry hub adı
AZURE_AIPROJECT_NAME              # Yapay zeka proje adı
AZURE_AISERVICES_NAME             # Yapay zeka hizmet hesabı adı
AZURE_STORAGE_ACCOUNT_NAME        # Depolama hesabı adı
AZURE_CONTAINER_REGISTRY_NAME     # Konteyner kayıt defteri adı
AZURE_KEYVAULT_NAME               # Anahtar Kasası adı (kullanılıyorsa)
```

### 3.2 Model Yapılandırması 
```bash title="" linenums="0"
# Sohbet Modeli Yapılandırması
AZURE_AI_AGENT_MODEL_NAME         # Varsayılan: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Varsayılan: OpenAI (veya Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Varsayılan: kullanılabilir en son
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Sohbet modeli için dağıtım adı
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Varsayılan: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Varsayılan: 80 (binlerce TPM)

# Gömleme Modeli Yapılandırması
AZURE_AI_EMBED_MODEL_NAME         # Varsayılan: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Varsayılan: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Varsayılan: kullanılabilir en son
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Gömlemeler için dağıtım adı
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Varsayılan: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Varsayılan: 50 (binlerce TPM)

# Ajan Yapılandırması
AZURE_AI_AGENT_NAME               # Ajanın görüntülenen adı
AZURE_EXISTING_AGENT_ID           # Mevcut ajanı kullan (isteğe bağlı)
```

### 3.3 Özellik Anahtarı
```bash title="" linenums="0"
# İsteğe Bağlı Hizmetler
USE_APPLICATION_INSIGHTS         # Varsayılan: doğru
USE_AZURE_AI_SEARCH_SERVICE      # Varsayılan: yanlış
USE_CONTAINER_REGISTRY           # Varsayılan: doğru

# İzleme ve İz Sürme
ENABLE_AZURE_MONITOR_TRACING     # Varsayılan: yanlış
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Varsayılan: yanlış

# Arama Yapılandırması
AZURE_AI_SEARCH_INDEX_NAME       # Arama indeks adı
AZURE_SEARCH_SERVICE_NAME        # Arama hizmet adı
```

### 3.4 AI Proje Yapılandırması 
```bash title="" linenums="0"
# Mevcut Kaynakları Kullan
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Mevcut yapay zeka projesinin tam kaynak kimliği
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Mevcut projenin uç nokta URL'si
```

### 3.5 Değişkenlerinizi Kontrol Edin

Ortam değişkenlerinizi görüntülemek ve yönetmek için Azure Developer CLI'yi kullanın:

```bash title="" linenums="0"
# Geçerli ortam için tüm çevresel değişkenleri görüntüle
azd env get-values

# Belirli bir çevresel değişkeni al
azd env get-value AZURE_ENV_NAME

# Bir çevresel değişken ayarla
azd env set AZURE_LOCATION eastus

# Bir .env dosyasından birden çok değişken ayarla
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, yapay zekâ çeviri servisi [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstermemize rağmen, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kaynak dilindeki sürümü yetkili kaynak olarak kabul edilmelidir. Önemli bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanılması sonucunda ortaya çıkan herhangi bir yanlış anlama veya yanlış yorumlamadan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->