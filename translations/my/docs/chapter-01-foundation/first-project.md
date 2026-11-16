# သင်၏ ပထမဆုံး ပရောဂျက် - လက်တွေ့ သင်ခန်းစာ

**အခန်း လမ်းညွှန်:**
- **📚 သင်တန်း မူလ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 1 - အခြေခံနှင့် အမြန် စတင်ခြင်း
- **⬅️ ယခင်**: [Installation & Setup](installation.md)
- **➡️ နောက်တစ်ခု**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 နောက် အခန်း**: [အခန်း 2: AI-ပထမ ထုတ်လုပ်မှု](../chapter-02-ai-development/microsoft-foundry-integration.md)

## တင်သွင်းချက်

သင်၏ ပထမဆုံး Azure Developer CLI ပရောဂျက်ကို ကြိုဆိုပါတယ်! သင်သည် React ရှေ့ဆုံး အင်တာဖေ့စ်၊ Node.js API နှင့် Azure Cosmos DB ပါသော todo app တစ်ခုကို တပ်ဆင်ဖော်ဆောင်မည်ဖြစ်သည်။ ထုတ်ပြန်သည့် နာမည် `todo-nodejs-mongo` ကို ထိန်းသိမ်းပြီး၊ လက်ရှိ အင်ဖရာစတပ်ချာသည် Cosmos DB ကို NoSQL အတွက် အသုံးပြုထားသည်၊ ထို့ကြောင့် ဒေတာဘေ့စ် API ကို နာမည်မှ ခန့်မှန်းခြင်းမပြုမီ ဒေါင်းလုဒ်လုပ်ထားသော README နှင့် `infra/` ကို စစ်ဆေးပါ။

> ၂၀၁၆ ခုနှစ် နိုဝင်ဘာ တွင် `azd 1.37.2` နှင့် အများပြည်သူ အခြေခံပုံစံနှင့် ပြန်လည်ဆန်းစစ်ထားသည်။ အောက်ပါ နမူနာများသည် Bash ကို အသုံးပြုထားပြီး JSON ထုတ်ယူရန်အတွက် `jq` လိုအပ်ပါသည်။ Azure တပ်ဆင်မှုများသည် အခကြေးငွေ ဖြစ်မြောက်စေနိုင်ပြီး ဒီပုံစံစစ်ဆေးစဉ်တွင် မပြုလုပ်ခဲ့ပါ။

## သင်ယူ ရည်ရွယ်ချက်များ

ဤ သင်ခန်းစာကို ပြီးမြောက်ခဲ့သည်နှင့်အမျှ၊ သင်သည်-
- အခြေခံပုံစံများကို အသုံးပြု၍ azd ပရောဂျက် စတင်ခြင်း လုပ်ငန်းစဉ်ကို ကျွမ်းကျင်စွာ လုပ်ဆောင်နိုင်မည်
- Azure Developer CLI ပရောဂျက် ဖွဲ့စည်းပုံနှင့် သတ်မှတ်ချက်ဖိုင်များကို နားလည်သဘောပေါက်နိုင်မည်
- အင်ဖရာစတပ်ချာဖြင့် အတူတကွ Azure သို့ လျှောက်လွှာ မြောက်မြားစွာ တပ်ဆင်နိုင်မည်
- လျှောက်လွှာ အပ်ဒိတ်များနှင့် ပြန်တပ်ဆင်မှု ရေးနည်းလမ်းများကို အကောင်အထည်ဖော်နိုင်မည်
- ဖွံ့ဖြိုးမှုနှင့် စစ်ဆေးမှုအဆင့်များအတွက် ပတ်ဝန်းကျင် တစ်ခုပိုများ စီမံခန့်ခွဲနိုင်မည်
- အရင်းအမြစ် ရှင်းလင်းခြင်းနှင့် ကုန်ကျစရိတ် စီမံခန့်ခွဲမှုပုံစံများကို အသုံးချနိုင်မည်

## သင်ယူရရှိမည့် အကျိုးအမြတ်များ

