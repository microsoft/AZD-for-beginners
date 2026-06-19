# သင်၏ကိုယ်ပိုင် azd နမူနာ (template) ရေးဆွဲခြင်း

**Chapter Navigation:**
- **📚 Course Home**: [AZD အခြေခံများ](../../README.md)
- **📖 Current Chapter**: အခန်း ၄ - Infrastructure as Code နှင့် ဖြန့်ချိခြင်း
- **⬅️ Previous**: [Deployment Guide](deployment-guide.md)
- **🚀 Next Chapter**: [အခန်း ၅: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> Validated against `azd 1.25.6` in June 2026.

## နိဒါန်း

အခုထိ သင်သည် `azd init --template <name>` ဖြင့် နမူနာများကို စိတ်တိုင်းမကျ သုံးခဲ့ပါပြီ။ သို့သော် သင်၏အဖွဲ့နှစ်သက်သော project အတိုက်အခိုက် — ဥပမာ Container App တစ်ခုပေါ်တွင် Cosmos DB နှင့် မှန်ကန်သည့် monitoring ပါဝင်သော layout — ရှိလာသည့်အခါ၊ ၎င်းကို ကိုယ်ပိုင်အသုံးပြုနိုင်သော နမူနာတစ်ခုအဖြစ် ပြောင်းလိုမည်ဖြစ်သည်။ template အချို့က azd အကြောင်းဖတ်နိုင်တဲ့ ခန့်မှန်းနိုင်သော ဖွဲ့စည်းပုံရှိသည့် Git repository တစ်ခုသာဖြစ်သည်။ ဒီသင်ခန်းစာက သင့်ကို စတင်ဖန်တီးနည်း၊ စမ်းသပ်နည်း နှင့် (လိုလျှင်) community gallery သို့ တင်သွင်းနည်းကို ပြသပါလိမ့်မယ်။

## သင်ယူရန် ရည်ရွယ်ချက်များ

ဒီသင်ခန်းစာကို အပြီးသတ်သောအခါ သင်သည်:
- ဖိုလ်ဒါတစ်ခုကို "azd template" လို့ တွေးနိုင်စေရန် မိမိသဘောပေါက်အောင် နားလည်နိုင်မည်
- လိုအပ်သော ဖိုင်များနှင့် ဖိုလ်ဒါ ဖွဲ့စည်းပုံကို သိရှိထားမည်
- အခြားသူတွေ ပြန်အသုံးပြုနိုင်စေရန် `azure.yaml` နှင့် `infra/` ထည့်သွင်းနိုင်မည်
- မျှဝေရန်မတိုင်ခင် သင့် template ကို လိုကယ်တွင် စမ်းသပ်နိုင်မည်
- ထုတ်ဝေပို့၍ (လိုလျှင်) Awesome AZD ရဲ့ gallery သို့ တင်နိုင်မည်

## သင်ယူပြီးရလဒ်များ

ဒီသင်ခန်းစာပြီးဆုံးပါက သင်သည် အောက်ပါများကို ပြုလုပ်နိုင်ပါမည် -
- template repository အသစ် scaffold လုပ်နိုင်မည်
- မည်သည့် subscription မှာမဆို အလုပ်လုပ်နိုင်ရန် infra ကို parameterize ပြုလုပ်နိုင်မည်
- `azd init` နှင့် `azd up` ဖြင့် template ကို စစ်ဆေးတတ်မည်
- community gallery တင်ရန် လိုအပ်သော metadata ကို ထည့်သွင်းတတ်မည်

---

## Template ဆိုတာ အမှန်တကယ် ဘာလဲ?

azd template ဆိုတာက အနည်းဆုံးအနေဖြင့် **Git repository တစ်ခု** ဖြစ်ပြီး အောက်ပါ အရာများပါဝင်ရသည် -

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | ဝန်ဆောင်မှုများ၊ ဟိုစ့်များနှင့် အင်ဖရာ ပံ့ပိုးသူကို ဖော်ပြသည် | ✅ လိုအပ်သည် |
| `infra/` | အရင်းအမြစ်များကို provision ပြုလုပ်သော Bicep, Terraform, သို့မဟုတ် Pulumi | ✅ လိုအပ်သည် |
| `src/` (or your code) | azd က deploy လုပ်မည့် application ကုဒ် | ✅ လိုအပ်သည် |
| `README.md` | template ကို မည်ကဲ့သို့ အသုံးပြုရမည်ကို ရေးသားထားသည် | ✅ အလွန် အကြံပြုသည် |
| `.azdo/` or `.github/` | CI/CD pipeline ကိန်းကျသတ်မှတ်ချက်များ | ရွေးချယ်နိုင်သည် |
| `.devcontainer/` | ထပ်တူထပ်မျှ ဖော်ပြနိုင်သော ဖွံ့ဖြိုးရေးပတ်ဝန်းကျင် | ရွေးချယ်နိုင်သည် |
| `azure.yaml` `metadata` | Gallery နှင့် telemetry အချက်အလက် | ရွေးချယ်နိုင်သည် (ထုတ်ဝေရန်လိုအပ်သည်) |

အံ့သရာမရှိပါဘူး — `azd init --template you/your-repo` လိုင်းကို အလုပ်လုပ်စေချင်ရင် azd က repo ကို clone လုပ်ပြီး `azure.yaml` ကို ဖတ်ရှုမှာပဲ ဖြစ်ပါတယ်။

---

## အဆင့် ၁: Repository ကို ဖွဲ့စည်းခြင်း

ဖိုလ်ဒါ ဖွဲ့စည်းပုံကို လက်ဖြင့် ဖန်တီးပါ၊ သို့မဟုတ် အနည်းဆုံး template တစ်ခုကနေ စတင်ပြီး ပြင်ဆင်ပါ။

```bash
mkdir my-azd-template && cd my-azd-template
git init

# စံကျသည့် ဖွဲ့စည်းပုံကို ဖန်တီးပါ
mkdir -p src infra
```

ပုံမှန် အပြီးသတ် ဖောင်အပြင်အဆင်သည် ဒီလိုပုံစံမျိုး ဖြစ်သည် -

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

## အဆင့် ၂: `azure.yaml` ရေးသားခြင်း

ဒါက template ၏ နောက်ခံနှလုံးသားပါ။ azd ကို ဘာတွေ deploy စေမလဲ၊ ဘယ်လို deploy လုပ်မလဲ ဆိုတာကို ပြောပြပါတယ်။

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

> `metadata.template` field က gallery telemetry က အသုံးပြုမှုကို ဂဏန်းတွက်ရန် အသုံးပြုပါတယ်။ `name@version` စံနမူနာကို အသုံးပြုပါ။

---

## အဆင့် ၃: အင်ဖရာကို ပါရာမီတာပြုလုပ်ခြင်း

*ပြန်အသုံးပြုနိုင်သော* template အတွက် အရေးကြီးဆုံး စည်းကမ်းတစ်ခုကတော့ - **နာမည်များ၊ တိုင်းဒေသများ သို့မဟုတ် subscription-အထူးတန်ဖိုးများကို အဆက်မပြတ် hardcode မလုပ်ရန် ဖြစ်သည်။** parameter များနှင့် resource token ပုံစံကို အသုံးပြု၍ တစ်ခုတည်းသော template ကို မည်သူ့ subscription တစ်ခုမှာမဆို အလုပ်လုပ်စေပါ။

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

ဒီ template ကို template-friendly ဖြစ်စေတဲ့ အချက်နှစ်ချက် -

1. **`azd-env-name` tag** — azd က environment အလိုက် resource များကို သတိထားကာ သန့်ရှင်းရေးလုပ်ရန် အသုံးပြုသည်။
2. **`uniqueString(...)` resource token** — နာမည်တွေ တက်ဘက်ထွက်မထပ်ဆစ်စေဖို့ ပြည်လောကအဆင့် တည်ငြိမ်သော suffix တစ်ခု ထုတ်ပေးသည်။

azd က environment ထဲက inject ပြုလုပ်လိုက်သော တန်ဖိုးများကို ဖတ်ယူမည့် parameters ဖိုင်ကိုလည်း ပံ့ပိုးပေးပါ။

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

azd သည် လတ်တလော environment ထဲမှ `${AZURE_ENV_NAME}` နှင့် `${AZURE_LOCATION}` ကို အလိုအလျောက် အစားထိုးပေးပါသည်။

---

## အဆင့် ၄: သင့် template ကို ဒေသတွင်းစမ်းသပ်ပါ

မျှဝေချပို့မီ အရင်မှာ template သည် သန့်ရှင်းသော အခြေအနေမှစ၍ အလုပ်လုပ်တတ်ကြောင်း သက်သေပြပါ။

**Test from the local folder** (Git push မလိုအပ်ပါ။):

```bash
# ဗလာ ဖိုလ်ဒါမှ သင့်ဒေသခံ template လမ်းကြောင်းကို အသုံးပြုပြီး စတင်လုပ်ဆောင်ပါ
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# အစမှ အဆုံးထိ ဝန်ဆောင်မှုများကို ပြင်ဆင်ပေးပြီး တပ်ဆင်ပါ
azd auth login
azd up
```

**ပြီးနောက် teardown ကို လည်း စမ်းသပ်ပါ** — ကောင်းမွန်သော template တစ်ခုသည် အကုန်လုံးကို သန့်ရှင်းစွာ ဖျက်ပစ်နိုင်ရမည်။

```bash
azd down --force --purge
```

`azd down` က အရင်းအမြစ်များကို မကျန်စေဘဲ ထုတ်ပစ်နိုင်မှုမရပါက၊သင် resource တစ်ခုအပေါ် `azd-env-name` tag ကို မတွေ့ရှိထားခဲ့ဖြစ်နိုင်သည်။

> **Tip:** ပထမဦးဆုံး `azd provision --preview` ကို chạy လိုက်ပါ။ ၎င်းက what-if ကို ပြုလုပ်ပြီး resource တည်ဆောက်မီ template အမှားများကို ဖော်ထုတ်ပြပါလိမ့်မယ်။

---

## အဆင့် ၅: Template ကို ထုတ်ဝေပါ

repo ကို GitHub သို့ push လုပ်ပါ (အများပြည်သူအသုံးအတွက် public ဖြစ်စေလိုပါက public လုပ်ပါ)။

```bash
gh repo create my-azd-template --public --source=. --push
```

ယခုမည်သူမဆို ၎င်းကို အသုံးပြုနိုင်ပါပြီ။

```bash
azd init --template your-github-username/my-azd-template
```

---

## အဆင့် ၆ (ရွေးချယ်စရာ): Awesome AZD သို့ တင်သွင်းခြင်း

[Awesome AZD gallery](https://azure.github.io/awesome-azd/) သည် community templates များကို စုစည်းထားသည်။ သင့် repo သည် စာရင်းဝင်ရန် အောက်ပါအရာများ ပါဝင်သင့်ပါသည် -

- ✅ သတ်မှတ်ချက်များ၊ architecture diagram နှင့် ကုန်ကျစရိတ် မှတ်စုများ ပါရှိသည့် သေချာပေါ့ပေါ့ `README.md`
- ✅ `metadata.template` ပါရှိသည့် အလုပ်လုပ်နိုင်သော `azure.yaml`
- ✅ အသစ်ဖြစ်သော subscription တွင် သန့်ရှင်းစွာ provision ပြုလုပ်နိုင်သည့် infrastructure
- ✅ `LICENSE` ဖိုင်တစ်ခု
- ✅ (အကြံပြု) တစ်ချက်နှိပ် Codespaces အတွက် `.devcontainer/`

gallery ၏ data ဖိုင်ထဲသို့ သင့် template ကို ထည့်သွင်းရန် pull request တင်ဖို့ Awesome AZD repository ရဲ့ လမ်းညွှန်ချက်အတိုင်း လုပ်ဆောင်ပါ - [Awesome AZD repository](https://github.com/Azure/awesome-azd) တွင် ဖော်ပြထားသည်။

---

## ဖြစ်တတ်သော အမှားများ

| အခက်အခဲ | ဖြေရှင်းနည်း |
|---------|-----|
| အရင်းအမြစ်အမည်များကို တိုက်ရိုက်ရေးထားခြင်း | `uniqueString()` resource token ကို အသုံးပြုပါ |
| `azd down` အပြီးတွင် resource များ ကျန်နေရေး | အရင်းအမြစ်တိုင်း (သို့မဟုတ် resource group) ကို `azd-env-name` နဲ့ tag လုပ်ပါ |
| Template သင့်လက်တွင် အလုပ်လုပ်သော်လည်း အခြားသူတွင် မအောင်မြင်ခြင်း | subscription ID များ၊ tenant ID များနှင့် တိုင်းဒေသ ခန့်မှန်းချက်များကို ဖယ်ရှားပစ်ပါ |
| Outputs များကို app တွင် ချိတ်ဆက်မထားခြင်း | `SERVICE_<NAME>_ENDPOINT_URL` နှင့် အခြား `AZURE_*` outputs များကို export ပြုလုပ်ပါ |
| Gallery တင်သွင်းရင်း ပယ်ဖျက်ခြင်း | `README.md`, `LICENSE`, နှင့် `metadata.template` ထည့်ပေးပါ |

---

## အကျဉ်းချုံး

- Template ဆိုတာက `azure.yaml`, `infra/`, နှင့် သင်၏ကုဒ်ပါဝင်သည့် Git repo တစ်ခုသာ ဖြစ်သည်။
- အားလုံးကို parameterize ပြုလုပ်ပါ — နာမည်များ၊ တိုင်းဒေသများ၊ နှင့် ID များ — ထို့ဖြင့် မည်သည့်နေရာမဆို ပြေးနိုင်မည်။
- အမြဲတမ်း resource များကို `azd-env-name` နဲ့ tag လုပ်ထားပါ၊ အထို့ကြောင့် `azd down` က အလုပ်လုပ်မည်။
- ထုတ်ဝေရန်မတိုင်ခင် `azd init --template <local-path>` ဖြင့် ဒေသတွင်း စမ်းသပ်ပါ။
- metadata နှင့် README ထည့်ပြီး Awesome AZD သို့ တင်ပါ။

---

## 🔗 လမ်းကြောင်း

| မည်သည့်ဘက် | ရင်းမြစ် |
|-----------|----------|
| **မတိုင်မီ** | [Deployment Guide](deployment-guide.md) |
| **အခန်း မူလစာမျက်နှာ** | [အခန်း ၄: Infrastructure as Code](README.md) |
| **နောက်တစ်ခန်း** | [အခန်း ၅: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 ဆက်စပ် ရင်းမြစ်များ

- [အရင်းအမြစ်များ တည်ဆောက်ခြင်း](provisioning.md)
- [Awesome AZD ပြခန်း](https://azure.github.io/awesome-azd/)
- [တရားဝင် azd template စာရွက်စာတမ်း](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->