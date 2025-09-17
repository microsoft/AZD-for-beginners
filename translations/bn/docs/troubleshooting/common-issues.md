<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-17T19:25:19+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "bn"
}
-->
# সাধারণ সমস্যা এবং সমাধান

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ৭ - সমস্যা সমাধান এবং ডিবাগিং
- **⬅️ পূর্ববর্তী অধ্যায়**: [অধ্যায় ৬: প্রি-ফ্লাইট চেক](../pre-deployment/preflight-checks.md)
- **➡️ পরবর্তী**: [ডিবাগিং গাইড](debugging.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৮: প্রোডাকশন এবং এন্টারপ্রাইজ প্যাটার্ন](../ai-foundry/production-ai-practices.md)

## ভূমিকা

এই বিস্তৃত সমস্যা সমাধানের গাইডটি Azure Developer CLI ব্যবহার করার সময় সবচেয়ে বেশি দেখা সমস্যাগুলি কভার করে। প্রমাণ, সমস্যা সমাধান এবং সাধারণ সমস্যাগুলি যেমন প্রমাণীকরণ, ডিপ্লয়মেন্ট, অবকাঠামো প্রস্তুতি এবং অ্যাপ্লিকেশন কনফিগারেশন সমাধানের পদ্ধতি শিখুন। প্রতিটি সমস্যার জন্য বিস্তারিত লক্ষণ, মূল কারণ এবং ধাপে ধাপে সমাধানের পদ্ধতি অন্তর্ভুক্ত রয়েছে।

## শেখার লক্ষ্য

এই গাইড সম্পন্ন করার মাধ্যমে আপনি:
- Azure Developer CLI সমস্যার জন্য ডায়াগনস্টিক কৌশল আয়ত্ত করবেন
- সাধারণ প্রমাণীকরণ এবং অনুমতির সমস্যাগুলি এবং তাদের সমাধান বুঝবেন
- ডিপ্লয়মেন্ট ব্যর্থতা, অবকাঠামো প্রস্তুতির ত্রুটি এবং কনফিগারেশন সমস্যাগুলি সমাধান করবেন
- সক্রিয় পর্যবেক্ষণ এবং ডিবাগিং কৌশল বাস্তবায়ন করবেন
- জটিল সমস্যার জন্য পদ্ধতিগত সমস্যা সমাধানের পদ্ধতি প্রয়োগ করবেন
- ভবিষ্যতের সমস্যাগুলি প্রতিরোধ করতে সঠিক লগিং এবং পর্যবেক্ষণ কনফিগার করবেন

## শেখার ফলাফল

গাইড সম্পন্ন করার পরে আপনি সক্ষম হবেন:
- Azure Developer CLI সমস্যাগুলি বিল্ট-ইন ডায়াগনস্টিক টুল ব্যবহার করে নির্ণয় করতে
- প্রমাণীকরণ, সাবস্ক্রিপশন এবং অনুমতি-সম্পর্কিত সমস্যাগুলি স্বাধীনভাবে সমাধান করতে
- ডিপ্লয়মেন্ট ব্যর্থতা এবং অবকাঠামো প্রস্তুতির ত্রুটি কার্যকরভাবে সমাধান করতে
- অ্যাপ্লিকেশন কনফিগারেশন সমস্যাগুলি এবং পরিবেশ-নির্দিষ্ট সমস্যাগুলি ডিবাগ করতে
- সম্ভাব্য সমস্যাগুলি সক্রিয়ভাবে চিহ্নিত করতে পর্যবেক্ষণ এবং সতর্কতা বাস্তবায়ন করতে
- লগিং, ডিবাগিং এবং সমস্যা সমাধানের কার্যপ্রবাহের জন্য সেরা অনুশীলনগুলি প্রয়োগ করতে

## দ্রুত ডায়াগনস্টিক

নির্দিষ্ট সমস্যাগুলিতে যাওয়ার আগে, এই কমান্ডগুলি চালিয়ে ডায়াগনস্টিক তথ্য সংগ্রহ করুন:

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