ပြီးမြောက်တိုင်း သင်သည်-
- ကိုယ်တိုင် azd ပရောဂျက်များကို အခြေခံပုံစံမှ စတင်ပြီး သတ်မှတ်နိုင်မည်
- azd ပရောဂျက်ဖွဲ့စည်းပုံကို လည်ပတ်သွားပြီး ပြင်ဆင်နိုင်မည်
- စSingle command တစ်ခုဖြင့် Azure သို့ အပြည့်အစုံ လျှောက်လွှာ တပ်ဆင်နိုင်မည်
- အတိအကျ ဖော်ပြချက်များနှင့် အတည်ပြု ခြင်းများဖြင့် တပ်ဆင်မှု ပြဿနာများကို ပြင်ဆင်နိုင်မည်
- Azure ပတ်ဝန်းကျင်များ များစွာနှင့် Deployment အဆင့်အတန်းများကို စီမံနိုင်မည်
- လျှောက်လွှာ အပ်ဒိတ်များအတွက် ဆက်လက် တပ်ဆင်ခြင်းလုပ်ငန်းစဉ်များကို အသုံးပြုနိုင်မည်

## စတင်ခြင်း

### မတင်မီ စစ်ဆေး စာရင်း
- ✅ Azure Developer CLI တပ်ဆင်ပြီး ([Installation Guide](installation.md))
- ✅ AZD အတည်ပြုမှု ပြီးမြောက်ပြီး `azd auth login` ဖြင့်
- ✅ သင့် စနစ်တွင် Git တပ်ဆင်ပြီးဖြစ်သည်
- ✅ Node.js 22 LTS (သို့မဟုတ် ဒေါင်းလုဒ်လုပ်ထားသော အခြေခံပုံစံလိုအပ်ချက်အားသာ version)
- ✅ Visual Studio Code (အကြံပြု)

ဆက်လက်ရွေ့လျားရန်မတိုင်မီ repository root မှ setup validator ကို chạy ပါ:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### သင့် စနစ်ကို စစ်ဆေးပါ
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### ရွေးချယ်ရန် Azure CLI authentication ကို စစ်ဆေးပါ

```bash
az account show
```

### Node.js ဗားရှင်း စစ်ဆေးပါ
```bash
node --version
```

## အဆင့် ၁: အခြေခံပုံစံ ရွေးချယ်ပြီး စတင်ရန်

React ရှေ့ဆုံး အင်တာဖေ့စ်နှင့် Node.js API အတွက် ရေပန်းစားသော todo app အခြေခံပုံစံဖြင့် စတင်ကြပါစို့။

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

### ဘာတွေ ဖြစ်ခဲ့သလဲ?
- သင့် ဒေသတွင်း ဗားရှင်းသို့ တင်သွင်းရန် အခြေခံပုံစံ ကုဒ်ဒေါင်းလုဒ်လုပ်ပြီး
- service များသတ်မှတ်ချက်များပါသော `azure.yaml` ဖိုင်ကို ဖန်တီးခဲ့သည်
- `infra/` ဖိုလ်ဒါတွင် အင်ဖရာစတပ်ချာ ကုဒ်ကို စီစဉ်ထားသည်
- ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု ဖန်တီးထားသည်

## အဆင့် ၂: ပရောဂျက် ဖွဲ့စည်းပုံ ကို လေ့လာကြည့်ပါ

azd မှ ဖန်တီးပေးသည့် အရာများကို ကြည့်မည်။

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

မည်သည့်အရာတွေကို တွေ့မြင်ရမလဲ:
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

### နားလည်ရန် အဓိက ဖိုင်များ

**azure.yaml** - သင့် azd ပရောဂျက်၏ မျက်နှာဖုံး:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - အင်ဖရာစတပ်ချာ သတ်မှတ်ချက်:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## အဆင့် ၃: သင့်ပရောဂျက်ကို စိတ်ကြိုက်ပြုပြင်ခြင်း (ရွေးချယ်စရာ)

တပ်ဆင်မလုပ်မီ ဂျီအိုနီခတ်ပြုလုပ်နိုင်သည်

