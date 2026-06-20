# တပ်ဆင်ခြင်းလမ်းညွှန် - AZD တပ်ဆင်မှုများကို ကျွမ်းကျင်စွာ သင်ကြားရန်

**အခန်း လမ်းညွှန်:**
- **📚 သင်တန်း မူလစာမျက်နှာ**: [AZD For Beginners](../../README.md)
- **📖 ယခု အခန်း**: အခန်း 4 - ကုဒ်ဖြင့် အင်ဖရားစထရပ်ချာ (Infrastructure) နှင့် တပ်ဆင်ခြင်း
- **⬅️ ယခင် အခန်း**: [အခန်း 3: ဖွဲ့စည်းခြင်း](../chapter-03-configuration/configuration.md)
- **➡️ နောက်တစ်ခု**: [အရင်းအမြစ်များ တပ်ဆင်ခြင်း](provisioning.md)
- **🧩 ဒီအခန်းထဲတွင်လည်း**: [ကိုယ်ပိုင် နမူနာ သင်္ချာရေးခြင်း](custom-templates.md)
- **🚀 နောက် အခန်း**: [အခန်း 5: Multi-Agent AI ဖြေရှင်းနည်းများ](../../examples/retail-scenario.md)

## နိဒါန်း

ဤလမ်းညွှန်လက်စွဲသည် Azure Developer CLI ကို အသုံးပြုပြီး အက်ပလီကေးရှင်းများကို တပ်ဆင်ရာတွင် လိုအပ်သည့် အချက်အလက်များအားလုံးကို ဖော်ပြထားပါသည်။ အခြေခံ တစ်ကြိမ်သတ်မှတ်ချက် တပ်ဆင်ခြင်းများမှ စ၍ ချိတ်ဆက်ထားသော custom hooks များ၊ မကြာခဏ ရှိသော အလွှာများ (multiple environments) နှင့် CI/CD ပေါင်းစည်းမှုများပါဝင်သည့် ထုတ်လုပ်မှုကြီးမြတ်သော ပြဿနာလမ်းကြောင်းများအထိ အပြည့်အစုံ ကိုလေ့လာနိုင်မည်ဖြစ်သည်။ လက်တွေ့ နမူနာများနှင့် အကောင်းဆုံး အကျင့်များဖြင့် တပ်ဆင်မှု အသီးသီး၏ ဘဝစက်ဝန်းကို ကျွမ်းကျင်စွာ သတိထားနိုင်ပါလိမ့်မည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဤလမ်းညွှန်ကို ပြီးမြောက်သည်နှင့် သင်သည်-
- Azure Developer CLI ၏ တပ်ဆင်မှုညွှန်ကြားချက်များနှင့် လုပ်ငန်းစဉ်များအား လက်ကျွမ်းလိမ့်မည်
- ပရိုဗျာရှင်း (provisioning) မှ စ၍ ကြည့်ရှုခြင်း (monitoring) အထိ တပ်ဆင်မှု ဘဝစက်ဝန်းအား နားလည်လိမ့်မည်
- အကြို/အကြောင်းဖြစ်သော custom deployment hooks များကို အလိုအလျောက် စီမံရေးဆွဲနိုင်မည်
- ပတ်၀န်းကျင် အမျိုးမျိုးအတွက် ပတ်၀န်းကျင်ဆိုင်ရာ ပါရာမီတာများဖြင့် ပြင်ဆင်နိုင်မည်
- blue-green နှင့် canary တို့ကဲ့သို့ တပ်ဆင်မှု အသွင်အပြင်များကို အဆင့်မြင့် စီမံနိုင်မည်
- azd တပ်ဆင်မှုများကို CI/CD ပိုင်းနှင့် DevOps လုပ်ငန်းစဉ်များထဲသို့ ပေါင်းစည်းနိုင်မည်

## သင်ယူပြီးရလဒ်များ

ပြီးမြောက်သည်နှင့် သင်သည်-
- azd တပ်ဆင်မှု လုပ်ငန်းစဉ်များအားလုံးကို တစ်ကိုယ်တော် ဆောင်ရွက်ပြီး ပြဿနာရှာဖွေရန် အတတ်နိုင်ဆုံးဖြစ်သွားမည်
- hooks ကို အသုံးပြု၍ ကိုယ်ပိုင် တပ်ဆင်မှု အလိုအလျောက် စနစ်ရေးဆွဲနိုင်မည်
- လုံခြုံရေးနှင့် ကြည့်ရှုရေးစောင့်ကြည့်မှုနှင့်အတူ ထုတ်လုပ်ရေးအဆင်သင့် တပ်ဆင်မှုများကို ပြင်ဆင်နိုင်မည်
- မျိုးစုံ ပတ်၀န်းကျင်များစီစဉ်ရန် အဆင်ပြေစွာ စီမံနိုင်မည်
- တပ်ဆင်မှု လုပ်ငန်းစဉ်ကို တိုးတက်အောင် ပြုပြင်၍ ပြန်လည်ယူဆောင်ရေး ပုံစံများကို တာဝန်ယူဆောင်ရွက်နိုင်မည်
- azd တပ်ဆင်မှုများကို စီးပွားရေး DevOps လေ့လာမှုများထဲသို့ ပေါင်းစည်းနိုင်မည်