## প্রমাণীকরণ সমস্যা

### সমস্যা: "অ্যাক্সেস টোকেন পেতে ব্যর্থ"
**লক্ষণ:**
- `azd up` প্রমাণীকরণ ত্রুটির কারণে ব্যর্থ হয়
- কমান্ড "অননুমোদিত" বা "অ্যাক্সেস অস্বীকৃত" দেখায়

**সমাধান:**
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

### সমস্যা: ডিপ্লয়মেন্টের সময় "অপর্যাপ্ত অনুমতি"
**লক্ষণ:**
- অনুমতির ত্রুটির কারণে ডিপ্লয়মেন্ট ব্যর্থ হয়
- নির্দিষ্ট Azure রিসোর্স তৈরি করতে পারছেন না

**সমাধান:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### সমস্যা: মাল্টি-টেন্যান্ট প্রমাণীকরণ সমস্যা
**সমাধান:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ অবকাঠামো প্রস্তুতির ত্রুটি

### সমস্যা: রিসোর্স নামের দ্বন্দ্ব
**লক্ষণ:**
- "রিসোর্স নাম ইতিমধ্যে বিদ্যমান" ত্রুটি
- রিসোর্স তৈরি করার সময় ডিপ্লয়মেন্ট ব্যর্থ হয়

**সমাধান:**
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

### সমস্যা: অবস্থান/অঞ্চল উপলব্ধ নয়
**লক্ষণ:**
- "রিসোর্স টাইপের জন্য অবস্থান 'xyz' উপলব্ধ নয়"
- নির্বাচিত অঞ্চলে নির্দিষ্ট SKU উপলব্ধ নয়

**সমাধান:**
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

### সমস্যা: কোটা অতিক্রম ত্রুটি
**লক্ষণ:**
- "রিসোর্স টাইপের জন্য কোটা অতিক্রম"
- "রিসোর্সের সর্বাধিক সংখ্যা পৌঁছেছে"

**সমাধান:**
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

### সমস্যা: Bicep টেমপ্লেট ত্রুটি
**লক্ষণ:**
- টেমপ্লেট যাচাই ব্যর্থতা
- Bicep ফাইলগুলিতে সিনট্যাক্স ত্রুটি

**সমাধান:**
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

## 🚀 ডিপ্লয়মেন্ট ব্যর্থতা

### সমস্যা: বিল্ড ব্যর্থতা
**লক্ষণ:**
- ডিপ্লয়মেন্টের সময় অ্যাপ্লিকেশন বিল্ড ব্যর্থ হয়
- প্যাকেজ ইনস্টলেশন ত্রুটি

**সমাধান:**
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

### সমস্যা: কন্টেইনার ডিপ্লয়মেন্ট ব্যর্থতা
**লক্ষণ:**
- কন্টেইনার অ্যাপ্লিকেশন শুরু করতে ব্যর্থ হয়
- ইমেজ পুল ত্রুটি

**সমাধান:**
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

### সমস্যা: ডাটাবেস সংযোগ ত্রুটি
**লক্ষণ:**
- অ্যাপ্লিকেশন ডাটাবেসের সাথে সংযোগ করতে পারে না
- সংযোগ টাইমআউট ত্রুটি

**সমাধান:**
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

## 🔧 কনফিগারেশন সমস্যা

### সমস্যা: পরিবেশ ভেরিয়েবল কাজ করছে না
**লক্ষণ:**
- অ্যাপ্লিকেশন কনফিগারেশন মান পড়তে পারে না
- পরিবেশ ভেরিয়েবল খালি দেখায়

**সমাধান:**
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

### সমস্যা: SSL/TLS সার্টিফিকেট সমস্যা
**লক্ষণ:**
- HTTPS কাজ করছে না
- সার্টিফিকেট যাচাই ত্রুটি

**সমাধান:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### সমস্যা: CORS কনফিগারেশন সমস্যা
**লক্ষণ:**
- ফ্রন্টএন্ড API কল করতে পারে না
- ক্রস-অরিজিন অনুরোধ ব্লক করা হয়েছে

