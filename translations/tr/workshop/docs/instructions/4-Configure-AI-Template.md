# 4. Bir Şablon Yapılandırın

!!! tip "BU MODÜLÜN SONUNDA ŞUNLARI YAPABİLECEKSİNİZ"

    - [ ] `azure.yaml` dosyasının amacını anlayın
    - [ ] `azure.yaml` dosyasının yapısını anlayın
    - [ ] azd yaşam döngüsü `hooks` değerini anlayın
    - [ ] **Lab 3:** 

---

!!! prompt "`azure.yaml` dosyası ne işe yarar? Bir kod bloğu kullanarak satır satır açıklayın"

      `azure.yaml` dosyası, **Azure Developer CLI (azd)** için bir yapılandırma dosyasıdır. Uygulamanızın Azure'a nasıl dağıtılacağını tanımlar; altyapı, hizmetler, dağıtım kancaları ve ortam değişkenlerini içerir.

---

## 1. Amaç ve İşlevsellik

Bu `azure.yaml` dosyası, bir AI ajan uygulaması için bir **dağıtım planı** olarak hizmet eder:

1. Dağıtımdan önce **ortamı doğrular**
2. **Azure AI hizmetlerini sağlar** (AI Hub, AI Projesi, Arama vb.)
3. **Bir Python uygulamasını** Azure Container Apps'e dağıtır
4. **AI modellerini yapılandırır** (hem sohbet hem de gömme işlevselliği için)
5. **AI uygulaması için izleme ve takip** ayarlarını yapar
6. **Yeni ve mevcut** Azure AI proje senaryolarını yönetir

Bu dosya, doğru doğrulama, sağlama ve dağıtım sonrası yapılandırma ile **tek komutla dağıtım** (`azd up`) sağlar.

??? info "Genişletmek için tıklayın: `azure.yaml`"

      `azure.yaml` dosyası, Azure Developer CLI'nin bu AI Ajan uygulamasını Azure'da nasıl dağıtacağını ve yöneteceğini tanımlar. Şimdi bunu satır satır inceleyelim.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: Kancalara ihtiyacımız var mı? 
      # TODO: Tüm değişkenlere ihtiyacımız var mı?

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

## 2. Dosyayı Parçalarına Ayırma

Dosyayı bölüm bölüm inceleyelim, ne yaptığını ve neden yaptığını anlayalım.

### 2.1 **Başlık ve Şema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Satır 1**: IDE desteği ve IntelliSense için YAML dil sunucusu şema doğrulaması sağlar

### 2.2 Proje Meta Verileri (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Satır 5**: Azure Developer CLI tarafından kullanılan proje adını tanımlar
- **Satır 6-7**: Bu projenin 1.0.2 sürümünde bir şablona dayandığını belirtir
- **Satır 8-9**: Azure Developer CLI'nin 1.14.0 veya daha yüksek bir sürümünü gerektirir

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

- **Satır 11-20**: **Dağıtım öncesi kanca** - `azd up` çalıştırılmadan önce çalışır

      - Unix/Linux'ta: Doğrulama betiğini çalıştırılabilir hale getirir ve çalıştırır
      - Windows'ta: PowerShell doğrulama betiğini çalıştırır
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
- **Satır 21-30**: **Sağlama sonrası kanca** - Azure kaynakları oluşturulduktan sonra çalışır

  - Ortam değişkenlerini yazan betikleri çalıştırır
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
- **Satır 31-40**: **Dağıtım sonrası kanca** - Uygulama dağıtıldıktan sonra çalışır

  - Son yapılandırma betiklerini çalıştırır
  - Betikler başarısız olsa bile devam eder

### 2.4 Hizmet Yapılandırması (41-48)

Bu bölüm, dağıttığınız uygulama hizmetini yapılandırır.

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

- **Satır 42**: "api_and_frontend" adında bir hizmet tanımlar
- **Satır 43**: Kaynak kodu için `./src` dizinini işaret eder
- **Satır 44**: Programlama dili olarak Python'u belirtir
- **Satır 45**: Barındırma platformu olarak Azure Container Apps'i kullanır
- **Satır 46-48**: Docker yapılandırması

      - "api_and_frontend" adını görüntü olarak kullanır
      - Docker görüntüsünü yerel olarak değil, Azure'da uzaktan oluşturur

