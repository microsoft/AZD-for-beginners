# আপনার প্রথম প্রকল্প - হাতে কলমে টিউটোরিয়াল

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 1 - ভিত্তি ও দ্রুত শুরু
- **⬅️ পূর্ববর্তী**: [ইনস্টলেশন ও সেটআপ](installation.md)
- **➡️ পরবর্তী**: [নিজস্ব অ্যাপ আনুন](bring-your-own-app.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় 2: AI-প্রথম উন্নয়ন](../chapter-02-ai-development/microsoft-foundry-integration.md)

## পরিচিতি

আপনার প্রথম Azure Developer CLI প্রকল্পে স্বাগতম! আপনি একটি todo অ্যাপ্লিকেশন ডিপ্লয় করবেন যা একটি React ফ্রন্টএন্ড, Node.js API এবং Azure Cosmos DB সহ। টেম্পলেটটি ঐতিহাসিক নাম `todo-nodejs-mongo` ধরে রেখেছে; এর বর্তমান অবকাঠামো Cosmos DB ব্যবহার করে NoSQL এর জন্য, তাই ডাউনলোডকৃত README এবং `infra/` পরীক্ষা করুন নাহলে নাম থেকে ডেটাবেস API অনুমান করবেন না।

> নভেম্বর ২০২৬ এ `azd 1.37.2` এবং পাবলিক টেম্পলেটের বিরুদ্ধে পর্যালোচনা করা হয়েছে। নিচের উদাহরণগুলো জন্য Bash ব্যবহার করা হয়েছে; JSON নিষ্কাশনের জন্য `jq` প্রয়োজন। Azure ডিপ্লয়মেন্ট চার্জ দেয় এবং এই পর্যালোচনার সময় কার্যকর করা হয়নি।

## শিক্ষার লক্ষ্যমাত্রা

এই টিউটোরিয়াল সম্পূর্ণ করলে আপনি:
- azd প্রকল্প আরম্ভের কাজ ফ্লো টেম্পলেট ব্যবহার করে আয়ত্ত করবেন
- Azure Developer CLI প্রকল্প কাঠামো ও কনফিগারেশন ফাইল বুঝতে পারবেন
- অবকাঠামো সুব্যবস্থাপনা সহ সম্পূর্ণ অ্যাপ্লিকেশন Azure-এ ডিপ্লয় করতে পারবেন
- অ্যাপ্লিকেশন আপডেট এবং পুনরায় ডিপ্লয়মেন্ট কৌশল প্রয়োগ করতে পারবেন
- উন্নয়ন এবং স্টেজিংয়ের জন্য একাধিক পরিবেশ পরিচালনা করতে পারবেন
- রিসোর্স পরিস্কার ও খরচ ব্যবস্থাপনা অনুশীলন করবেন

## শেখার ফলাফল

শেষে আপনি সক্ষম হবেন:
- স্বাধীনভাবে টেম্পলেট থেকে azd প্রকল্প আরম্ভ ও কনফিগার করতে
- কার্যকরভাবে azd প্রকল্প কাঠামো নেভিগেট ও পরিবর্তন করতে
- একক কমান্ডে Azure-এ ফুল-স্ট্যাক অ্যাপ্লিকেশন ডিপ্লয় করতে
- সাধারণ ডিপ্লয়মেন্ট সমস্যা এবং প্রমাণীকরণ সমস্যা সমাধান করতে
- ভিন্ন ডিপ্লয়মেন্ট স্তরের জন্য একাধিক Azure পরিবেশ পরিচালনা করতে
- অ্যাপ্লিকেশন আপডেটের জন্য ধারাবাহিক ডিপ্লয়মেন্ট ওয়ার্কফ্লো প্রয়োগ করতে

## শুরু করা যাক