### ရှေ့ဆုံး အင်တာဖေ့စ် ပြင်ဆင်ရန်
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

ရိုးရှင်းသော ပြောင်းလဲမှုတစ်ခု ပြုလုပ်ပါ:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### ပတ်ဝန်းကျင် ကို ပြင်ဆင်ပါ
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

ဒီ တန်ဖိုး ၂ ခုသည် ဒေသတွင်းသိမ်းဆည်းမှုသာ ပြသနေသည်။ အခြေခံပုံစံသည် `WEBSITE_TITLE` သို့မဟုတ် `API_VERSION` ကို အသုံးမပြုသဖြင့် app တွင် မပြောင်းလဲပါ။ အထက်တွင် ရေးသားထားသော ပြောင်းလဲမှုသည် တိုင်းပြည်သုံးပြီး ပြသမှု နာမည်ကို ပြောင်းလဲထားသည်။

## အဆင့် ၄: Azure သို့ တပ်ဆင်ခြင်း

အခုတော့ စိတ်လှုပ်ရှားဖွယ် ဖြစ်သော အပိုင်း - အားလုံးကို Azure သို့ တပ်ဆင်ပါ!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### တပ်ဆင်မှုအတွင်း ဘာတွေ ဖြစ်နေသလဲ?

လုပ်ငန်းစဉ်သည် အင်ဖရာစတပ်ချာကို ပစ္စည်းတင်ပြီး ကုဒ်များကို စုစည်း/တပ်ဆင်သည်။ အတိအကျ သတ်မှတ်စဉ်လိုက်မှုကို `workflows.up` နှင့် `azure.yaml` မှ ပြင်ဆင်နိုင်သည်။ ဤအခြေခံပုံစံတွင် provision အပြီး deploy ဖြစ်သည်။ တစ်ကြိမ်တည်း universal phase order ကို အသုံးမပြုပါနှင့်။

### မျှော်မှန်းရသော အထွက်
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## အဆင့် ၅: သင့် အပ်ပလီကေးရှင်းကို စမ်းသပ်ကြည့်ပါ

### သင့် အပ်ပလီကေးရှင်းရောက်ရှိရန်
တပ်ဆင်မှု အထွက်တွင် ပေးထားသော URL ကို နှိပ်ပါ၊ ဒါမှမဟုတ် အချိန်မရွေး ရယူပါ:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Todo app ကို စမ်းသပ်ရန်
1. **todo အရာတစ်ခု ထည့်ပါ** - "Add Todo" ကိုနှိပ်ပြီး တာဝန်ရေးပါ
2. **ပြီးဆုံးသည်ဟု စာရင်းပြုလုပ်ပါ** - ပြီးဆုံးထားသော ပစ္စည်းများကို မှတ်တမ်းတင်ပါ
3. **ပစ္စည်းဖျက်ခြင်း** - မလိုအပ်တော့သော todo များကို ဖျက်ပစ်ပါ

### သင့် အပ်ပလီကေးရှင်းကို မော်နီတာလုပ်ပါ
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ သင့် တပ်ဆင်မှုကို အတည်ပြုပါ

ဆက်လက်ရွေ့လျားမည့်အတွက် ဒီလျှောက်လမ်းလေးကို ပြီးမှသေချာစစ်ဆေးပါ - "deploy အောင်မြင်" ဆိုတာ "app ကောင်းတယ်" မဟုတ်ပါ။

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

**တပ်ဆင်မှု အတည်ပြုချက်များမှာ-**
- ✅ `azd show` သည် ရောက်ရှိနိုင်သော endpoint URL ကို ပြပါသည်
- ✅ URL ကို သင့် ဘရောက်ဇာတွင် အမှားမရှိ ဖွင့်နိုင်ပါသည်
- ✅ ကိုးကားချက်များ လုပ်ဆောင်နိုင်ပါသည် (todo ထည့်/ပြီးဆုံး/ဖျက်)
- ✅ `azd monitor --logs` သည် မမျှော်လင့်ထားသော အမှား မရှိဘဲ အသုံးပြုမှု တောင်းဆိုမှုများကို ပြပါသည်