## တပ်ဆင်မှု အနှစ်ချုပ်

Azure Developer CLI သည် အတော်များသော တပ်ဆင်မှု အမိန့်များကို ပေးသည်-
- `azd up` - ပြည့်စုံသော လုပ်ငန်းစဉ် (provision + deploy)
- `azd provision` - Azure အရင်းအမြစ်များကိုသာ ဖန်တီး/အသစ်ပြောင်းရန်
- `azd deploy` - အက်ပလီကေးရှင်းကုဒ်ကိုသာ တပ်ဆင်ရန်
- `azd package` - အက်ပလီကေးရှင်းများကို ဆောက်လုပ်ပြီး package ပြုလုပ်ရန်

## အခြေခံ တပ်ဆင်မှု လုပ်ငန်းစဉ်များ

### ပြည့်စုံတပ်ဆင်မှု (azd up)
စတင်သောပရောဂျက်များအတွက် အများအားဖြင့် အသုံးများသော လုပ်ငန်းစဉ်-
```bash
# အစပြုမှစ၍ အားလုံးကို ဖြန့်ချိပါ
azd up

# သတ်မှတ်ထားသော ပတ်ဝန်းကျင်ဖြင့် ဖြန့်ချိပါ
azd up --environment production

# စိတ်ကြိုက် ပါရာမီတာများဖြင့် ဖြန့်ချိပါ
azd up --parameter location=westus2 --parameter sku=P1v2
```

### အင်ဖရားစထရပ်ချာ-만်သာ တပ်ဆင်မှု
Azure အရင်းအမြစ်များကိုသာ update လုပ်ချင်သောအခါ-
```bash
# အခြေခံအဆောက်အအုံကို ဖန်တီး/အပ်ဒိတ်လုပ်ခြင်း
azd provision

# ပြောင်းလဲမှုများကို ကြိုကြည့်ရန် dry-run ဖြင့် ဖန်တီးခြင်း
azd provision --preview

# တိကျသော ဝန်ဆောင်မှုများကို ပေးသွင်းခြင်း
azd provision --service database
```

### ကုဒ်-만်သာ တပ်ဆင်မှု
အက်ပလီကေးရှင်းကို အမြန်ပြောင်းလဲချင်သောအခါ-
```bash
# ဝန်ဆောင်မှုအားလုံးကို တင်သွင်းပါ
azd deploy

# မျှော်မှန်းထားသော အထွက်:
# ဝန်ဆောင်မှုများကို တင်သွင်းနေပါသည် (azd deploy)
# - web: တင်သွင်းနေပါသည်... ပြီးပါပြီ
# - api: တင်သွင်းနေပါသည်... ပြီးပါပြီ
# အောင်မြင်ပါသည်: သင်၏ တင်သွင်းမှုကို 2 မိနစ် 15 စက္ကန့်အတွင်း ပြီးစီးခဲ့သည်

# သီးသန့် ဝန်ဆောင်မှုကို တင်သွင်းပါ
azd deploy --service web
azd deploy --service api

# စိတ်ကြိုက် build ပါရာမီတာများနှင့် တင်သွင်းပါ
azd deploy --service api --build-arg NODE_ENV=production

# တင်သွင်းမှုကို အတည်ပြုပါ
azd show --output json | jq '.services'
```

### ✅ တပ်ဆင်မှု အောင်မြင်မှု စစ်ဆေးခြင်း

တပ်ဆင်မှုတိုင်းပြီးစီးသွားပြီးနောက် အောင်မြင်ကြောင်း စစ်ဆေးပါ-

```bash
# အားလုံးသော ဝန်ဆောင်မှုများ ပြေးနေကြောင်း စစ်ဆေးပါ
azd show

# health endpoint များကို စမ်းသပ်ပါ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# အမှားများကို စောင့်ကြည့်ပါ (ပုံမှန်အားဖြင့် ဘရောက်ဇာတွငျ့ ဖွင့်မည်)
azd monitor --logs
```