### পূর্বশর্ত চেকলিস্ট
- ✅ Azure Developer CLI ইন্সটল করা ([ইনস্টলেশন গাইড](installation.md))
- ✅ AZD প্রমাণীকরণ সম্পন্ন হয়েছে `azd auth login` দিয়ে
- ✅ সিস্টেমে Git ইন্সটল করা আছে
- ✅ Node.js ২২ LTS (অথবা ডাউনলোডকৃত টেম্পলেট যা সমর্থন করে এমন সংস্করণ)
- ✅ Visual Studio Code (প্রস্তাবিত)

চালিয়ে যাওয়ার আগে, রিপোজিটরি মূল থেকে সেটআপ ভ্যালিডেটর চালান:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### আপনার সেটআপ যাচাই করুন
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### ঐচ্ছিক Azure CLI প্রমাণীকরণ যাচাই করুন

```bash
az account show
```

### Node.js সংস্করণ যাচাই করুন
```bash
node --version
```

## ধাপ ১: একটি টেম্পলেট নির্বাচন ও আরম্ভ করা

চলুন একটি জনপ্রিয় todo অ্যাপ্লিকেশন টেম্পলেট দিয়ে শুরু করি যার মধ্যে React ফ্রন্টএন্ড এবং Node.js API ব্যাকএন্ড রয়েছে।

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### কী ঘটল?
- টেম্পলেট কোড স্থানীয় ডিরেক্টরিতে ডাউনলোড করা হয়েছে
- সার্ভিস সংজ্ঞাগুলোসহ `azure.yaml` ফাইল তৈরি করা হয়েছে
- অবকাঠামো কোড `infra/` ডিরেক্টরিতে সাজানো হয়েছে
- একটি পরিবেশ কনফিগারেশন তৈরি করা হয়েছে

## ধাপ ২: প্রকল্প কাঠামো অন্বেষণ করুন

চলুন দেখি azd আমাদের জন্য কী তৈরি করেছে:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

আপনি দেখতে পারবেন:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### বোঝার জন্য মূল ফাইলগুলো

**azure.yaml** - আপনার azd প্রকল্পের কেন্দ্রবিন্দু:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - অবকাঠামো সংজ্ঞা:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## ধাপ ৩: আপনার প্রকল্প কাস্টমাইজ করুন (ঐচ্ছিক)

ডিপ্লয়মেন্টের আগে, আপনি অ্যাপ্লিকেশনটি কাস্টমাইজ করতে পারেন:

### ফ্রন্টএন্ড পরিবর্তন করুন
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

একটি সাধারণ পরিবর্তন করুন:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### পরিবেশ পরিবর্তনশীল কনফিগার করুন
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

এই দুটি কাস্টম মান শুধুমাত্র লোকাল স্টোরেজ প্রদর্শন করে। স্টক টেম্পলেট `WEBSITE_TITLE` বা `API_VERSION` ব্যবহার করে না, তাই এগুলো অ্যাপ্লিকেশন পরিবর্তন করে না। উপরের স্পষ্ট সোর্স সম্পাদনাটি প্রদর্শিত শিরোনাম পরিবর্তন করে।

## ধাপ ৪: Azure-এ ডিপ্লয় করুন

এবার উত্তেজনাপূর্ণ অংশ - সবকিছু Azure-এ ডিপ্লয় করা!

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

ওয়ার্কফ্লো অবকাঠামো প্রদান এবং প্যাকেজ/কোড ডিপ্লয় করে। সঠিক ক্রম নির্ধারণ করা যায় `workflows.up` এর মাধ্যমে `azure.yaml` এ; এই টেম্পলেট প্রদানের পরে ডিপ্লয় নির্ধারণ করে। সব টেম্পলেটের জন্য একটি সাধারণ ধাপ অর্ডারে নির্ভর করবেন না।

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