မည်သည့် စစ်ဆေးချက်မဆို မအောင်မြင်ပါက [အခန်း ၇: ပြဿနာဖြေရှင်းခြင်း](../chapter-07-troubleshooting/README.md) သို့ ရွေ့ပါ။

## အဆင့် ၆: ပြောင်းလဲမှု ပြုလုပ်ပြီး ပြန်တပ်ဆင်ပါ

ပြောင်းလဲမှုတစ်ခု ပြုလုပ်ပြီး သင်၏အပ်ဒိတ် လွယ်ကူမှုကို ကြည့်ပါ။

### API ကို ပြင်ဆင်ရန်
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

စိတ်ကြိုက် ပြန်ကြားချက် header တစ်ခု ထည့်ပါ:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ကုဒ်ပြောင်းလဲမှုသာ တပ်ဆင်ပါ
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## အဆင့် ၇: ပတ်ဝန်းကျင် များစွာ စီမံခန့်ခွဲပါ

ထုတ်လုပ်မတိုင်မီပြောင်းလဲမှုများ စမ်းသပ်ရန် staging ပတ်ဝန်းကျင်တစ်ခု ဖန်တီးပါ:

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

### ပတ်ဝန်းကျင်များ နှိုင်းယှဉ်ခြင်း
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## အဆင့် ၈: အရင်းအမြစ်များ ကို ရှင်းလင်းပါ

စမ်းသပ်မှုများ ပြီးစီးသည့်အခါ၊ ဆက်တိုက် အခကြေးငွေ လျော့ချရန် ရှင်းလင်းပါ:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## ရိုးရာ App နှင့် AI ပေါင်းစပ် App: Workflow တူညီသည်

သင်သည် ရိုးရာ ဝက်ဘ် အက်ပ်ကိုတပ်ဆင်ခဲ့သည်။ ဒါပေမယ့် AI ပေါင်းစပ် app တစ်ခု - ဥပမာ Microsoft Foundry Models မှ အားပေးသော စကားပြော အက်ပ်တစ်ခု တပ်ဆင်ချင်ရင်ရော?

သတင်းကောင်းကတော့: **workflow တူညီပါတယ်။**

| အဆင့် | ရိုးရာ Todo App | AI စကားပြော App |
|------|-----------------|-------------|
| စတင်ခြင်း (သန့်ရှင်းသော ဖိုလ်ဒါ) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| အတည်ပြုခြင်း | `azd auth login` | `azd auth login` |
| တပ်ဆင်ခြင်း | `azd up` | `azd up` |
| မော်နီတာခြင်း | `azd monitor` | `azd monitor` |
| ရှင်းလင်းခြင်း | `azd down --force --purge` | `azd down --force --purge` |

ထုတ်လုပ်မှုပုံစံ တူတူ ဖြစ်သော်လည်း ရှေ့တန်းလိုအပ်ချက်များကွာခြားသည်။ AI အခြေခံပုံစံတွင် မော်ဒယ်ခွင့်ပြုချက်၊ ဒေသဆိုင်ရာ ကွိုတာ၊ ဒေတာ ထည့်သွင်းခြင်းနှင့် အသိပညာ ထပ်မံ လိုအပ်တတ်သည်။ တပ်ဆင်ရန်မတိုင်မီ README ကို ဖတ်ရှုပါ; `azd up` သည် လိုအပ်သည့် ခွင့်ပြုချက်များ သို့မဟုတ် ကွိုတာပေးမည် မဟုတ်ပါ။

azd ၏ အထူအနက်အချက်မှာ: **workflow တစ်ခု၊ မည်သည့် အလုပ်ခွင်မဆို။** သင် သင်ယူခဲ့သော ကျွမ်းကျင်မှုများ- စတင်ခြင်း၊ တပ်ဆင်ခြင်း၊ မော်နီတာခြင်း၊ ပြန်တပ်ဆင်ခြင်းနှင့် ရှင်းလင်းခြင်းတို့သည် AI app နှင့် အေးဂျင့်များတွင်လည်း အလားတူ အသုံးပြုနိုင်သည်။

