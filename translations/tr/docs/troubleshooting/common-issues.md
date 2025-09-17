<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-17T21:57:23+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "tr"
}
-->
# Yaygın Sorunlar ve Çözümleri

**Bölüm Gezinme:**
- **📚 Kurs Ana Sayfası**: [AZD For Beginners](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 7 - Sorun Giderme ve Hata Ayıklama
- **⬅️ Önceki Bölüm**: [Bölüm 6: Ön Kontroller](../pre-deployment/preflight-checks.md)
- **➡️ Sonraki**: [Hata Ayıklama Kılavuzu](debugging.md)
- **🚀 Sonraki Bölüm**: [Bölüm 8: Üretim ve Kurumsal Kalıplar](../ai-foundry/production-ai-practices.md)

## Giriş

Bu kapsamlı sorun giderme kılavuzu, Azure Developer CLI kullanırken en sık karşılaşılan sorunları ele alır. Kimlik doğrulama, dağıtım, altyapı sağlama ve uygulama yapılandırması ile ilgili yaygın sorunları teşhis etmeyi, gidermeyi ve çözmeyi öğrenin. Her sorun için ayrıntılı semptomlar, temel nedenler ve adım adım çözüm prosedürleri sunulmaktadır.

## Öğrenme Hedefleri

Bu kılavuzu tamamlayarak:
- Azure Developer CLI sorunları için teşhis tekniklerini öğrenin
- Yaygın kimlik doğrulama ve izin sorunlarını ve çözümlerini anlayın
- Dağıtım hatalarını, altyapı sağlama hatalarını ve yapılandırma sorunlarını çözün
- Proaktif izleme ve hata ayıklama stratejileri uygulayın
- Karmaşık sorunlar için sistematik sorun giderme metodolojilerini kullanın
- Gelecekteki sorunları önlemek için uygun günlük kaydı ve izleme yapılandırması yapın

## Öğrenme Çıktıları

Tamamlandığında, şunları yapabileceksiniz:
- Azure Developer CLI sorunlarını yerleşik teşhis araçlarıyla teşhis edin
- Kimlik doğrulama, abonelik ve izinle ilgili sorunları bağımsız olarak çözün
- Dağıtım hatalarını ve altyapı sağlama hatalarını etkili bir şekilde giderin
- Uygulama yapılandırma sorunlarını ve ortamla ilgili problemleri ayıklayın
- Potansiyel sorunları proaktif olarak belirlemek için izleme ve uyarı sistemleri uygulayın
- Günlük kaydı, hata ayıklama ve sorun çözme iş akışları için en iyi uygulamaları kullanın

## Hızlı Teşhis

Belirli sorunlara dalmadan önce, teşhis bilgilerini toplamak için şu komutları çalıştırın:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## Kimlik Doğrulama Sorunları

### Sorun: "Erişim belirteci alınamadı"
**Semptomlar:**
- `azd up` kimlik doğrulama hatalarıyla başarısız oluyor
- Komutlar "yetkisiz" veya "erişim reddedildi" hatası döndürüyor

**Çözümler:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Sorun: Dağıtım sırasında "Yetersiz ayrıcalıklar"
**Semptomlar:**
- Dağıtım izin hatalarıyla başarısız oluyor
- Belirli Azure kaynaklarını oluşturamıyor

**Çözümler:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Sorun: Çok kiracılı kimlik doğrulama problemleri
**Çözümler:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Altyapı Sağlama Hataları

### Sorun: Kaynak adı çakışmaları
**Semptomlar:**
- "Kaynak adı zaten mevcut" hataları
- Kaynak oluşturma sırasında dağıtım başarısız oluyor

**Çözümler:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### Sorun: Konum/Bölge kullanılamıyor
**Semptomlar:**
- "xyz konumu bu kaynak türü için kullanılamıyor" hatası
- Seçilen bölgede belirli SKU'lar mevcut değil

**Çözümler:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### Sorun: Kota aşımı hataları
**Semptomlar:**
- "Kaynak türü için kota aşıldı" hatası
- "Maksimum kaynak sayısına ulaşıldı"

**Çözümler:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Sorun: Bicep şablon hataları
**Semptomlar:**
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
**Semptomlar:**
- Uygulama dağıtım sırasında derlenemiyor
- Paket yükleme hataları

**Çözümler:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Sorun: Konteyner dağıtım hataları
**Semptomlar:**
- Konteyner uygulamaları başlatılamıyor
- Görüntü çekme hataları

**Çözümler:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Sorun: Veritabanı bağlantı hataları
**Semptomlar:**
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
**Semptomlar:**
- Uygulama yapılandırma değerlerini okuyamıyor
- Ortam değişkenleri boş görünüyor

**Çözümler:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Sorun: SSL/TLS sertifika problemleri
**Semptomlar:**
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
**Semptomlar:**
- Ön uç API'yi çağırmıyor
- Çapraz kaynak isteği engellendi

**Çözümler:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 Ortam Yönetimi Sorunları

### Sorun: Ortam değiştirme problemleri
**Semptomlar:**
- Yanlış ortam kullanılıyor
- Yapılandırma düzgün şekilde değişmiyor

**Çözümler:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Sorun: Ortam bozulması
**Semptomlar:**
- Ortam geçersiz durumda görünüyor
- Kaynaklar yapılandırmayla eşleşmiyor

**Çözümler:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 Performans Sorunları

### Sorun: Yavaş dağıtım süreleri
**Semptomlar:**
- Dağıtımlar çok uzun sürüyor
- Dağıtım sırasında zaman aşımı

**Çözümler:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### Sorun: Uygulama performans problemleri
**Semptomlar:**
- Yavaş yanıt süreleri
- Yüksek kaynak kullanımı

**Çözümler:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Sorun Giderme Araçları ve Komutları

### Hata Ayıklama Komutları
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Günlük Analizi
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

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
- Tüm çözümleri denedikten sonra kimlik doğrulama sorunları devam ediyorsa
- Azure hizmetleriyle ilgili altyapı problemleri
- Faturalandırma veya abonelikle ilgili sorunlar
- Güvenlik endişeleri veya olaylar

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
Destekle iletişime geçmeden önce şunları toplayın:
- `azd version` çıktısı
- `azd info` çıktısı
- Hata mesajları (tam metin)
- Sorunu yeniden oluşturma adımları
- Ortam detayları (`azd env show`)
- Sorunun başladığı zaman çizelgesi

### Günlük Toplama Komut Dosyası
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Sorun Önleme

### Dağıtım Öncesi Kontrol Listesi
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

### İzleme Kurulumu
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Düzenli Bakım
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## İlgili Kaynaklar

- [Hata Ayıklama Kılavuzu](debugging.md) - Gelişmiş hata ayıklama teknikleri
- [Kaynak Sağlama](../deployment/provisioning.md) - Altyapı sorun giderme
- [Kapasite Planlama](../pre-deployment/capacity-planning.md) - Kaynak planlama rehberi
- [SKU Seçimi](../pre-deployment/sku-selection.md) - Hizmet seviyesi önerileri

---

**İpucu**: Bu kılavuzu yer imlerine ekleyin ve sorunlarla karşılaştığınızda başvurun. Çoğu sorun daha önce görülmüş ve çözüm yolları belirlenmiştir!

---

**Gezinme**
- **Önceki Ders**: [Kaynak Sağlama](../deployment/provisioning.md)
- **Sonraki Ders**: [Hata Ayıklama Kılavuzu](debugging.md)

---

**Feragatname**:  
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hata veya yanlışlıklar içerebileceğini lütfen unutmayın. Belgenin orijinal dili, yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımından kaynaklanan yanlış anlamalar veya yanlış yorumlamalar için sorumluluk kabul etmiyoruz.