### আপনার অ্যাপ্লিকেশন প্রবেশাধিকার করুন
ডিপ্লয়মেন্ট আউটপুটে দেওয়া URL এ ক্লিক করুন, অথবা যেকোনো সময় নিন:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Todo অ্যাপ পরীক্ষা করুন
1. **একটি todo আইটেম যোগ করুন** - "Add Todo" ক্লিক করে একটি কাজ লিখুন
2. **সম্পন্ন হিসাবে চিহ্নিত করুন** - সম্পন্ন আইটেমগুলো চেক করুন
3. **আইটেম মুছে ফেলুন** - আর ব্যবহার হয় না এমন todo গুলো মুছে ফেলুন

### আপনার অ্যাপ্লিকেশন পর্যবেক্ষণ করুন
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ আপনার ডিপ্লয়মেন্ট যাচাই করুন

এগিয়ে যাওয়ার আগে, এই দ্রুত চেকলিস্ট দিয়ে নিশ্চিত করুন সবকিছু ঠিকঠাক কাজ করছে—শুধুমাত্র "deploy succeeded" মানে "অ্যাপ কাজ করে" না:

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**ডিপ্লয়মেন্ট যাচাই হয় যখন:**
- ✅ `azd show` একটি পৌঁছনোর URL তালিকাভুক্ত করে
- ✅ URLটি ব্রাউজারে ত্রুটিমুক্ত খুলে
- ✅ মূল বৈশিষ্ট্যগুলো কাজ করে (todo যোগ/সম্পন্ন/ডিলিট)
- ✅ `azd monitor --logs` বিজ্ঞপ্তি ব্যতীত আর কোন সমস্যা ছাড়াই অনুরোধ আসে দেখায়

যদি কোনো চেক ব্যর্থ হয়, যান [অধ্যায় 7: সমস্যানিরসন](../chapter-07-troubleshooting/README.md) এ।

## ধাপ ৬: পরিবর্তন করুন এবং পুনরায় ডিপ্লয় করুন

চলুন একটি পরিবর্তন করি এবং দেখি কীভাবে সহজে আপডেট করা যায়:

### API পরিবর্তন করুন
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

একটি কাস্টম রেসপন্স হেডার যোগ করুন:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### শুধুমাত্র কোড পরিবর্তনগুলো ডিপ্লয় করুন
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## ধাপ ৭: একাধিক পরিবেশ পরিচালনা করুন

উৎপাদনের আগে পরিবর্তন পরীক্ষা করার জন্য একটি স্টেজিং পরিবেশ তৈরি করুন:

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

## ধাপ ৮: রিসোর্স পরিস্কার করুন

পরীক্ষা শেষ হলে, চলমান চার্জ এড়াতে পরিস্কার করুন:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## ক্লাসিক অ্যাপ বনাম AI-চালিত অ্যাপ: একই ওয়ার্কফ্লো

আপনি একটি ঐতিহ্যগত ওয়েব অ্যাপ্লিকেশন ডিপ্লয় করেছেন। কিন্তু যদি আপনি AI-চালিত অ্যাপ—যেমন Microsoft Foundry Models দ্বারা চালিত চ্যাট অ্যাপ—ডিপ্লয় করতে চান?

ভালো খবর: **ওয়ার্কফ্লো একই রকম।**

| ধাপ | ক্লাসিক Todo অ্যাপ | AI চ্যাট অ্যাপ |
|------|-----------------|-------------|
| আরম্ভ (খালি ডিরেক্টরি) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| প্রমাণীকরণ | `azd auth login` | `azd auth login` |
| ডিপ্লয় | `azd up` | `azd up` |
| পর্যবেক্ষণ | `azd monitor` | `azd monitor` |
| পরিস্কার | `azd down --force --purge` | `azd down --force --purge` |

জীববৃত্তের কমান্ড সমান, তবে পূর্বশর্ত ভিন্ন। একটি AI টেম্পলেট মডেল অ্যাক্সেস, আঞ্চলিক কোটা, ডেটা ইনজেশন এবং অতিরিক্ত কনফিগারেশন প্রয়োজন হতে পারে। ডিপ্লয়মেন্টের আগে এর README পড়ুন; `azd up` অনুপস্থিত অনুমতি বা কোটা দিতে পারে না।