**အောင်မြင်မှု ချက်များ:**
- ✅ ၀န်ဆောင်မှုများအားလုံးတွင် "Running" အခြေအနေကို ပြသည်
- ✅ Health endpoints များသည် HTTP 200 ပြန်လည်ပေးပို့သည်
- ✅ မကြာသေးမီ ၅ မိနစ်အတွင်း အမှားလော့ဂ် မရှိ
- ✅ အက်ပလီကေးရှင်းသည် စမ်းသပ် တောင်းဆိုမှုများကို ဖြေကြားသည်

## 🏗️ တပ်ဆင်မှု လုပ်ငန်းစဉ်ကို နားလည်ခြင်း

### hooks မသိသေးပါသလား? ဒီနေရာမှ စပါ

**hook** သည် azd မှ တပ်ဆင်မှု လုပ်ငန်းစဉ်အတွင်း လူတစ်ယောက်လက်လှမ်းမောက်သော အချိန်တစ်ခုတွင် အလိုအလျောက် လုပ်ဆောင်သည့် command ဖြစ်သည်—provision မတိုင်မီ၊ provision ပြီးနောက်၊ ကုဒ်တပ်ဆင်မီ သို့မဟုတ် ပြီးနောက် တို့တွင် ဖြစ်နိုင်သည်။ ၎င်းများက တပ်ဆင်မှုတွင် အမြဲလိုအပ်သော သေးငယ်သော အလုပ်များကို အလိုအလျောက် လုပ်ဆောင်ပေးနိုင်သည်။ ဥပမာ - ဒေတာဘေ့စ် အစေ့ထည့်ခြင်း၊ migrations chạyရန်, asset များ ဆောက်ရန်၊ သက်ဆိုင်ရာ လက်ရှိ အက်ပလီကေးရှင်းကို smoke-test ပြုလုပ်ရန် စသဖြင့်။

| Hook | Runs… | Common use |
|------|-------|------------|
| `preprovision` | အရင်းအမြစ်များ ဖန်တီးခြင်းမတိုင်မီ | မတိုင်မီ လိုအပ်ချက်များ စစ်ဆေးခြင်း၊ registry ထဲသို့ log in ဝင်ခြင်း |
| `postprovision` | အရင်းအမြစ်များ ရှိပြီးနောက် | အရင်းအမြစ်များကို ဖော်ပြချက်ပေးခြင်း၊ ဒေတာဘေ့စ် ကို စီစဉ်ခြင်း |
| `predeploy` | ကုဒ် တပ်ဆင်ခြင်းမတိုင်မီ | Front-end asset များ ဆောက်လုပ်ခြင်း၊ unit tests များ chạy |
| `postdeploy` | ကုဒ် တပ်ဆင်ပြီးနောက် | DB migrations chạy၊ endpoint ကို smoke-test ပြုလုပ်ခြင်း |

Hooks များသည် သင့် `azure.yaml` အတွင်း တည်ရှိကြသည်။ အောက်တွင် အနည်းဆုံး ဥပမာတစ်ခု ရှိသည်—တပ်ဆင်မှုပြီးဆုံးချိန်တွင် မက်ဆေ့ချ်ကိုသာ ပုံနှိပ်ပေးသည်-

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

ဒါပေမယ့် သက်မှတ်ထားသောအချိန်တွင် `azd up` ပြန် run လုပ်သော အခါ၌ မက်ဆေ့ချ်ကို အလိုအလျောက် ပုံနှိပ်ပေးမည်။ အပြည့်အစုံတပ်ဆင်မှုမလိုဘဲ hook တစ်ခုကို သီးသန့်ထဲတွင်လည်း run မည်ဆိုလျှင် စမ်းသပ်ရန် သင့်တော်သည်-

```bash
azd hooks run postdeploy
```

အောက်ဖော်ပြပါ အဆင့်များတွင် အမှန်တကယ် အသုံးဝင်သော hooks များ (migrations, tests, validation) ကို အဆင့်အလိုက် ပြထားသည်။

### အဆင့် 1: Pre-Provision Hooks
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### အဆင့် 2: အင်ဖရားစထရပ်ချာ ဖန်တီးခြင်း
- Infrastructure templates များ(Bicep/Terraform) ကို ဖတ်သည်
- Azure အရင်းအမြစ်များကို ဖန်တီး သို့မဟုတ် update လုပ်သည်
- ကွန်ယက်နှင့် လုံခြုံရေးကို ဖော်ပြသည်
- ကြည့်ရှုခြင်းနှင့် လော့ဂ်ဖိုင်များကို စီစဉ်သည်

