# မိမိကိုယ်ပိုင် azd တမ်းပလိတ်ရေးသားခြင်း

**အခန်းလမ်းညွှန်:**
- **📚 မူလ သင်တန်း**: [AZD အခြေစိုက်လမ်းညွှန်](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၄ - Infrastructure as Code နှင့် တင်သွင်းခြင်း
- **⬅️ ယခင်အခန်း**: [Deployment Guide](deployment-guide.md)
- **🚀 နောက်တစ်ခန်း**: [အခန်း ၅: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> `azd 1.27.1` ဖြင့် ၂၀၂၆ ခုနှစ် ဇူလိုင်လ တွင် အတည်ပြုထားသည်။

## နိဒါန်း

ယခုထိ သင်သည် `azd init --template <name>` ဖြင့် တမ်းပလိတ်များကို *သုံးစွဲ* လုပ်ခဲ့ပါသည်။ သို့သော် သင်၏အသင်းအဖွဲ့မှ ကြိုက်နှစ်သက်သော project အတွင်း အစီအစဉ်ရှိလာပါက—ဥပမာ Container App နှင့် Cosmos DB တစ်ခု၊ ပြီးတော့ မှန်ကန်သောစောင့်ကြည့်မှုပါရှိထာကာ—တမ်းပလိတ်ကို ကိုယ်ပိုင် reusable တူပြုလုပ်လိုပါလိမ့်မည်။ တမ်းပလိတ်ဆိုသည်မှာ Git ဖိုင်သိုလှောင်ရာ repository ဖြစ်ပြီး azd သည် ဖတ်ရှုနိုင်ပုံစံရှိခြင်း ဖြစ်သည်။ ဒီသင်ခန်းစာတွင် မူလကနေ တည်ဆောက်နည်း၊ စမ်းသပ်နည်း နှင့် (လိုအပ်လျှင်) အသိုင်းအဝိုင်းဂရယ်လ်ရီသို့ ထုတ်ဝေခြင်းနည်းကို ပြသပါသည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဒီသင်ခန်းစာပြီးဆုံးသည့်အခါ၊ သင်သည်:
- folder တစ်ခုကို "azd template" ဖြစ်စေသောအချက်ကို နားလည်ပါမည်
- လိုအပ်သောဖိုင်များနှင့် folder အစီအစဉ်ကို သိရှိပါမည်
- အခြားလူများ သုံးနိုင်သော `azure.yaml` နှင့် `infra/` ထည့်ပါမည်
- မျှဝေရမီ ကိုယ်ပိုင် template ကို ကြိုတင် စမ်းသပ်ပါမည်
- ထုတ်ဝေခြင်းနှင့် (လိုအပ်လျှင်) Awesome AZD သို့ တင်သွင်းရမည်

## သင်ခန်းစာပြီးဆုံးသည့် အကျိုးရလဒ်များ

ဒီသင်ခန်းစာပြီးဆုံးပြီးနောက် သင့်မှာ:
- template repository အသစ်တည်ဆောက်နိုင်မည်
- parameterize လုပ်နိုင်ပြီး subscription မည်သည့်အမျိုးမျိုးတွင်မဆိုအသုံးပြုနိုင်မည်
- `azd init` နှင့် `azd up` ဖြင့် template ကို စစ်ဆေးနိုင်မည်
- community gallery ကြီးစွာလိုအပ်သော metadata ထည့်နိုင်မည်

---

## တမ်းပလိတ်ဆိုတာ ဘာလဲ?

azd တမ်းပလိတ်ဆိုသည်မှာ **အနည်းဆုံးပါဝင်သင့်သော Git repository** ဖြစ်ပြီး၊

| ဖိုင် / folder | ရည်ရွယ်ချက် | လိုအပ်ပါသလား? |
|---------------|---------|-----------|
| `azure.yaml` | ဆာဗာ၊ ဟောင့်စနစ်နှင့် infrastructure ပေးသူ ဖော်ပြချက် | ✅ လိုအပ်သည် |
| `infra/` | Bicep, Terraform, သို့မဟုတ် Pulumi ဖြင့် အရင်းအနှီးအရင်းအမြစ်များ တည်ဆောက်ခြင်း | ✅ လိုအပ်သည် |
| `src/` (သို့မဟုတ် သင်၏ကုဒ်) | azd ဖြင့် တင်သွင်းသည့် application ကုဒ် | ✅ လိုအပ်သည် |
| `README.md` | template အသုံးပြုပုံ | ✅ အားကောင်းစွာ အကြံပြုသည် |
| `.azdo/` သို့မဟုတ် `.github/` | CI/CD pipeline ဖော်ပြချက်များ | ရွေးချယ်စရာ |
| `.devcontainer/` | ပြန်လည်ထုတ်လုပ်နိုင်သော developer ပတ်ဝန်းကျင် | ရွေးချယ်စရာ |
| `azure.yaml` `metadata` | Gallery + telemetry သတင်းအချက်အလက် | ရွေးချယ်စရာ (ထုတ်ဝေရန် လိုအပ်သည်) |

ဘာမှ မဟုတ်ပါ—`azd init --template you/your-repo` ဖြင့် ပြေးခွင့်ပြုသည်မှာ azd သည် repo ကို clone ပြီး `azure.yaml` ဖတ်သည်။

---

## အဆင့် ၁: Repository ကို Scaffold လုပ်ပါ

ကိုယ်တိုင် ဖိုင်ဖွဲ့စည်းတည်ဆောက်နိုင်သည်၊ သို့မဟုတ် အနည်းဆုံး template တစ်ခု မှ စတင်ပြီး တည်းဖြတ်နိုင်သည်။

```bash
mkdir my-azd-template && cd my-azd-template
git init

# စံနမူနာ အစီအစဉ်ကို ဖန်တီးပါ
mkdir -p src infra
```

ပုံမှန်ပြီးပြည့်စုံသော layout သည် ဒီလိုမျိုး ဖြစ်သည်။

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## အဆင့် ၂: `azure.yaml` ကိုရေးပါ

ဒါက တမ်းပလိတ်ရဲ့ နှလုံးသားပါ။ azd ကို ဘယ်လို deploy လုပ်မလဲ ပြောပြပါတယ်။

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> `metadata.template` က gallery telemetry သုံးပြီး အသုံးပြုမှုကို မှတ်ယူတဲ့ field ပါ။ `name@version` စံနှုန်းကို သုံးပါ။

---

## အဆင့် ၃: Infrastructure ကို Parameterize လုပ်ပါ

*Re-usable* တမ်းပလိတ်အတွက် အရေးကြီးဆုံး စည်းကမ်းတစ်ခုမှာ: **အမည်များ၊ ဒေသများ၊ subscription ပေါ်မူတည်သောတန်ဖိုးများကို တည်မှတ်ထား၍ မဟုတ်သင့်ပါ။** parameter များကို သုံးပြီး resource token ပုံစံကို အသုံးပြုပါ၊ ထို့ဖြင့် တမ်းပလိတ်ကို subscription မည်သူ့တွင်မဆို အသုံးချနိုင်ပါသည်။

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

ဒီ template-friendly ဖြစ်စေသော အချက် ၂ ခုရှိသည်။

1. **`azd-env-name` tag** — azd သည် environment အလိုက် resource များကို စောင့်ကြည့်ပြီး ရှင်းလင်းပေးရန် သုံးသည်။
2. **`uniqueString(...)` resource token** — stable ဖြစ်၍ ကမ္ဘာလုံးဆိုင်ရာ တူညီမှုမရှိသော suffix ထုတ်ပေးလိုက်သည်၊ အမည်များ မတူညီစေရန်။

azd မှ environment မှ inject ထားသောတန်ဖိုးများကို ဖတ်ရန် ဖော်ပြသည့် parameter ဖိုင်ကို ပေးပါ။

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd သည် လက်ရှိ environment မှ `${AZURE_ENV_NAME}` နှင့် `${AZURE_LOCATION}` ကို အလိုအလျောက် အစားထိုးပေးသည်။

---

## အဆင့် ၄: ကိုယ်ပိုင် template ကို ဒေသတွင်း စမ်းသပ်ပါ

မျှဝေခြင်းမပြုမီ၊ template သည် သန့်ရှင်းသော နေရာမှ မှန်ကန်စွာ အလုပ်လုပ်သည်ကို အတည်ပြုပါ။

**ဒေသတွင်း folder မှ စမ်းသပ်ပါ** (Git push မလိုအပ်ပါ):

```bash
# အလွတ် ဖိုင်ဧရိယာမှ စတင်၍ သင့်ဒေသခံနမူနာလမ်းကြောင်းကို အသုံးပြု၍ စတင်ပါ
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provision + deploy အဆုံးသတ်အထိ
azd auth login
azd up
```

**ထို့နောက် teardown ကို စမ်းသပ်ပါ**—ကောင်းမွန်သော template က ပြီးပြည့်စုံစွာ ရှင်းလင်းပေးပါသည်။

```bash
azd down --force --purge
```

`azd down` မှ resource များ ကျန်ရှိထားပါက resource တစ်ခုတစ်ခု၌ `azd-env-name` tag ဖြတ်ခွဲမထားဖြစ်နိုင်ပါသည်။

> **အကြံပြုချက်:** ပထမဦးဆုံး `azd provision --preview` ကို ပြေးပါ။ ၎င်းသည် what-if လုပ်ပြီး resource မတည်ဆောက်မီ တမ်းပလိတ်မှားချက်များကို ဖော်ပြပါသည်။

---

## အဆင့် ၅: တမ်းပလိတ်ကို ထုတ်ဝေပါ

GitHub သို့ repository ကို ရိုက်ထုတ်ပြီး (အခြားလူများသုံးစေလိုပါက public ဖြစ်စေပါ):

```bash
gh repo create my-azd-template --public --source=. --push
```

ယခုသူမဆို အသုံးပြုနိုင်ပါပြီ။

```bash
azd init --template your-github-username/my-azd-template
```

---

## အဆင့် ၆ (ရွေးချယ်စရာ): Awesome AZD သို့ တင်သွင်းပါ

[Awesome AZD gallery](https://azure.github.io/awesome-azd/) တွင် အသိုင်းအဝိုင်း template များပါရှိသည်။ စာရင်းဝင်ရန် သင့် repo တွင်ရှိသင့်သည်မှာ:

- ✅ prerequisites များ၊ ပန်းချီဆွဲထားသောအဆောက်အအုံဇယားနှင့် ကုန်ကျစရိတ်မှတ်စုများ ပါရှိသော သေချာသော `README.md`
- ✅ `metadata.template` ပါရှိသော လည်ပတ်နေသော `azure.yaml`
- ✅ subscription အသစ်တင်၍ ရှင်းလင်းခွင့် ရှိသော infrastructure
- ✅ `LICENSE` ဖိုင်
- ✅ (ပံ့ပိုးအကြံပြု) Codespaces တစ်ချက်နှိပ်လဲ ဖွင့်နိုင်သော `.devcontainer/`

[Awesome AZD repository](https://github.com/Azure/awesome-azd) တွင် ပါဝင်သည့် လမ်းညွှန်အတိုင်း၊ gallery ၏ data ဖိုင်သို့ သင့် template ထည့်သွင်းသော pull request တစ်ခု ဖွင့်၍ တင်သွင်းပါ။

---

## ပုံမှန် အမှားများ

| အမှား | ဖြေရှင်းနည်း |
|---------|-----|
| အမည်များကို တည်မှတ်ထားခြင်း | `uniqueString()` resource token ကိုသုံးပါ |
| `azd down` ရော၊ resource များ ကျန်သည် | resource တစ်ခုချင်းစီ (သို့) resource group တွင် `azd-env-name` tag ထည့်ပါ |
| သင်၏ template အလုပ်လုပ်၊ အခြားသူများ သုံးမရ | subscription ID များ၊ tenant ID များ နှင့် ဒေသထင်မှတ်ချက်များ ဖယ်ရှားပါ |
| output များ app တွင် မချိတ်ဆက်ထားခြင်း | `SERVICE_<NAME>_ENDPOINT_URL` နှင့် အခြား `AZURE_*` output များ ထုတ်ပေးပါ |
| gallery မှ မလက်ခံခြင်း | `README.md`, `LICENSE`, နှင့် `metadata.template` ထည့်ပါ |

---

## အနှစ်ချုပ်

- template ဆိုသည်မှာ `azure.yaml`, `infra/` နှင့် သင်၏ ကုဒ်ပါဝင်သည့် Git repo ဖြစ်သည်။
- အားလုံးကို parameterize လုပ်ပါ—အမည်များ၊ ဒေသများ၊ နှင့် ID များ—ထို့ကြောင့် ဘယ်နေရာမှာမဆို ပြေးနိုင်သည်။
- resource များကို `azd-env-name` ဖြင့် အမြဲ tag ပြုလုပ်ပါ၊ ထို့ကြောင့် `azd down` လုပ်ရင် အလုပ်လုပ်မည်။
- ထုတ်ဝေရင်းမတိုင်မီ `azd init --template <local-path>` ဖြင့် ဒေသတွင်း စမ်းသပ်ပါ။
- metadata နှင့် README ထည့်၍ Awesome AZD သို့ တင်သွင်းပါ။

---

## 🔗 လမ်းညွှန်မှု

| ဦးတည်ရာ | ရင်းမြစ် |
|-----------|----------|
| **ယခင်** | [Deployment Guide](deployment-guide.md) |
| **အခန်းမူလ** | [Chapter 4: Infrastructure as Code](README.md) |
| **နောက်တစ်ခန်း** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 ဆက်စပ်ရင်းမြစ်များ

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Official azd template documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->