---

## သင် သင်ယူရရှိခဲ့သည့် အရာများ

ဂုဏ်ပြုပါတယ်! သင် အောက်ပါအရာများကို အောင်မြင်စွာလုပ်ဆောင်နိုင်ပြီ -
- ✅ အခြေခံပုံစံမှ azd project တစ်ခု စတင်နိုင်ရန်
- ✅ ပရောဂျက်ဖွဲ့စည်းပုံနှင့် အဓိက ဖိုင်များ ကို လေ့လာရှုဖြစ်
- ✅ Azure သို့ full-stack app တစ်ခု တပ်ဆင်နိုင်
- ✅ ကုဒ်ပြောင်းလဲမှု ပြုလုပ်ပြီး ပြန်တပ်ဆင်နိုင်
- ✅ ပတ်ဝန်းကျင် များစွာ စီမံနိုင်
- ✅ အရင်းအမြစ်များ ရှင်းလင်းနိုင်

## 🎯 ကျွမ်းကျင်မှု အတည်ပြု လေ့ကျင့်ခန်းများ

### လေ့ကျင့်ခန်း ၁: အခြား Template တစ်ခု တပ်ဆင်ခြင်း (၁၅ မိနစ်)
**ရည်မှန်းချက်**: azd init နှင့် deployment လုပ်ငန်းစဉ် ကျွမ်းကျင်မှု ဆန်းစစ်ပြသရန်

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

**အောင်မြင်မှု မီတာများ:**
- [ ] အပ်လီကေးရှင်းသည် အမှား မပါဘဲ တပ်ဆင်နိုင်သည်
- [ ] application URL ကို browser တွင် ဝင်ရောက်ကြည့်ရှုနိုင်သည်
- [ ] application လုပ်ဆောင်ချက်များ မှန်ကန်စွာ လုပ်ဆောင်သည် (todo များ ထည့်/ဖယ်)
- [ ] resource အားလုံးကို အောင်မြင်စွာ ရှင်းလင်းနိုင်သည်

### လေ့ကျင့်ခန်း ၂: စိတ်ကြိုက် အပြင်အဆင် ပြုလုပ်ခြင်း (၂၀ မိနစ်)
**ရည်မှန်းချက်**: ဒေသတွင်း ပတ်ဝန်းကျင် တန်ဖိုးပုံသဏ္ဍာန်ကို runtime configuration မဟုတ်ဘဲ လေ့ကျင့်ရန်

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

**အောင်မြင်မှု မီတာများ:**
- [ ] စိတ်ကြိုက် ပတ်ဝန်းကျင် တစ်ခု ဖန်တီးနိုင်သည်
- [ ] ပတ်ဝန်းကျင် များ အပြောင်းအလဲ ဂရုစိုက်နိုင်ပြီး ထုတ်ယူနိုင်သည်
- [ ] `azd env get-value APP_TITLE` မှ `My Custom Todo App` ကို ပြသည်
- [ ] ၎င်းတန်ဖိုးများသည် ကုဒ်/အင်ဖရာစတပ်ချာ အသုံးမပြုသည့် အခါ stock app ကို မပြောင်းလဲစေသည့် အကြောင်း ရှင်းပြနိုင်သည်

### လေ့ကျင့်ခန်း ၃: Multi-Environment Workflow (၂၅ မိနစ်)
**ရည်မှန်းချက်**: ပတ်ဝန်းကျင် စီမံခန့်ခွဲခြင်းနှင့် တပ်ဆင်မှု မဟာဗျူဟာ ကျွမ်းကျင်စွာ လုပ်ဆောင်ရန်

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

**အောင်မြင်မှု မီတာများ:**
- [ ] ပတ်ဝန်းကျင် နှစ်ခုကို ကွဲပြားသော အပြင်အဆင်ဖြင့် ဖန်တီးနိုင်သည်
- [ ] နှစ်ခုလုံးကို အောင်မြင်စွာ တပ်ဆင်နိုင်သည်
- [ ] `azd env select` ဖြင့် ပတ်ဝန်းကျင်များကို ပြောင်းပြန်နိုင်သည်
- [ ] ပတ်ဝန်းကျင် တန်ဖိုးများသည် မတူကွဲပြားသည်
- [ ] နှစ်ခုလုံးကို အောင်မြင်စွာ ရှင်းလင်းနိုင်သည်