### အဆင့် 3: Post-Provision Hooks
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### အဆင့် 4: အက်ပလီကေးရှင်း ပက်ကေ့ဂ်လုပ်ခြင်း
- အက်ပလီကေးရှင်းကုဒ်ကို ဆောက်လုပ်သည်
- တပ်ဆင်ရေး အရာဝတ္ထုများ (deployment artifacts) ကို ဖန်တီးသည်
- ပလက်ဖောင်းပေါ် မူတည်၍ package ပြုလုပ်သည် (containers, ZIP ဖိုင်များ, စသည်)

### အဆင့် 5: Pre-Deploy Hooks
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### အဆင့် 6: အက်ပလီကေးရှင်း တပ်ဆင်ခြင်း
- package ပြုလုပ်ထားသော အက်ပလီကေးရှင်းများကို Azure ၀န်ဆောင်မှုများသို့ တပ်ဆင်သည်
- config သတ်မှတ်ချက်များကို အပ်ဒိတ်လုပ်သည်
- ၀န်ဆောင်မှုများကို စတင်/ပြန်စတင် ရန်

### အဆင့် 7: Post-Deploy Hooks
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

### Hook အမှားများ ကို မည်သို့ ကိုင်တွယ်မလဲ

ပုံမှန်အားဖြင့်၊ **hook command တစ်ခုသည် non-zero exit code ဖြင့် ထွက်မည်ဆိုလျှင် azd သည် လုပ်ငန်းစဉ်အားလုံးကို ရပ်စဲသည်။** ၎င်းသည် များသောအားဖြင့် သင်လိုချင်သည့် အပြုအမူဖြစ်သည်—migrations လက်မအောင်မြင်ပါက တပ်ဆင်မှုကို ရပ်တန့်သင့်သည်၊ မတရားသော အက်ပလီကေးရှင်းကို ဖြန့်ချိရင် မမွန်ပါ။ သို့သော် ဒီလိုဆို hooks များကို ဂရုစိုက်ရေးပါ။

**1. မအောင်မြင်မှုများကို ကြေငြာပြီး ရေရှည် စီမံပါ။** Hook သည် ၎င်း၏ နောက်ဆုံး command မှ non-zero exit code ပြန်ပေးပါက fail သွားသည်။ shell script များတွင် `set -e` ထည့်ပါ၊ ထို့ဖြင့် hook သည် ပထမဆုံး မအောင်မြင်သည့် command တွင် ရပ်တန့်မည်၊ တောက်လျှောက် ဆက်လက်မလုပ်ပါ။

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. azd ကို ရပ်တန့်ခြင်းမရှိဘဲ hook တစ်ခုက အမှား ဖြစ်ခြင်း ခွင့်ပြုပါ။** အရေးကြီးမဟုတ်သော အဆင့်များ (optional cache warm-up, best-effort notification) အတွက် `continueOnError: true` ကို သတ်မှတ်ပါ။ azd သည် အမှားကို မှတ်တမ်းတင်ပေးသော်လည်း ဆက်လက်လုပ်ဆောင်မည်-

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. ပြီးပြည့်စုံ run မလုပ်ခင် hook များကို သီးခြား စမ်းသပ်ပါ။** hook ကို debug ဖို့ `azd up` run မလုပ်ဘဲ သီးခြား run လို့ ရသည်၊ ထိုနည်းဖြင့် အချိန်တိုအတွင်း iteration လုပ်လို့လွယ်ကူသည်-

```bash
azd hooks run predeploy          # predeploy hook ကိုသာ လည်ပတ်သည်
azd hooks run postdeploy --service api
```

**4. OS အလိုက် shell များကို သတိထားပါ။** `shell: pwsh` ကို အသုံးပြုထားသော hook တစ်ခုသည် PowerShell ကို ထည့်ထားသည့် စက်ပစ္စည်းပေါ်တွင်သာ ဖတ်နိုင်သည် (CI agent များပါဝင်သည်။) ပိုမိုကျယ်ပြန့်သော portability အတွက် `shell: sh` ကို အသုံးပြုပါ၊ သို့မဟုတ် `windows` နှင့် `posix` အမျိုးအစား နှစ်မျိုးကို ပံ့ပိုးပါ။

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **အမှားရှာဖွေရေး အကြံပြုချက်:** hook command line ပြည့်စုံနှင့် ထုတ်လွှင့်ချက်အားလုံးကို ကြည့်ရန် `--debug` ဖြင့် မည်သည့် azd command ကိုမဆို run ပါ။ ဒါက hook သည် ဒေသတွင် အလုပ်လုပ်သော်လည်း CI တွင် မအောင်မြင်သည့် အခါ အတော်အသင့် အရေးကြီးသည်။

