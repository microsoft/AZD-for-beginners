# ကိုယ်ပိုင် အက်ပ် အသုံးပြုခြင်း - ရှိပြီးသား ပရောဂျက်တွင် azd ထည့်ရန်

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Validated against `azd 1.25.6` in June 2026.

## နိဒါန်း

[Your First Project](first-project.md) တွင် သင်သည် တမ်းပလိတ်မှ စ၍ အက်ပ်တစ်ခုကို တင်သွင်းခဲ့သည်။ သို့သော် အများအားဖြင့် သင့်မှာ သောတည်းက ရှိပြီးသား အက်ပ်တစ်ခု—Node.js API, Python Flask စနစ်, .NET ဝက်ဘ်အက်ပ် စသည်—ကို မရှေ့မှ ရှိသော ဖိုလ်ဒါအတွင်းမှာ ရှိနေသည်။ ဤစာသင်ခန်းသည် အဲဒီ ရှိပြီးသား ကုဒ်အတွက် azd ကို မည်သို့ ထည့်ရမည်ကို ဖော်ပြသည်၊ ထို့ကြောင့် `azd up` ဖြင့် တင်သွင်းနိုင်သည်။ တမ်းပလိတ် မလိုအပ်ပါ။

## သင်ယူရမည့် အချက်များ

သင်သည် ဤသင်ခန်းအဆုံးတွင်:
- azd ပရောဂျက်စတင်ရန် နည်းလမ်း ၃ မျိုးကို နားလည်ထားမည်
- ရှိပြီးသား ကုဒ်ဘေ့စ်အတွင်း `azd init` ကို လည်ပတ်နိုင်မည်
- `azure.yaml` နှင့် `infra/` ဖိုလ်ဒါများက သင့်အက်ပ်အတွက် ဘာလုပ်ဆောင်သလဲကို နားလည်မည်
- azd ကို အောက်ဆောက်လုပ်ငန်းကို ထုတ်ပေးစေမည်နဲ့ ကိုယ့်ဘာသာရေးသားမည်ကို ဘယ်အချိန်ရွေးမည်ကို သိရှိမည်
- ရှိပြီးသား အက်ပ်ကို `azd up` ဖြင့် Azure သို့ တင်သွင်းနိုင်မည်

## သင်ယူပြီးရမည့် ဆက်စပ်ရလဒ်များ

ဤသင်ခန်းကို ပြီးမြောက်ပြီးနောက် သင်သည်:
- ရှိပြီးသား ပရောဂျက်တစ်ခုတွင် azd ကို စတင်ထားနိုင်မည်
- အခြေခံ `azure.yaml` ဖိုင်ကို ဖတ်ရှု တည်းဖြတ်နိုင်မည်
- `azd infra generate` ဖြင့် ကြို တည်ဆောက်မှု (starter infrastructure) ဖန်တီးနိုင်မည်
- သင့်အက်ပ်အတွက် သင့်လျော်သော Azure ဟော့စ်ကို ရွေးချယ်နိုင်မည်
- ကိုယ်ပိုင် အက်ပ်ကို တင်သွင်း၍ ဖြုတ်ပစ်နိုင်မည်

---

## azd ပရောဂျက် စတင်ရန် နည်းလမ်း ၃ မျိုး

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Learning, or starting a new app from a proven sample |
| **From your existing code** | `azd init` (in your project folder) | You already have an app and want to deploy it |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Adopting azd for an existing repository |

သင်သည် ပထမဆုံးရွေးချယ်မှုကို အလေ့အထကျဆင်ခဲ့ပြီးသားဖြစ်သည်။ ဤသင်ခန်းသည် ဒုတိယရွေးချယ်မှုကို လေ့လာပါမည်—အများဆုံး အသုံးများသော ဖြစ်ရပ်။

---

## ခြေလှမ်း 1: သင့် ပရောဂျက်အတွင်း `azd init` လည်စမ်းပါ

တက်မင်နယ်တစ်ခုကို သင့် ရှိပြီးသား ပရောဂျက် ဖိုလ်ဒါအတွင်းတွင် ဖွင့်၍ အောက်ပါကို ရိုက်ပါ။