## 📊 သင့် တိုးတက်မှု

**ကုန်ချိန်**: ~၆၀-၉၀ မိနစ်  
**ရရှိထားသော ကျွမ်းကျင်မှုများ**:
- ✅ အခြေခံပုံစံမှ project စတင်ခြင်း
- ✅ Azure resource provisioning
- ✅ application တပ်ဆင်မှု လုပ်ငန်းစဉ်များ
- ✅ ပတ်ဝန်းကျင် စီမံခန့်ခွဲမှု
- ✅ သတ်မှတ်ချက် စီမံခန့်ခွဲမှု
- ✅ အရင်းအမြစ် ရှင်းလင်းခြင်းနှင့် ကုန်ကျစရိတ် စီမံခန့်ခွဲမှု

**နောက်ထပ် အဆင့်**: သင်သည် [Configuration Guide](../chapter-03-configuration/configuration.md) သို့ ရောက်ရှိပြီး တိုးတက်သော သတ်မှတ်ချက် စနစ်များကို လေ့လာနိုင်ပြီ!

## ရိုးရာ ဖြစ်တတ်သော ပြဿနာများ ဖြေရှင်းနည်း

### authentication အမှားများ
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### တပ်ဆင်မှု မအောင်မြင်ခြင်းများ
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### အရင်းအမြစ် အမည် တိုက်တွေ့မှုများ
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### ပေါ့(Port)/ကွန်ယက် ပြဿနာများ
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## နောက်တချိန် အဆင့်များ

ပထမဆုံး project ပြီးသွားပြီဆိုသောကြောင့်၊ အောက်ပါ တိုးတက်သော ခေါင်းစဉ်များကို လေ့လာပါ:

### ၁။ အင်ဖရာစတပ်ချာ ကို စိတ်ကြိုက် ပြုပြင်ရန်
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add database infrastructure](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### ၂။ CI/CD ပတ်သတ်ချက် တပ်ဆင်ရန်
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - CI/CD workflow များ ပြီးမြောက်စွာ ဆောက်လုပ်ခြင်း
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - pipeline သတ်မှတ်ချက်များ

### ၃။ ထုတ်လုပ်မှု အကောင်းဆုံး လုပ်နည်းများ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - လုံခြုံရေး၊ မှန်ကန်မှုနှင့် မော်နီတာလုပ်ငန်းစဉ်များ

### ၄။ အခြေခံပုံစံများ ပိုမို လေ့လာရန်
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

## အပို ဆက်စပ် အရင်းအမြစ်များ

### သင်ယူရေး အကြောင်းအရာများ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### လူမှုအသိုင်းအဝိုင်း နှင့် ကူညီမှုများ
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### အခြေခံပုံစံများ နှင့် နမူနာများ
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Template Contributions](https://github.com/Azure/awesome-azd)
- [Todo Template Source](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**သင်၏ ပထမဆုံး azd project ပြီးမြောက်ခြင်းအတွက် ချီးမွမ်းပါတယ်!** သင်သည် ယခုကနေ အားရစွာ Azure ပေါ်တွင် အံ့မခန်းသော လျှောက်လွှာများကို ဆောက်လုပ်ပြီး တပ်ဆင်နိုင်ပြီ ဖြစ်သည်။

---

**အခန်း လမ်းညွှန်:**
- **📚 သင်တန်း မူလ**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိ အခန်း**: အခန်း 1 - အခြေခံနှင့် အမြန် စတင်ခြင်း
- **⬅️ ယခင်**: [Installation & Setup](installation.md)
- **➡️ နောက်တစ်ခု**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 နောက် အခန်း**: [အခန်း 2: AI-ပထမ ထုတ်လုပ်မှု](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->