## 🎛️ တပ်ဆင်မှု ဖွဲ့စည်းမှုများ

### ၀န်ဆောင်မှုအလိုက် တပ်ဆင်မှု သတ်မှတ်ချက်များ
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### ပတ်ဝန်းကျင် အလိုက် ပြင်ဆင်ချက်များ
```bash
# ဖွံ့ဖြိုးရေး ပတ်ဝန်းကျင်
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# စမ်းသပ် ပတ်ဝန်းကျင်
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# ထုတ်လုပ်ရေး ပတ်ဝန်းကျင်
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 အဆင့်မြင့် တပ်ဆင်မှု နယ်ပယ်များ

### မျိုးစုံ ၀န်ဆောင်မှု အက်ပလီကေးရှင်းများ
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### Blue-Green တပ်ဆင်မှုများ
```bash
# အပြာရောင် ပတ်ဝန်းကျင်ကို ဖန်တီးပါ
azd env new production-blue
azd up --environment production-blue

# အပြာရောင် ပတ်ဝန်းကျင်ကို စမ်းသပ်ပါ
./scripts/test-environment.sh production-blue

# လည်ပတ်မှုကို အပြာသို့ ဦးတည်ပြောင်းပါ (DNS/Load Balancer ကို လက်ဖြင့် အပ်ဒိတ်လုပ်ရန်)
./scripts/switch-traffic.sh production-blue

# အစိမ်းရောင် ပတ်ဝန်းကျင်ကို ရှင်းလင်းပါ
azd env select production-green
azd down --force
```

### Canary တပ်ဆင်မှုများ
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### အဆင့်လိုက် တပ်ဆင်မှုများ
```bash
#!/bin/bash
# deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 ကွန်တိန်နာ တပ်ဆင်မှုများ

### Container App တပ်ဆင်မှုများ
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### Multi-Stage Dockerfile အထူးပြုပြင်မှု
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ ဖျော်ဖြေရေး အကောင်အထည်ဖော်မှု တိုးတက်စေခြင်း

### ၀န်ဆောင်မှုအလိုက် တပ်ဆင်မှုများ
```bash
# ပိုမိုလျင်မြန်စွာ ပြန်လည်ပြင်ဆင်စမ်းသပ်နိုင်ရန် ဝန်ဆောင်မှုတစ်ခုကို တပ်ဆင်ပါ
azd deploy --service web
azd deploy --service api

# ဝန်ဆောင်မှုအားလုံးကို တပ်ဆင်ပါ
azd deploy
```

### Build Caching
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### ကုဒ် တပ်ဆင်မှုများကို ထိရောက်စေခြင်း
```bash
# ကုဒ်သာပြောင်းလဲမှုများအတွက် azd up မဟုတ်၊ azd deploy ကို အသုံးပြုပါ
# ဤသည်သည် အခြေခံအဆောက်အအုံ ချမှတ်ခြင်းကို ကျော်လွှားပြီး ပိုမိုမြန်ဆန်သည်
azd deploy

# အမြန်ဆုံး ထပ်ခေါ်ပြင်ဆင်ရန် သီးခြား ဝန်ဆောင်မှုကို တင်ပို့ပါ
azd deploy --service api
```

## 🔍 တပ်ဆင်မှု ကြည့်ရှုခြင်း

### တကယ်တိုင် အချိန်ဖြင့် တပ်ဆင်မှု ကြည့်ရှုခြင်း
```bash
# အချိန်နှင့်တပြေးညီ အက်ပလီကေးရှင်းကို စောင့်ကြည့်ပါ
azd monitor --live

# အက်ပလီကေးရှင်းလော့ဂ်များကို ကြည့်ပါ
azd monitor --logs

# တပ်ဆင်မှုအခြေအနေကို စစ်ဆေးပါ
azd show
```

### Health Checks
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### တပ်ဆင်မှုပြီးနောက် အတည်ပြုခြင်း
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# လျှောက်လွှာ၏ ကျန်းမာရေးကို စစ်ဆေးပါ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 လုံခြုံရေး စဉ်းစားချက်များ

### Secrets စီမံခန့်ခွဲမှု
```bash
# လျှို့ဝှက်ချက်များကို လုံခြုံစိတ်ချစွာ သိမ်းဆည်းပါ
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml တွင် လျှို့ဝှက်ချက်များကို ကိုးကားပါ
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### ကွန်ယက် လုံခြုံရေး
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### Identity နှင့် Access စီမံခန့်ခွဲမှု
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 ပြန်လည်ယူဆောင်ရေး မဟာဗျူဟာများ

### အမြန် ပြန်လည်ယူဆောင်ခြင်း
```bash
# AZD တွင် အလိုအလျောက် rollback မရှိပါ။ အကြံပြုနည်းလမ်းများ:

# Option 1: Git မှ ထပ်မံတင်သွင်းခြင်း (အကြံပြု)
git revert HEAD  # ပြဿနာဖြစ်သော commit ကို ပြန်လှန်ပါ။
git push
azd deploy

# Option 2: သတ်မှတ် commit ကို ထပ်မံတင်သွင်းခြင်း
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### အင်ဖရားစထရပ်ခ်ာ ပြန်လည်ယူဆောင်ခြင်း
```bash
# အသုံးချမတိုင်ခင် အခြေခံအဆောက်အအုံ ပြောင်းလဲမှုများကို ကြိုကြည့်ပါ
azd provision --preview

# အခြေခံအဆောက်အအုံ ပြန်လှန်ရန် ဗားရှင်းထိန်းချုပ်မှုကို အသုံးပြုပါ:
git revert HEAD  # အခြေခံအဆောက်အအုံ ပြောင်းလဲမှုများကို မူလအခြေအနေသို့ ပြန်လှန်ပါ
azd provision    # ယခင် အခြေခံအဆောက်အအုံ အခြေအနေကို အသုံးချပါ
```

### ဒေတာဘေ့စ် Migration ပြန်လည်ယူဆောင်ခြင်း
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 တပ်ဆင်မှု Metrics

### တပ်ဆင်မှု တန်ဖိုးစစ်ဆေးမှု ကို တစ်ဆင့်တက် ကောက်ယူခြင်း
```bash
# လက်ရှိ တပ်ဆင်မှု အခြေအနေကို ကြည့်ရန်
azd show

# Application Insights ဖြင့် အပလီကေးရှင်းကို စောင့်ကြည့်ရန်
azd monitor --overview

# တိုက်ရပ် မီထရစ်များကို ကြည့်ရန်
azd monitor --live
```

### ကိုယ်ပိုင် Metrics စုဆောင်းခြင်း
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 အကောင်းဆုံး အကျင့်များ

### 1. ပတ်ဝန်းကျင် တင်းကျပ်မှု
```bash
# နာမည်ပေးရာတွင် စနစ်တကျ တစ်ပုံတည်း အသုံးပြုပါ
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ပတ်ဝန်းကျင်များ၏ တန်းတူဖြစ်မှုကို ထိန်းသိမ်းပါ
./scripts/sync-environments.sh
```

### 2. အင်ဖရားစထရက်ချာ အတည်မပြုခြင်း
```bash
# တပ်ဆင်မီ အင်ဖရာပြုပြင်ပြောင်းလဲမှုများကို ကြိုကြည့်ပါ
azd provision --preview

# ARM/Bicep linting ကို အသုံးပြုပါ
az bicep lint --file infra/main.bicep

# Bicep သဒ္ဒါကို စစ်ဆေး၍ အတည်ပြုပါ
az bicep build --file infra/main.bicep
```

### 3. စမ်းသပ်မှု ပေါင်းစည်းမှု
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. စာတမ်းရေးခြင်းနှင့် လော့ဂ်တင်ခြင်း
```bash
# ဖြန့်ချိခြင်း လုပ်ထုံးလုပ်နည်းများကို မှတ်တမ်းတင်ပါ
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## နောက်ဆက်တွဲ အဆင့်များ

- [အရင်းအမြစ်များ တပ်ဆင်ခြင်း](provisioning.md) - အင်ဖရားစထရပ်ခ်ာ စီမံခန့်ခွဲမှုကို နက်နက်ရှိုင်းရှိုင်း လေ့လာရန်
- [တပ်ဆင်မှုမပြုလုပ်မီ စီမံကိန်းဆွဲခြင်း](../chapter-06-pre-deployment/capacity-planning.md) - သင့်တပ်ဆင်မှု မဟာဗျူဟာကို စီစဉ်ရန်
- [ပုံမှန် ပြဿနာများ](../chapter-07-troubleshooting/common-issues.md) - တပ်ဆင်မှု ပြဿနာများကို ဖြေရှင်းရန်
- [အကောင်းဆုံး အကျင့်များ](../chapter-07-troubleshooting/debugging.md) - ထုတ်လုပ်မှုအဆင်သင့် တပ်ဆင်မှု မဟာဗျူဟာများ

## 🎯 လက်တွေ့ တပ်ဆင်မှု လေ့ကျင့်ခန်းများ

### လေ့ကျင့်ခန်း 1: အပိုင်းပိုင်း တပ်ဆင်မှု လုပ်ငန်းစဉ် (20 မိနစ်)
**ရည်မှန်းချက်**: ပြည့်စုံတပ်ဆင်မှုနှင့် အပိုင်းပိုင်း တပ်ဆင်မှု အကြား ကွာခြားချက်ကို ကျွမ်းကျင်ရန်

```bash
# အစပိုင်း စတင် တပ်ဆင်ခြင်း
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# အစပိုင်း တပ်ဆင်မှု အချိန်ကို မှတ်တမ်းတင်ပါ
echo "Full deployment: $(date)" > deployment-log.txt