**সমাধান:**
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

## 🌍 পরিবেশ ব্যবস্থাপনা সমস্যা

### সমস্যা: পরিবেশ পরিবর্তনের সমস্যা
**লক্ষণ:**
- ভুল পরিবেশ ব্যবহার করা হচ্ছে
- কনফিগারেশন সঠিকভাবে পরিবর্তন হচ্ছে না

**সমাধান:**
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

### সমস্যা: পরিবেশ দুর্নীতি
**লক্ষণ:**
- পরিবেশ অকার্যকর অবস্থায় দেখায়
- রিসোর্স কনফিগারেশনের সাথে মেলে না

**সমাধান:**
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

## 🔍 কর্মক্ষমতা সমস্যা

### সমস্যা: ধীর ডিপ্লয়মেন্ট সময়
**লক্ষণ:**
- ডিপ্লয়মেন্ট খুব বেশি সময় নিচ্ছে
- ডিপ্লয়মেন্টের সময় টাইমআউট

**সমাধান:**
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

### সমস্যা: অ্যাপ্লিকেশন কর্মক্ষমতা সমস্যা
**লক্ষণ:**
- ধীর প্রতিক্রিয়া সময়
- উচ্চ রিসোর্স ব্যবহার

**সমাধান:**
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

## 🛠️ সমস্যা সমাধানের টুল এবং কমান্ড

### ডিবাগ কমান্ড
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

### লগ বিশ্লেষণ
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### রিসোর্স তদন্ত
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 অতিরিক্ত সাহায্য পাওয়া

### কখন সমস্যা বাড়ানো উচিত
- সমস্ত সমাধান চেষ্টা করার পরেও প্রমাণীকরণ সমস্যা অব্যাহত থাকে
- Azure পরিষেবার সাথে অবকাঠামো সমস্যা
- বিলিং বা সাবস্ক্রিপশন-সম্পর্কিত সমস্যা
- নিরাপত্তা উদ্বেগ বা ঘটনা

### সহায়তা চ্যানেল
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

### তথ্য সংগ্রহ
সহায়তার সাথে যোগাযোগ করার আগে সংগ্রহ করুন:
- `azd version` আউটপুট
- `azd info` আউটপুট
- ত্রুটি বার্তা (সম্পূর্ণ টেক্সট)
- সমস্যাটি পুনরুত্পাদন করার ধাপ
- পরিবেশের বিবরণ (`azd env show`)
- সমস্যাটি কখন শুরু হয়েছে তার টাইমলাইন

### লগ সংগ্রহ স্ক্রিপ্ট
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

## 📊 সমস্যা প্রতিরোধ

### প্রি-ডিপ্লয়মেন্ট চেকলিস্ট
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

### পর্যবেক্ষণ সেটআপ
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

### নিয়মিত রক্ষণাবেক্ষণ
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## সম্পর্কিত রিসোর্স

- [ডিবাগিং গাইড](debugging.md) - উন্নত ডিবাগিং কৌশল
- [অবকাঠামো প্রস্তুতি](../deployment/provisioning.md) - অবকাঠামো সমস্যা সমাধান
- [ক্ষমতা পরিকল্পনা](../pre-deployment/capacity-planning.md) - রিসোর্স পরিকল্পনার নির্দেশিকা
- [SKU নির্বাচন](../pre-deployment/sku-selection.md) - পরিষেবা স্তরের সুপারিশ

---

**পরামর্শ**: এই গাইডটি বুকমার্ক করে রাখুন এবং যখনই সমস্যার সম্মুখীন হন তখন এটি দেখুন। বেশিরভাগ সমস্যাগুলি পূর্বে দেখা গেছে এবং তাদের প্রতিষ্ঠিত সমাধান রয়েছে!

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [অবকাঠামো প্রস্তুতি](../deployment/provisioning.md)
- **পরবর্তী পাঠ**: [ডিবাগিং গাইড](debugging.md)

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতা নিশ্চিত করার চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।