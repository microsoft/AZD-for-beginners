# সাধারণ সমস্যা এবং সমাধান

**চ্যাপ্টার নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD ফর বিগিনারস](../../README.md)
- **📖 বর্তমান চ্যাপ্টার**: চ্যাপ্টার ৭ - সমস্যা সমাধান ও ডিবাগিং
- **⬅️ পূর্ববর্তী চ্যাপ্টার**: [চ্যাপ্টার ৬: প্রি-ফ্লাইট চেকস](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ পরবর্তী**: [ডিবাগিং গাইড](debugging.md)
- **🚀 পরবর্তী চ্যাপ্টার**: [চ্যাপ্টার ৮: প্রোডাকশন ও এন্টারপ্রাইজ প্যাটার্নস](../chapter-08-production/production-ai-practices.md)

## পরিচিতি

এই ব্যাপক ট্রাবলশুটিং গাইডটি Azure Developer CLI ব্যবহারের সময় সবচেয়ে বেশি দেখা সাধারণ সমস্যাগুলো কভার করে। অটেনটিকেশন, ডিপ্লয়মেন্ট, অবকাঠামো প্রোভিশনিং, এবং অ্যাপ্লিকেশন কনফিগারেশনের সাধারণ সমস্যা নির্ণয়, সমাধান এবং ঠিক করার পদ্ধতি শিখুন। প্রতিটি সমস্যার বিস্তারিত উপসর্গ, মূল কারণ এবং ধাপে ধাপে সমাধান প্রক্রিয়া অন্তর্ভুক্ত করা হয়েছে।

## শেখার লক্ষ্য

এই গাইডটি সম্পন্ন করার মাধ্যমে আপনি:
- Azure Developer CLI সমস্যা সমাধানে ডায়াগনস্টিক কৌশল আয়ত্ত করবেন
- সাধারণ অটেনটিকেশন এবং অনুমতি সমস্যা এবং তাদের সমাধান বুঝতে পারবেন
- ডিপ্লয়মেন্ট ব্যর্থতা, অবকাঠামো প্রোভিশনিং ত্রুটি এবং কনফিগারেশন সমস্যা সমাধান করতে পারবেন
- প্রোঅ্যাকটিভ মনিটরিং এবং ডিবাগিং কৌশল বাস্তবায়ন করবেন
- জটিল সমস্যাগুলোর জন্য সিস্টেমেটিক ট্রাবলশুটিং পদ্ধতি প্রয়োগ করবেন
- ভবিষ্যতে সমস্যা প্রতিরোধে সঠিক লগিং ও মনিটরিং কনফিগার করবেন

## শেখার ফলাফল

গাইড শেষে আপনি সক্ষম হবেন:
- বিল্ট-ইন ডায়াগনস্টিক টুল ব্যবহার করে Azure Developer CLI সমস্যা নির্ণয় করতে
- অটেনটিকেশন, সাবস্ক্রিপশন ও অনুমতি সম্পর্কিত সমস্যা স্বতন্ত্রভাবে সমাধান করতে
- ডিপ্লয়মেন্ট ব্যর্থতা ও অবকাঠামো প্রোভিশনিং ত্রুটি কার্যকরভাবে ট্রাবলশুট করতে
- অ্যাপ্লিকেশন কনফিগারেশন সমস্যা এবং পরিবেশনির্দিষ্ট সমস্যা ডিবাগ করতে
- সম্ভাব্য সমস্যাগুলো প্রোঅ্যাকটিভভাবে শনাক্ত করতে মনিটরিং ও অ্যালার্টিং প্রয়োগ করতে
- লগিং, ডিবাগিং এবং সমস্যা সমাধানের ওয়ার্কফ্লো জন্য সেরা অনুশীলন বাস্তবায়ন করতে

## দ্রুত ডায়াগনস্টিক

> নির্দিষ্ট নাম/আইডি আপনার পরিবেশ অনুযায়ী পরিবর্তন করুন। নিচে আলাদাভাবে বাশ, বিসেপ, জাভাস্ক্রিপ্ট এবং প্যারামিটার-ফাইল ফ্র্যাগমেন্ট লেবেল করা হয়েছে; এগুলো একক কোন এক্সিকিউটেবল স্ক্রিপ্ট নয়। ধ্বংসাত্মক অপারেশন রিভিউ করুন এবং ডায়াগনস্টিক শেয়ার করার আগে সিক্রেটস রেড্যাক্ট করুন। `azd monitor --logs` একটি ব্রাউজার খুলবে; টার্মিনাল লগ স্ট্রিম করবে না।

নির্দিষ্ট সমস্যাগুলিতে যাওয়ার আগে, নিচের কমান্ডগুলো চালিয়ে ডায়াগনস্টিক তথ্য সংগ্রহ করুন:

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

## অটেনটিকেশন সমস্যা

### সমস্যা: "অ্যাকসেস টোকেন পাওয়া যায়নি"
**উপসর্গসমূহ:**
- `azd up` অটেনটিকেশন ত্রুটির সাথে ব্যর্থ হয়
- কমান্ডগুলো "অনুমোদিত নয়" বা "অ্যাকসেস অস্বীকৃত" রিটার্ন করে

**সমাধানসমূহ:**
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

### সমস্যা: ডিপ্লয়মেন্টের সময় "অপর্যাপ্ত অনুমতি"
**উপসর্গসমূহ:**
- অনুমতির ত্রুটিতে ডিপ্লয়মেন্ট ব্যর্থ হয়
- নির্দিষ্ট Azure রিসোর্স তৈরি করতে পারে না

**সমাধানসমূহ:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### সমস্যা: মাল্টি-টেন্যান্ট অটেনটিকেশন সমস্যা
**সমাধানসমূহ:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ অবকাঠামো প্রোভিশনিং ত্রুটি

### সমস্যা: রিসোর্স নামের দ্বন্দ্ব
**উপসর্গসমূহ:**
- "রিসোর্সের নাম ইতিমধ্যে বিদ্যমান" ত্রুটি
- রিসোর্স তৈরি করার সময় ডিপ্লয়মেন্ট ব্যর্থ হয়

**সমাধানসমূহ:**
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

### সমস্যা: লোকেশন/অঞ্চল পাওয়া যায় না
**উপসর্গসমূহ:**
- "xyz" লোকেশন রিসোর্স টাইপের জন্য উপলব্ধ নয়
- বাছাই করা অঞ্চলে কিছু SKU উপলব্ধ নয়

**সমাধানসমূহ:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

লোকেশন ভেরিয়েবল পরিবর্তন করলে বিদ্যমান রিসোর্স স্থানান্তরিত হয় না। বিদ্যমান রিসোর্স গ্রুপ বা রিসোর্স লোকেশন পরিবর্তন প্রত্যাখ্যান করতে পারে; আঞ্চলিক পুনঃডিপ্লয়মেন্টের জন্য আলাদা পরিবেশ ব্যবহার করুন।

### সমস্যা: কোটা অতিক্রমের ত্রুটি
**উপসর্গসমূহ:**
- "রিসোর্স টাইপের জন্য কোটা অতিক্রম হয়েছে"
- "সর্বোচ্চ রিসোর্স সংখ্যা পৌঁছেছে"

**সমাধানসমূহ:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

ডেভেলপমেন্টের জন্য `infra/main.parameters.json`-এ সমর্থিত ছোট SKU বেছে নিন:

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

### সমস্যা: বিসেপ টেমপ্লেট ত্রুটি
**উপসর্গসমূহ:**
- টেমপ্লেট ভ্যালিডেশন ব্যর্থতা
- বিসেপ ফাইলে সিনট্যাক্স ত্রুটি

**সমাধানসমূহ:**
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
**উপসর্গসমূহ:**
- ডিপ্লয়মেন্টের সময় অ্যাপ্লিকেশন বিল্ড করতে ব্যর্থ
- প্যাকেজ ইনস্টলেশনের ত্রুটি

**সমাধানসমূহ:**
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

### সমস্যা: কনটেইনার ডিপ্লয়মেন্ট ব্যর্থতা
**উপসর্গসমূহ:**
- কনটেইনার অ্যাপ্লিকেশন শুরু হতে ব্যর্থ
- ইমেজ পুল ত্রুটি

**সমাধানসমূহ:**
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

### সমস্যা: ডাটাবেস সংযোগ ব্যর্থতা
**উপসর্গসমূহ:**
- অ্যাপ্লিকেশন ডাটাবেসে কানেক্ট করতে পারছে না
- কানেকশন টাইমআউট ত্রুটি

**সমাধানসমূহ:**
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
**উপসর্গসমূহ:**
- অ্যাপ কনফিগারেশন মান পড়তে পারছে না
- পরিবেশ ভেরিয়েবলগুলো খালি দেখাচ্ছে

**সমাধানসমূহ:**
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

### সমস্যা: SSL/TLS সার্টিফিকেট সমস্যা
**উপসর্গসমূহ:**
- HTTPS কাজ করছে না
- সার্টিফিকেট যাচাইকরণ ত্রুটি

**সমাধানসমূহ:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### সমস্যা: CORS কনফিগারেশন সমস্যা
**উপসর্গসমূহ:**
- ফ্রন্টেন্ড API কল করতে পারছে না
- ক্রস-অরিজিন রিকোয়েস্ট ব্লক হয়েছে

**সমাধানসমূহ:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

২. আপনার বিদ্যমান Express অ্যাপ্লিকেশনটি আপডেট করুন (যেখানে `cors` ইম্পোর্ট করা হয়েছে):

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

## 🌍 পরিবেশ ব্যবস্থাপনা সমস্যা

### সমস্যা: পরিবেশ পরিবর্তনের সমস্যা
**উপসর্গসমূহ:**
- ভুল পরিবেশ ব্যবহার হচ্ছে
- কনফিগারেশন সঠিকভাবে পরিবর্তিত হচ্ছে না

**সমাধানসমূহ:**
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

### সমস্যা: পরিবেশ দূষণ
**উপসর্গসমূহ:**
- পরিবেশ অবৈধ অবস্থা দেখাচ্ছে
- রিসোর্স কনফিগারেশনের সাথে মিলছে না

**সমাধানসমূহ:**
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

## 🔍 কর্মক্ষমতা সমস্যা

### সমস্যা: ধীর ডিপ্লয়মেন্ট সময়
**উপসর্গসমূহ:**
- ডিপ্লয়মেন্ট অনেক সময় নিচ্ছে
- ডিপ্লয়মেন্টের সময় টাইমআউট

**সমাধানসমূহ:**
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

### সমস্যা: অ্যাপ্লিকেশন কর্মক্ষমতার সমস্যা
**উপসর্গসমূহ:**
- ধীর সাড়া সময়
- উচ্চ রিসোর্স ব্যবহার

**সমাধানসমূহ:**
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

## 🛠️ ট্রাবলশুটিং টুল এবং কমান্ড

### ডিবাগ কমান্ড
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

### লগ বিশ্লেষণ
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

### কখন এস্কেলেট করবেন
- সব সমাধান চেষ্টা করার পরেও অটেনটিকেশন সমস্যা থাকে
- Azure সেবাগুলোর অবকাঠামো সমস্যা
- বিলিং বা সাবস্ক্রিপশন সম্পর্কিত সমস্যা
- নিরাপত্তা উদ্বেগ বা ঘটনা

### সহায়তা চ্যানেলস
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

### সংগ্রহ করার তথ্য
সহায়তা যোগাযোগ করার আগে, সংগ্রহ করুন:
- `azd version` আউটপুট
- `azd config show` আউটপুট
- `azd show` আউটপুট (বর্তমান ডিপ্লয়মেন্ট স্ট্যাটাস)
- ত্রুটি বার্তা (সম্পূর্ণ টেক্সট)
- সমস্যা পুনরুত্পাদনের ধাপসমূহ
- রেড্যাক্টেড পরিবেশ বিবরণ (কখনোই কাঁচা `azd env get-values` শেয়ার করবেন না, এতে সিক্রেটস থাকতে পারে)
- সমস্যাটি কখন শুরু হয়েছিল তার টাইমলাইন

### লগ সংগ্রহ স্ক্রিপ্ট
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

## 📊 সমস্যা প্রতিরোধ

### পূর্ব-ডিপ্লয়মেন্ট চেকলিস্ট
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

### মনিটরিং সেটআপ
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

### নিয়মিত রক্ষণাবেক্ষণ
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## সম্পর্কিত রিসোর্সসমূহ

- [ডিবাগিং গাইড](debugging.md) - উন্নত ডিবাগিং কৌশল
- [রিসোর্স প্রোভিশনিং](../chapter-04-infrastructure/provisioning.md) - অবকাঠামো ট্রাবলশুটিং
- [ক্যাপাসিটি প্ল্যানিং](../chapter-06-pre-deployment/capacity-planning.md) - রিসোর্স পরিকল্পনার নির্দেশনা
- [SKU নির্বাচন](../chapter-06-pre-deployment/sku-selection.md) - সার্ভিস টিয়ার পরামর্শ

---

**টিপ**: এই গাইডটি বুকমার্ক রাখুন এবং যখনই সমস্যা দেখবেন তখন রেফার করুন। অধিকাংশ সমস্যা আগেও দেখা গেছে এবং তাদের নির্ধারিত সমাধান রয়েছে!

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [রিসোর্স প্রোভিশনিং](../chapter-04-infrastructure/provisioning.md)
- **পরবর্তী পাঠ**: [ডিবাগিং গাইড](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->