```bash
cd my-existing-app
azd init
```

azd သည် သင့်အား စတင်စိတ်ကြိုက်လုပ်ပုံကို မေးပါလိမ့်မည်။ ရွေးချယ်ပါ။

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

**"Use code in the current directory."** ကို ရွေးပါ။ azd သည် သင့်ဖိုလ်ဒါကို စကန်းလုပ်ပြီး ဘာသာစကားနှင့် ဖရေ မှ်၀ာ့ကို တွေ့ရှိကာ ဟော့စ်တစ်ခု အကြံပြုသည်။

### azd က တွေ့ရှိပေးသည့်အရာများ

azd သည် `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, သို့မဟုတ် `Dockerfile` ကဲ့သို့သော အချက်အလက်များကို ရှာဖွေကာ ကိုက်ညီသော Azure ဟော့စ်ကို အကြံပြုသည်။

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service or Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

တွေ့ရှိခံရသော စာရင်းဝန်ဆောင်မှု(များ)ကို အတည်ပြုပါ၊ azd သည် သင့်အတွက် လိုအပ်သော ဖိုင်များကို scaffolding ပြုလုပ်မည်။

---

## ခြေလှမ်း 2: azd သည် ဘာတွေ ဖန်တီးခဲ့ကြောင်း နားလည်ပါ

init ပြီးစီးဆုံးပြီးနောက် သင့် ပရောဂျက်တွင် အရာနှစ်ခုအသစ်ရှိမည်။

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — ပရောဂျက် သတ်မှတ်ချက်

ဤသည်သည် azd ပရောဂျက်၏ အဓိက ဖြစ်သည်။ အနည်းဆုံး ပုံစံတစ်ခုက အောက်ပါအတိုင်း ဖြစ်သည်။

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` အပိုင်းသည် အဓိက အစိတ်အပိုင်းဖြစ်သည်။ အရင်းအမြစ်တိုင်းသည် သင့်ကုဒ်ဖိုလ်ဒါတစ်ခုကို Azure ဟော့စ် တစ်ခုနှင့် မြေပုံချပြသည်။ သင့်အက်ပ်တွင် frontend နှင့် API နှစ်ခုလုံးရှိပါက service နှစ်ခုရှိမည်ဖြစ်သည်။

### `infra/` — သင့် Azure အရင်းအမြစ်များကို ကုဒ်အဖြစ်

`infra/` ဖိုလ်ဒါတွင် သင့်အက်ပ်အတွက် လိုအပ်သည့် Azure အရင်းအမြစ်များ (App Service, database စသည်) ကို သတ်မှတ်ထားသည့် Bicep ဖိုင်များ ပါရှိသည်။ သင်သည် ဒီဖိုင်များကို လက်ဖြင့် ရေးရန် မလိုအပ်ပါ—azd သည် လည်လျှောက်အသုံးပြုနိုင်သော စတင်အဆင့်ကို ဖန်တီးပေးသည်။ နောက်ပိုင်းတွင် လိုအပ်သလို အရင်းအမြစ်များ ထပ်ထည့်ခြင်း သို့မဟုတ် လုံခြုံရေးကို တင်းကျပ်စေမှုများ ဆောင်ရွက်ရန် အဲဒီဖိုင်များကို တည်းဖြတ်နိုင်သည် ([Chapter 4](../chapter-04-infrastructure/README.md) တွင် ဖော်ပြထားသည်)။

> **ဥပမာအကြံပြုချက်:** မတင်မီ ဖန်တီးထားသော အောက်ဆောက်လုပ်ငန်းကို ကြည့်လိုပါသလား သို့မဟုတ် စိတ်ကြိုက်ပြင်လိုပါသလား? `azd infra generate` (သို့) `azd infra synth` ကို လည်ပတ်၍ IaC ကို ဒစ်စခ်သိုလှောင်ပြီး စစ်ဆေးရန်နှင့် version-control ပေးရန် ကြည့်ရှုနိုင်သည်။

---

## ခြေလှမ်း 3: လိုအပ်သည့် ဖော်ပြချက်များ သတ်မှတ်ပါ