এটা হল azd এর মূল নীতি: **এক ওয়ার্কফ্লো, যেকোন কাজ।** আপনি এই টিউটোরিয়ালে চর্চা করা দক্ষতাগুলো—আরম্ভ, ডিপ্লয়, পর্যবেক্ষণ, পুনরায় ডিপ্লয়, এবং পরিস্কার—AI অ্যাপ্লিকেশন এবং এজেন্ট ক্ষেত্রেও সমানভাবে প্রযোজ্য।

---

## আপনি যা শিখলেন

শুভেচ্ছা! আপনি সফলভাবে:
- ✅ টেম্পলেট থেকে azd প্রকল্প আরম্ভ করেছেন
- ✅ প্রকল্প কাঠামো এবং মূল ফাইলসমূহ অন্বেষণ করেছেন
- ✅ Azure-এ ফুল-স্ট্যাক অ্যাপ্লিকেশন ডিপ্লয় করেছেন
- ✅ কোড পরিবর্তন করেছেন এবং পুনরায় ডিপ্লয় করেছেন
- ✅ একাধিক পরিবেশ পরিচালনা করেছেন
- ✅ রিসোর্স পরিস্কার করেছেন

## 🎯 দক্ষতা যাচাই অনুশীলন

### অনুশীলন ১: ভিন্ন টেম্পলেট ডিপ্লয় (১৫ মিনিট)
**লক্ষ্য**: azd init এবং ডিপ্লয়মেন্ট ওয়ার্কফ্লো দক্ষতায় পারদর্শিতা প্রদর্শন

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**সাফল্যের মানদণ্ড:**
- [ ] অ্যাপ্লিকেশন ত্রুটিমুক্ত ডিপ্লয় হয়
- [ ] ব্রাউজারে অ্যাপ্লিকেশন URL প্রবেশযোগ্য
- [ ] অ্যাপ্লিকেশন সঠিকভাবে কাজ করে (todo যোগ/অপসারণ)
- [ ] সফলভাবে সব রিসোর্স পরিস্কার হয়েছে

### অনুশীলন ২: কনফিগারেশন কাস্টমাইজেশন (২০ মিনিট)
**লক্ষ্য**: লোকাল পরিবেশ মান সংরক্ষণ অনুশীলন করুন, রানটাইম কনফিগারেশন ভুলে যাবেন না

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**সাফল্যের মানদণ্ড:**
- [ ] কাস্টম পরিবেশ সফলভাবে তৈরি হয়েছে
- [ ] পরিবেশ পরিবর্তনশীল সেট এবং ফেরত পাওয়া যায়
- [ ] `azd env get-value APP_TITLE` আউটপুট `My Custom Todo App` প্রদর্শন করে
- [ ] ব্যাখ্যা করতে পারেন কেন এই মানগুলো স্টক অ্যাপ পরিবর্তন করে না যদি না কোড/অবকাঠামো সেগুলো ব্যবহার করে

### অনুশীলন ৩: একাধিক পরিবেশ ওয়ার্কফ্লো (২৫ মিনিট)
**লক্ষ্য**: পরিবেশ ব্যবস্থাপনা ও ডিপ্লয়মেন্ট কৌশল আয়ত্ত করা

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**সাফল্যের মানদণ্ড:**
- [ ] ভিন্ন কনফিগারেশনে দুইটি পরিবেশ তৈরি হয়েছে
- [ ] উভয় পরিবেশ সফলভাবে ডিপ্লয় হয়েছে
- [ ] `azd env select` ব্যবহার করে পরিবেশ পরিবর্তন করা যায়
- [ ] পরিবেশ পরিবর্তনশীল দুই পরিবেশে ভিন্ন
- [ ] উভয় পরিবেশ সফলভাবে পরিস্কার হয়েছে

