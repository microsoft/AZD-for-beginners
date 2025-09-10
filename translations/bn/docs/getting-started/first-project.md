<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T13:01:47+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "bn"
}
-->
# আপনার প্রথম প্রকল্প - হাতে-কলমে টিউটোরিয়াল

## ভূমিকা

আপনার প্রথম Azure Developer CLI প্রকল্পে স্বাগতম! এই বিস্তারিত হাতে-কলমে টিউটোরিয়ালটি আপনাকে একটি সম্পূর্ণ walkthrough প্রদান করবে যেখানে আপনি azd ব্যবহার করে Azure-এ একটি পূর্ণাঙ্গ অ্যাপ্লিকেশন তৈরি, ডিপ্লয় এবং পরিচালনা করবেন। আপনি একটি বাস্তব todo অ্যাপ্লিকেশনের সাথে কাজ করবেন, যার মধ্যে রয়েছে React ফ্রন্টএন্ড, Node.js API ব্যাকএন্ড এবং MongoDB ডাটাবেস।

## শেখার লক্ষ্য

এই টিউটোরিয়াল সম্পন্ন করার মাধ্যমে আপনি:
- টেমপ্লেট ব্যবহার করে azd প্রকল্প initialization workflow আয়ত্ত করবেন
- Azure Developer CLI প্রকল্পের গঠন এবং কনফিগারেশন ফাইলগুলি বুঝতে পারবেন
- Azure-এ সম্পূর্ণ অ্যাপ্লিকেশন ডিপ্লয়মেন্ট এবং infrastructure provisioning সম্পন্ন করবেন
- অ্যাপ্লিকেশন আপডেট এবং পুনরায় ডিপ্লয়মেন্ট কৌশল বাস্তবায়ন করবেন
- ডেভেলপমেন্ট এবং স্টেজিংয়ের জন্য একাধিক পরিবেশ পরিচালনা করবেন
- রিসোর্স ক্লিনআপ এবং খরচ ব্যবস্থাপনার পদ্ধতি প্রয়োগ করবেন

## শেখার ফলাফল

টিউটোরিয়াল সম্পন্ন করার পর আপনি:
- টেমপ্লেট থেকে azd প্রকল্প initialization এবং কনফিগার করতে পারবেন
- azd প্রকল্পের গঠন সঠিকভাবে নেভিগেট এবং পরিবর্তন করতে পারবেন
- একক কমান্ড ব্যবহার করে Azure-এ পূর্ণাঙ্গ অ্যাপ্লিকেশন ডিপ্লয় করতে পারবেন
- সাধারণ ডিপ্লয়মেন্ট সমস্যা এবং authentication সমস্যাগুলি সমাধান করতে পারবেন
- বিভিন্ন ডিপ্লয়মেন্ট পর্যায়ের জন্য একাধিক Azure পরিবেশ পরিচালনা করতে পারবেন
- অ্যাপ্লিকেশন আপডেটের জন্য ক্রমাগত ডিপ্লয়মেন্ট workflow বাস্তবায়ন করতে পারবেন

## শুরু করা যাক

### প্রয়োজনীয়তার চেকলিস্ট
- ✅ Azure Developer CLI ইনস্টল করা ([ইনস্টলেশন গাইড](installation.md))
- ✅ Azure CLI ইনস্টল এবং authenticated
- ✅ আপনার সিস্টেমে Git ইনস্টল করা
- ✅ Node.js 16+ (এই টিউটোরিয়ালের জন্য)
- ✅ Visual Studio Code (প্রস্তাবিত)

### আপনার সেটআপ যাচাই করুন
```bash
# Check azd installation
azd version
```
### Azure authentication যাচাই করুন

```bash
az account show
```

### Node.js সংস্করণ পরীক্ষা করুন
```bash
node --version
```

## ধাপ ১: একটি টেমপ্লেট নির্বাচন এবং initialize করুন

চলুন একটি জনপ্রিয় todo অ্যাপ্লিকেশন টেমপ্লেট দিয়ে শুরু করি, যার মধ্যে রয়েছে React ফ্রন্টএন্ড এবং Node.js API ব্যাকএন্ড।

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### কী ঘটল?
- টেমপ্লেট কোড আপনার লোকাল ডিরেক্টরিতে ডাউনলোড হয়েছে
- একটি `azure.yaml` ফাইল তৈরি হয়েছে যেখানে সার্ভিস ডেফিনিশন রয়েছে
- `infra/` ডিরেক্টরিতে infrastructure কোড সেটআপ হয়েছে
- একটি environment configuration তৈরি হয়েছে

## ধাপ ২: প্রকল্পের গঠন অন্বেষণ করুন

চলুন দেখি azd আমাদের জন্য কী তৈরি করেছে:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

আপনার দেখতে পাওয়া উচিত:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### গুরুত্বপূর্ণ ফাইলগুলি বুঝুন

**azure.yaml** - আপনার azd প্রকল্পের মূল:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastructure ডেফিনিশন:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## ধাপ ৩: আপনার প্রকল্প কাস্টমাইজ করুন (ঐচ্ছিক)

ডিপ্লয় করার আগে আপনি অ্যাপ্লিকেশন কাস্টমাইজ করতে পারেন:

### ফ্রন্টএন্ড পরিবর্তন করুন
```bash
# Open the React app component
code src/web/src/App.tsx
```

একটি সাধারণ পরিবর্তন করুন:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### পরিবেশ ভেরিয়েবল কনফিগার করুন
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## ধাপ ৪: Azure-এ ডিপ্লয় করুন