သင့်အက်ပ်တွင် settings သို့မဟုတ် secrets (connection string, API key) လိုအပ်ပါက ထိုအချက်အလက်များကို လက်မထည့်ကြရပါ။ environment တန်ဖိုးများကို အသုံးပြုပါ။

```bash
# ပတ်ဝန်းကျင်တစ်ခု ဖန်တီးပါ
azd env new dev

# လျှို့ဝှက်ချက်မပါသော တန်ဖိုးတစ်ခု သတ်မှတ်ပါ
azd env set API_VERSION 1.0.0
```

လုံခြုံစိတ်ချရသော secret များအတွက် Key Vault ထဲသို့ သိမ်းဆည်းပြီး သင့် အောက်ဆောက်လုပ်ငန်းမှ မှတ်ချက်ချိတ်ဆက်ပါ—[Chapter 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md) ကို ကြည့်ပါ။

---

## ခြေလှမ်း 4: တင်သွင်းခြင်း

ယခု သင့်ကိစ္စမှာ ရှိပြီးသား workflow ကို အသုံးပြုပါ။

```bash
# အတည်ပြုပါ (azd အတွက် လိုအပ်သည်)
azd auth login

# ဖန်တီးမည့် ရင်းမြစ်များကို ကြိုတင်ကြည့်ရှုပါ
azd provision --preview

# အခြေခံ အဆောက်အအုံကို ဖွဲ့စည်းပေးပြီး သင့်ကုဒ်ကို ဖြန့်ချိပါ
azd up
```

ပြီးဆုံးသွားလျှင် azd သည် သင့်အက်ပ်၏ URL ကို ပုံဖော်ပေးမည်။ အားလုံး azd အက်ပ် တစ်ခုတည်းမျှပင် စစ်ဆေးပါ။

```bash
azd show           # endpoint များကို ပြပါ
azd monitor --logs # လိုအပ်ပါက လော့ဂ်များကို စစ်ဆေးပါ
```

---

## ပထမဆုံးအကြိမ် တွေ့ကြုံနိုင်သည့် ပြဿနာများ

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Add the manifest, or pick the host manually during `azd init` |
| Build fails during `azd up` | App needs a build step | Add `buildCommand`/`outputPath` under the service in `azure.yaml` |
| App starts but returns errors | Missing config/secret | Set values with `azd env set` or wire up Key Vault |
| Wrong host chosen | Auto-detection guessed | Edit `host:` in `azure.yaml` and re-run `azd up` |

နောက်ထပ်အချက်အလက်များအတွက် [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) ကို ဖတ်ပါ။

---

## စင်ကြယ်ရန်

```bash
azd down --force --purge
```

---

## အနှစ်ချုပ်

- `azd init` → **"Use code in the current directory"** သည် ရှိပြီးသား အက်ပ်ထဲသို့ azd ကို ထည့်သွင်းသည်။
- `azure.yaml` သည် သင့်ကုဒ်ဖိုလ်ဒါများကို Azure ဟော့စ်များနှင့် မြေပုံချပြသည့်အရာဖြစ်သည်; `infra/` သည် အရင်းအမြစ်များကို Bicep အဖြစ် သတ်မှတ်တည်ဆောက်ပေးသည်။
- `azd infra generate` သည် ဖန်တီးထားသော အောက်ဆောက်လုပ်ငန်းကို ပြန်လည်သုံးသပ် သို့မဟုတ် စိတ်ကြိုက်ပြင်ဆင်ရန် ခွင့်ပြုသည်။
- တစ်ခါစတင်ထားပြီးနောက် သင့် ရှိပြီးသား အက်ပ်သည် တမ်းပလိတ်အပုံစံဖြင့် ရရှိသော `azd up` / `azd down` workflow တူညီပဲ အသုံးပြုမည်။

---

## 🔗 Navigation

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Your First Project](first-project.md) |
| **Next** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 ဆက်စပ် ရင်းမြစ်များ

- [AZD Basics](azd-basics.md)
- [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Configuration & Authentication](../chapter-03-configuration/authsecurity.md)
- [Command Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->