## 📊 আপনার অগ্রগতি

**সময় ব্যয়**: ~৬০-৯০ মিনিট  
**অর্জিত দক্ষতা:**
- ✅ টেম্পলেট-ভিত্তিক প্রকল্প আরম্ভ
- ✅ Azure রিসোর্স প্রদান
- ✅ অ্যাপ্লিকেশন ডিপ্লয়মেন্ট ওয়ার্কফ্লো
- ✅ পরিবেশ ব্যবস্থাপনা
- ✅ কনফিগারেশন ব্যবস্থাপনা
- ✅ রিসোর্স পরিস্কার ও খরচ ব্যবস্থাপনা

**পরবর্তী স্তর**: আপনি [কনফিগারেশন গাইড](../chapter-03-configuration/configuration.md) এর জন্য প্রস্তুত, যাতে উন্নত কনফিগারেশন প্যাটার্ন শেখানো হয়!

## সাধারণ সমস্যার সমাধান

### প্রমাণীকরণ ত্রুটি
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### ডিপ্লয়মেন্ট ব্যর্থতা
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
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

## পরবর্তী ধাপ

এখন যেহেতু আপনার প্রথম প্রকল্প সম্পন্ন হয়েছে, এই উন্নত বিষয়গুলি অন্বেষণ করুন:

### ১. অবকাঠামো কাস্টমাইজ করুন
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [ডাটাবেস অবকাঠামো যোগ করুন](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### ২. CI/CD সেটআপ করুন
- [ডিপ্লয়মেন্ট গাইড](../chapter-04-infrastructure/deployment-guide.md) - সম্পূর্ণ CI/CD ওয়ার্কফ্লো
- [Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - পাইপলাইন কনফিগারেশন

### ৩. উৎপাদন শ্রেষ্ঠ অনুশীলন
- [ডিপ্লয়মেন্ট গাইড](../chapter-04-infrastructure/deployment-guide.md) - নিরাপত্তা, কর্মক্ষমতা এবং পর্যবেক্ষণ

### ৪. আরও টেম্পলেট অন্বেষণ করুন
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## অতিরিক্ত সম্পদ

### শেখার উপকরণ
- [Azure Developer CLI ডকুমেন্টেশন](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure আর্কিটেকচার সেন্টার](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure ভাল-আর্কিটেকচার্ড ফ্রেমওয়ার্ক](https://learn.microsoft.com/en-us/azure/well-architected/)

### কমিউনিটি ও সাপোর্ট
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### টেম্পলেট ও উদাহরণ
- [অফিশিয়াল টেম্পলেট গ্যালারি](https://azure.github.io/awesome-azd/)
- [কমিউনিটি টেম্পলেট অবদান](https://github.com/Azure/awesome-azd)
- [Todo টেম্পলেট সোর্স](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**আপনার প্রথম azd প্রকল্প সম্পন্ন করায় অভিনন্দন!** এখন আপনি আত্মবিশ্বাস সহকারে Azure-এ চমৎকার অ্যাপ্লিকেশন তৈরি ও ডিপ্লয় করতে প্রস্তুত।

---

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD For Beginners](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় 1 - ভিত্তি ও দ্রুত শুরু
- **⬅️ পূর্ববর্তী**: [ইনস্টলেশন ও সেটআপ](installation.md)
- **➡️ পরবর্তী**: [নিজস্ব অ্যাপ আনুন](bring-your-own-app.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় 2: AI-প্রথম উন্নয়ন](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত হয়েছে। যদিও আমরা শুদ্ধতার জন্য চেষ্টা করি, অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটি তার স্বভাষায় কর্তৃত্বপূর্ণ উৎস হিসেবে বিবেচিত হওয়া উচিত। গুরুত্বপূর্ণ তথ্যের জন্য পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদের ব্যবহারে প্রয়োজনীয় ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->