এখন উত্তেজনাপূর্ণ অংশ - সবকিছু Azure-এ ডিপ্লয় করুন!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### ডিপ্লয়মেন্টের সময় কী ঘটছে?

`azd up` কমান্ড নিম্নলিখিত ধাপগুলি সম্পন্ন করে:
1. **Provision** (`azd provision`) - Azure রিসোর্স তৈরি করে
2. **Package** - আপনার অ্যাপ্লিকেশন কোড তৈরি করে
3. **Deploy** (`azd deploy`) - কোড Azure রিসোর্সে ডিপ্লয় করে

### প্রত্যাশিত আউটপুট
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ধাপ ৫: আপনার অ্যাপ্লিকেশন পরীক্ষা করুন

### আপনার অ্যাপ্লিকেশন অ্যাক্সেস করুন
ডিপ্লয়মেন্ট আউটপুটে প্রদত্ত URL-এ ক্লিক করুন, অথবা যেকোনো সময় এটি পান:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Todo অ্যাপ পরীক্ষা করুন
1. **একটি todo আইটেম যোগ করুন** - "Add Todo" ক্লিক করুন এবং একটি টাস্ক লিখুন
2. **সম্পন্ন হিসেবে চিহ্নিত করুন** - সম্পন্ন আইটেম চেক করুন
3. **আইটেম মুছুন** - প্রয়োজন নেই এমন todo মুছে ফেলুন

### আপনার অ্যাপ্লিকেশন মনিটর করুন
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## ধাপ ৬: পরিবর্তন করুন এবং পুনরায় ডিপ্লয় করুন

চলুন একটি পরিবর্তন করি এবং দেখুন কীভাবে এটি আপডেট করা সহজ:

### API পরিবর্তন করুন
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

একটি কাস্টম রেসপন্স হেডার যোগ করুন:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### শুধুমাত্র কোড পরিবর্তন ডিপ্লয় করুন
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## ধাপ ৭: একাধিক পরিবেশ পরিচালনা করুন

প্রোডাকশনের আগে পরিবর্তন পরীক্ষা করার জন্য একটি স্টেজিং পরিবেশ তৈরি করুন:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### পরিবেশ তুলনা
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## ধাপ ৮: রিসোর্স ক্লিনআপ করুন

পরীক্ষা শেষ হলে, চলমান চার্জ এড়াতে ক্লিনআপ করুন:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## আপনি কী শিখেছেন

অভিনন্দন! আপনি সফলভাবে:
- একটি টেমপ্লেট থেকে azd প্রকল্প initialize করেছেন
- প্রকল্পের গঠন এবং গুরুত্বপূর্ণ ফাইলগুলি অন্বেষণ করেছেন
- Azure-এ একটি পূর্ণাঙ্গ অ্যাপ্লিকেশন ডিপ্লয় করেছেন
- কোড পরিবর্তন করেছেন এবং পুনরায় ডিপ্লয় করেছেন
- একাধিক পরিবেশ পরিচালনা করেছেন
- রিসোর্স ক্লিনআপ করেছেন

## সাধারণ সমস্যার সমাধান

### Authentication ত্রুটি
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### ডিপ্লয়মেন্ট ব্যর্থতা
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### রিসোর্স নামের দ্বন্দ্ব
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### পোর্ট/নেটওয়ার্ক সমস্যা
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## পরবর্তী পদক্ষেপ

আপনার প্রথম প্রকল্প সম্পন্ন করার পর, এই উন্নত বিষয়গুলি অন্বেষণ করুন:

### ১. Infrastructure কাস্টমাইজ করুন
- [Infrastructure as Code](../deployment/provisioning.md)
- [ডাটাবেস, স্টোরেজ এবং অন্যান্য সার্ভিস যোগ করুন](../deployment/provisioning.md#adding-services)

### ২. CI/CD সেটআপ করুন
- [GitHub Actions Integration](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### ৩. প্রোডাকশন সেরা অনুশীলন
- [সিকিউরিটি কনফিগারেশন](../deployment/best-practices.md#security)
- [পারফরম্যান্স অপ্টিমাইজেশন](../deployment/best-practices.md#performance)
- [মনিটরিং এবং লগিং](../deployment/best-practices.md#monitoring)

### ৪. আরও টেমপ্লেট অন্বেষণ করুন
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## অতিরিক্ত রিসোর্স

### শেখার উপকরণ
- [Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### কমিউনিটি এবং সাপোর্ট
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### টেমপ্লেট এবং উদাহরণ
- [অফিশিয়াল টেমপ্লেট গ্যালারি](https://azure.github.io/awesome-azd/)
- [কমিউনিটি টেমপ্লেট](https://github.com/Azure-Samples/azd-templates)
- [এন্টারপ্রাইজ প্যাটার্ন](https://github.com/Azure/azure-dev/tree/main/templates)

---

**অভিনন্দন আপনার প্রথম azd প্রকল্প সম্পন্ন করার জন্য!** এখন আপনি আত্মবিশ্বাসের সাথে Azure-এ চমৎকার অ্যাপ্লিকেশন তৈরি এবং ডিপ্লয় করতে প্রস্তুত।

---

**নেভিগেশন**
- **পূর্ববর্তী পাঠ**: [Configuration](configuration.md)
- **পরবর্তী পাঠ**: [Deployment Guide](../deployment/deployment-guide.md)

---

**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যা হলে আমরা দায়বদ্ধ থাকব না।