# ကုဒ်ကို ပြောင်းလဲပါ
echo "// Updated $(date)" >> src/api/src/server.js

# ကုဒ်ပဲ တင်ပို့ပါ (လျင်မြန်)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# အချိန်များကို နှိုင်းယှဉ်ပါ
cat deployment-log.txt

# ရှင်းလင်းပါ
azd down --force --purge
```

**အောင်မြင်မှုပေါင်းကောက်ချက်များ:**
- [ ] ပြည့်စုံတပ်ဆင်မှုတွင် 5-15 မိနစ် ကြာမြင့်တယ်
- [ ] ကုဒ်-만်သာ တပ်ဆင်မှုတွင် 2-5 မိနစ် ကြာမြင့်တယ်
- [ ] ကုဒ်ပြောင်းလဲမှုများသည် တပ်ဆင်ထားသော အက်ပလီကေးရှင်းတွင် ပြသနာမရှိ ပြောင်းလဲသည်
- [ ] `azd deploy` ပြုလုပ်ပြီးနောက် အင်ဖရားစထရပ်ခ်ာ မပြောင်းလဲပါ

**သင်ယူရလဒ်**: `azd deploy` သည် ကုဒ်ပြောင်းလဲမှုများအတွက် `azd up` ထက် 50-70% မြန်သည်

### လေ့ကျင့်ခန်း 2: ကိုယ်ပိုင် တပ်ဆင်မှု Hooks များ (30 မိနစ်)
**ရည်မှန်းချက်**: အကြိုနှင့် အကြောင်းပြီးနောက် တပ်ဆင်မှု အလိုအလျောက် စနစ်များကို တည်ဆောက်ခြင်း

```bash
# Deploy မတိုင်ခင် အတည်ပြု စစ်ဆေးရေး script တစ်ခု ဖန်တီးပါ
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# စမ်းသပ်မှုများ အောင်မြင်ကြောင်း စစ်ဆေးပါ
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# commit မလုပ်ရသေးသည့် ပြောင်းလဲမှုများ ရှိမရှိ စစ်ဆေးပါ
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Deploy ပြီးနောက် smoke test တစ်ခု ဖန်တီးပါ
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# azure.yaml ဖိုင်ထဲသို့ hooks များ ထည့်ပါ
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# hooks အသုံးပြု၍ deployment ကို စမ်းသပ်ပါ
azd deploy
```

**အောင်မြင်မှုပေါင်းကောက်ချက်များ:**
- [ ] Pre-deploy script သည် တပ်ဆင်မှုမပြုမီ အလုပ်လုပ်သည်
- [ ] စမ်းသပ်မှု မအောင်မြင်ပါက တပ်ဆင်မှု ပယ်ဖျက်သည်
- [ ] Post-deploy smoke test သည် အခြေအနေကို အတည်ပြုသည်
- [ ] Hooks များသည် မှန်ကန်သော အ순ာတွင် အကောင်အထည်ဖော်သည်

### လေ့ကျင့်ခန်း 3: မျိုးစုံ ပတ်ဝန်းကျင် တပ်ဆင်မှု မဟာဗျူဟာ (45 မိနစ်)
**ရည်မှန်းချက်**: အဆင့်လိုက် တပ်ဆင်မှု လုပ်ငန်းစဉ် (dev → staging → production) ကို တည်ဆောက်ခြင်း

```bash
# တပ်ဆင်ရေး script တစ်ခု ဖန်တီးရန်
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# အဆင့် ၁: dev ပတ်ဝန်းကျင်သို့ တပ်ဆင်ပါ
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# အဆင့် ၂: staging ပတ်ဝန်းကျင်သို့ တပ်ဆင်ပါ
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# အဆင့် ၃: production အတွက် လက်ဖြင့် အတည်ပြုပါ
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# ပတ်ဝန်းကျင်များ ဖန်တီးပါ
azd env new dev
azd env new staging
azd env new production

