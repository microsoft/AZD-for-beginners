# Yaygın Sorunlar ve Çözümler

**Bölüm Navigasyonu:**
- **📚 Kurs Anasayfa**: [Başlangıç Seviyesi AZD](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 7 - Sorun Giderme & Hata Ayıklama
- **⬅️ Önceki Bölüm**: [Bölüm 6: Ön Kontroller](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Sonraki**: [Hata Ayıklama Kılavuzu](debugging.md)
- **🚀 Sonraki Bölüm**: [Bölüm 8: Üretim & Kurumsal Modeller](../chapter-08-production/production-ai-practices.md)

## Giriş

Bu kapsamlı sorun giderme kılavuzu, Azure Developer CLI kullanırken en sık karşılaşılan sorunları ele almaktadır. Kimlik doğrulama, dağıtım, altyapı sağlama ve uygulama yapılandırması ile ilgili yaygın problemleri teşhis etmeyi, gidermeyi ve çözmeyi öğrenin. Her sorun detaylı belirtiler, temel nedenler ve adım adım çözümler içerir.

## Öğrenme Hedefleri

Bu kılavuzu tamamlayarak:
- Azure Developer CLI sorunları için teşhis tekniklerini ustalıkla öğreneceksiniz
- Yaygın kimlik doğrulama ve izin sorunlarını ve çözümlerini anlayacaksınız
- Dağıtım hatalarını, altyapı sağlama hatalarını ve yapılandırma problemlerini çözeceksiniz
- Proaktif izleme ve hata ayıklama stratejileri uygulayacaksınız
- Karmaşık sorunlar için sistematik sorun giderme metodolojilerini benimseyeceksiniz
- Gelecekteki sorunları önlemek için uygun günlük kaydı ve izlemeyi yapılandıracaksınız

## Öğrenme Çıktıları

Tamamlandığında şunları yapabileceksiniz:
- Yerleşik teşhis araçlarını kullanarak Azure Developer CLI sorunlarını teşhis etmek
- Kimlik doğrulama, abonelik ve izinle ilgili sorunları bağımsız şekilde çözmek
- Dağıtım hatalarını ve altyapı sağlama hatalarını etkili şekilde gidermek
- Uygulama yapılandırma sorunlarını ve ortam bazlı problemleri hata ayıklamak
- Potansiyel sorunları proaktif olarak belirlemek için izleme ve uyarı uygulamak
- Günlük kaydı, hata ayıklama ve sorun çözme iş akışları için en iyi uygulamaları uygulamak

## Hızlı Teşhis

> Örnek isimleri/ID'leri kendi ortamınızın değerleriyle değiştirin. Bash, Bicep, JavaScript ve parametre dosyası parçaları ayrı şekilde etiketlenmiştir; bunlar tek bir yürütülebilir betik değildir. Yıkıcı işlemleri gözden geçirin ve tanı paylaşmadan önce gizli bilgileri gizleyin. `azd monitor --logs` tarayıcı açar; terminal günlüklerini canlı yayınlamaz.

Belirli sorunlara dalmadan önce, teşhis bilgisi toplamak için bu komutları çalıştırın:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## Kimlik Doğrulama Sorunları

### Sorun: "Erişim belirteci alınamadı"
**Belirtiler:**
- `azd up` kimlik doğrulama hatalarıyla başarısız olur
- Komutlar "yetkisiz" veya "erişim reddedildi" döner

**Çözümler:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### Sorun: Dağıtım sırasında "Yetersiz ayrıcalıklar"
**Belirtiler:**
- Dağıtım izin hatalarıyla başarısız olur
- Bazı Azure kaynakları oluşturulamıyor

**Çözümler:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Sorun: Çok kiracılı kimlik doğrulama sorunları
**Çözümler:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Altyapı Sağlama Hataları

### Sorun: Kaynak adı çakışmaları
**Belirtiler:**
- "Kaynak adı zaten mevcut" hataları
- Kaynak oluşturulurken dağıtım başarısız olur

**Çözümler:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### Sorun: Konum/Bölge kullanılamıyor
**Belirtiler:**
- "xyz konumu kaynak türü için uygun değil"
- Seçilen bölgede bazı SKU'lar yok

**Çözümler:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Konum değişkenini değiştirmek mevcut kaynakları taşımaz. Mevcut bir kaynak grubu veya kaynak konum değişikliğini reddedebilir; bölgesel yeniden dağıtım için ayrı bir ortam kullanın.

### Sorun: Kota aşıldı hataları
**Belirtiler:**
- "Kaynak türü için kota aşıldı"
- "Maksimum kaynak sayısına ulaşıldı"

**Çözümler:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Geliştirme için, `infra/main.parameters.json` içinde desteklenen daha küçük bir SKU seçin:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Sorun: Bicep şablon hataları
**Belirtiler:**
- Şablon doğrulama hataları
- Bicep dosyalarında sözdizimi hataları

**Çözümler:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 Dağıtım Hataları

### Sorun: Derleme hataları
**Belirtiler:**
- Uygulama dağıtım sırasında derlenemiyor
- Paket yükleme hataları

**Çözümler:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Sorun: Konteyner dağıtım hataları
**Belirtiler:**
- Konteyner uygulamalar başlatılamıyor
- İmaj çekme hataları

**Çözümler:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Sorun: Veritabanı bağlantı hataları
**Belirtiler:**
- Uygulama veritabanına bağlanamıyor
- Bağlantı zaman aşımı hataları

**Çözümler:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Yapılandırma Sorunları

### Sorun: Ortam değişkenleri çalışmıyor
**Belirtiler:**
- Uygulama yapılandırma değerlerini okuyamıyor
- Ortam değişkenleri boş görünüyor

**Çözümler:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Sorun: SSL/TLS sertifika problemleri
**Belirtiler:**
- HTTPS çalışmıyor
- Sertifika doğrulama hataları

**Çözümler:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Sorun: CORS yapılandırma problemleri
**Belirtiler:**
- Ön yüz API'yi çağramıyor
- Kaynaklar arası istek engellendi

**Çözümler:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Mevcut Express uygulamanızı (içeri `cors` olarak aktarılmış) güncelleyin:

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 Ortam Yönetimi Sorunları

### Sorun: Ortam değiştirme problemleri
**Belirtiler:**
- Yanlış ortam kullanılıyor
- Yapılandırma doğru şekilde değişmiyor

**Çözümler:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Sorun: Ortam bozukluğu
**Belirtiler:**
- Ortam geçersiz durumda gösteriliyor
- Kaynaklar yapılandırmayla uyuşmuyor

**Çözümler:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Performans Sorunları

### Sorun: Yavaş dağıtım süreleri
**Belirtiler:**
- Dağıtımlar çok uzun sürüyor
- Dağıtım sırasında zaman aşımı

**Çözümler:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### Sorun: Uygulama performans problemleri
**Belirtiler:**
- Yavaş yanıt süreleri
- Yüksek kaynak kullanımı

**Çözümler:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Sorun Giderme Araçları ve Komutlar

### Hata Ayıklama Komutları
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Günlük Analizi
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Kaynak İncelemesi
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Ek Yardım Alma

### Ne Zaman Yükseltmeli
- Tüm çözümler denendikten sonra kimlik doğrulama sorunları devam ediyorsa
- Azure servisleriyle altyapı problemleri varsa
- Faturalandırma veya abonelikle ilgili sorunlar varsa
- Güvenlik endişeleri veya olayları varsa

### Destek Kanalları
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Toplanacak Bilgiler
Destekle iletişime geçmeden önce toplayın:
- `azd version` çıktısı
- `azd config show` çıktısı
- `azd show` çıktısı (mevcut dağıtım durumu)
- Hata mesajları (tam metin)
- Sorunu yeniden oluşturma adımları
- Gizlenmiş ortam detayları (ham `azd env get-values` asla paylaşmayın, gizli bilgiler içerebilir)
- Sorunun başladığı zamana ait zaman çizelgesi

### Günlük Toplama Betiği
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Sorun Önleme

### Dağıtımdan Önce Kontrol Listesi
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### İzleme Ayarı
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### Düzenli Bakım
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## İlgili Kaynaklar

- [Hata Ayıklama Kılavuzu](debugging.md) - Gelişmiş hata ayıklama teknikleri
- [Kaynak Sağlama](../chapter-04-infrastructure/provisioning.md) - Altyapı sorun giderme
- [Kapasite Planlaması](../chapter-06-pre-deployment/capacity-planning.md) - Kaynak planlama rehberi
- [SKU Seçimi](../chapter-06-pre-deployment/sku-selection.md) - Servis katmanı önerileri

---

**İpucu**: Bu kılavuzu yer imlerine ekleyin ve sorun yaşadığınızda başvurun. Çoğu problem daha önce görülmüş ve denenmiş çözümlerle beraber kayıtlıdır!

---

**Navigasyon**
- **Önceki Ders**: [Kaynak Sağlama](../chapter-04-infrastructure/provisioning.md)
- **Sonraki Ders**: [Hata Ayıklama Kılavuzu](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->