### 2.5 Pipeline Değişkenleri (49-76)

Bunlar, CI/CD boru hatlarında `azd` çalıştırmanıza yardımcı olan değişkenlerdir.

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

Bu bölüm, **dağıtım sırasında** kullanılan ortam değişkenlerini tanımlar ve kategorilere ayırır:

- **Azure Kaynak Adları (Satır 51-60)**:
      - Temel Azure hizmet kaynak adları, ör. Resource Group, AI Hub, AI Project vb.
- **Özellik Bayrakları (Satır 61-63)**:
      - Belirli Azure hizmetlerini etkinleştirmek/devre dışı bırakmak için kullanılan boolean değişkenler
- **AI Ajan Yapılandırması (Satır 64-71)**:
      - Ana AI ajanı için ad, kimlik, dağıtım ayarları ve model ayrıntıları gibi yapılandırmalar
- **AI Gömme Yapılandırması (Satır 72-79)**:
      - Vektör araması için kullanılan gömme modeli yapılandırması
- **Arama ve İzleme (Satır 80-84)**:
      - Arama dizini adı, mevcut kaynak kimlikleri ve izleme/izleme ayarları

---

## 3. Ortam Değişkenlerini Bilin
Aşağıdaki ortam değişkenleri, dağıtımınızın yapılandırmasını ve davranışını kontrol eder. Çoğu değişkenin mantıklı varsayılan değerleri vardır, ancak bunları özel gereksinimlerinize veya mevcut Azure kaynaklarınıza uyacak şekilde özelleştirebilirsiniz.

### 3.1 Gerekli Değişkenler 

```bash title="" linenums="0"
# Core Azure Configuration
AZURE_ENV_NAME                    # Environment name (used in resource naming)
AZURE_LOCATION                    # Deployment region
AZURE_SUBSCRIPTION_ID             # Target subscription
AZURE_RESOURCE_GROUP              # Resource group name
AZURE_PRINCIPAL_ID                # User principal for RBAC

# Resource Names (Auto-generated if not specified)
AZURE_AIHUB_NAME                  # AI Foundry hub name
AZURE_AIPROJECT_NAME              # AI project name
AZURE_AISERVICES_NAME             # AI services account name
AZURE_STORAGE_ACCOUNT_NAME        # Storage account name
AZURE_CONTAINER_REGISTRY_NAME     # Container registry name
AZURE_KEYVAULT_NAME               # Key Vault name (if used)
```

### 3.2 Model Yapılandırması 
```bash title="" linenums="0"
# Chat Model Configuration
AZURE_AI_AGENT_MODEL_NAME         # Default: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Default: OpenAI (or Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Default: latest available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Deployment name for chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Default: 80 (thousands of TPM)

# Embedding Model Configuration  
AZURE_AI_EMBED_MODEL_NAME         # Default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Default: latest available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Deployment name for embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Default: 50 (thousands of TPM)

# Agent Configuration
AZURE_AI_AGENT_NAME               # Agent display name
AZURE_EXISTING_AGENT_ID           # Use existing agent (optional)
```

### 3.3 Özellik Geçişi
```bash title="" linenums="0"
# Optional Services
USE_APPLICATION_INSIGHTS         # Default: true
USE_AZURE_AI_SEARCH_SERVICE      # Default: false
USE_CONTAINER_REGISTRY           # Default: true

# Monitoring and Tracing
ENABLE_AZURE_MONITOR_TRACING     # Default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Default: false

# Search Configuration
AZURE_AI_SEARCH_INDEX_NAME       # Search index name
AZURE_SEARCH_SERVICE_NAME        # Search service name
```

### 3.4 AI Proje Yapılandırması 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Değişkenlerinizi Kontrol Edin

Azure Developer CLI'yi kullanarak ortam değişkenlerinizi görüntüleyin ve yönetin:

```bash title="" linenums="0"
# View all environment variables for current environment
azd env get-values

# Get a specific environment variable
azd env get-value AZURE_ENV_NAME

# Set an environment variable
azd env set AZURE_LOCATION eastus

# Set multiple variables from a .env file
azd env set --from-file .env
```

---