# အဆင့်လိုက် တပ်ဆင်မှု လည်ပတ်ပါ
./deploy-staged.sh
```

**အောင်မြင်မှုပေါင်းကောက်ချက်များ:**
- [ ] Dev ပတ်ဝန်းကျင် အောင်မြင်စွာ တပ်ဆင်နိုင်သည်
- [ ] Staging ပတ်ဝန်းကျင် အောင်မြင်စွာ တပ်ဆင်နိုင်သည်
- [ ] ထုတ်လုပ်ရေးအတွက် လက်မှတ်လက်ခံခြင်း လိုအပ်သည်
- [ ] ပတ်ဝန်းကျင်အားလုံးတွင် ရှိသည့် health checks များ အလုပ်လုပ်သည်
- [ ] လိုအပ်ပါက ပြန်လည်ယူဆောင်နိုင်သည်

### လေ့ကျင့်ခန်း 4: ပြန်လည်ယူဆောင်ရေး မဟာဗျူဟာ (25 မိနစ်)
**ရည်မှန်းချက်**: Git ကို အသုံးပြု၍ တပ်ဆင်မှု ပြန်လည်ယူဆောင်ရေးကို တည်ဆောက်ပြီး စမ်းသပ်ခြင်း

```bash
# v1 ကို တင်သွင်းခြင်း
azd env set APP_VERSION "1.0.0"
azd up

# v1 commit hash ကို သိမ်းဆည်းခြင်း
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# ပျက်စီးစေသော ပြောင်းလဲမှုပါသော v2 ကို တင်သွင်းခြင်း
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ပျက်ကွက်မှုကို တွေ့ရှိပြီး ပြန်လှည့်ခြင်း
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ကို အသုံးပြု၍ ပြန်လှည့်ခြင်း
    git revert HEAD --no-edit
    
    # ပတ်ဝန်းကျင်ကို ပြန်လှည့်ခြင်း
    azd env set APP_VERSION "1.0.0"
    
    # v1 ကို ပြန်တင်သွင်းခြင်း
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**အောင်မြင်မှုပေါင်းကောက်ချက်များ:**
- [ ] တပ်ဆင်မှု အရှုံးများကို ရှာဖွေတတ်သည်
- [ ] Rollback script ကို အလိုအလျောက် ဖော်ဆောင်နိုင်သည်
- [ ] အသစ်ပြန်လည်တည်ဆောက်မှုအခြေအနေနှင့် ပြန်ရောက်လာနိုင်သည်
- [ ] ပြန်လည်ယူဆောင်ပြီးနောက် health checks များ ဖြတ်ကျော်တတ်သည်

## 📊 တပ်ဆင်မှု Metrics အကောက်ခွဲခြင်း

### သင့်တပ်ဆင်မှု လုပ်ငန်းစဉ် တန်ဖိုးကို ချက်ချင်း အလိုအလျောက် တွက်ချက်ပါ

```bash
# deployment မက်ထရစ်များစုဆောင်းရန် script တစ်ခု ဖန်တီးပါ
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# ဖိုင်ထဲသို့ မှတ်တမ်းတင်ပါ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# အသုံးပြုပါ
./track-deployment.sh
```

**သင့် metrics များကို ချက်ချင်း ပေါင်းစပ်သုံးသပ်ပါ:**
```bash
# ထုတ်လွှင့်မှုမှတ်တမ်း ကြည့်ရန်
cat deployment-metrics.csv

# ပျမ်းမျှ ထုတ်လွှင့်ချိန်ကို တွက်ချက်ရန်
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## အပိုဆောင်း ရင်းမြစ်များ

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**လမ်းကြောင်း ကိုယ်တက်ရောက်ရန်**
- **ယခင် သင်ခန်းစာ**: [သင့်ရဲ့ ပထမဆုံး ပရောဂျက်](../chapter-01-foundation/first-project.md)
- **နောက် သင်ခန်းစာ**: [အရင်းအမြစ်များ တပ်ဆင်ခြင်း](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ပြောကြားချက်**
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှန်ကန်မှုအတွက် ကြိုးပမ်းနေသော်လည်း၊ စက်ကိရိယာဘာသာပြန်ခြင်းများတွင် အမှားများ သို့မဟုတ် မှားယွင်းချက်များ ပါဝင်နိုင်ကြောင်း သတိပြုပါရန် လိုအပ်ပါသည်။ မူလစာတမ်းကို မူရင်းဘာသာဖြင့်သာ ယုံကြည်စိတ်ချရသော အချက်အလက်အဖြစ် သတ်မှတ်သင့်သည်။ အရေးကြီးသည့် သတင်းအချက်အလက်များအတွက် ပရော်ဖက်ရှင်နယ် လူသားဘာသာပြန်သူဝန်ဆောင်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော နားလည်မှုကွာခြားမှုများ သို့မဟုတ် မမှန်ကန်သော အသုံးပြုမှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မခံပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->