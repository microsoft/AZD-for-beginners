<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a82d27b84022e9b7c7a163f99fa1fd25",
  "translation_date": "2025-09-18T13:33:42+00:00",
  "source_file": "resources/faq.md",
  "language_code": "my"
}
-->
# မကြာခဏမေးလေ့ရှိသောမေးခွန်းများ (FAQ)

**အခန်းအလိုက်အကူအညီရယူရန်**
- **📚 သင်ခန်းစာမူလ**: [AZD For Beginners](../README.md)
- **🚆 တပ်ဆင်မှုဆိုင်ရာပြဿနာများ**: [အခန်း ၁: Installation & Setup](../docs/getting-started/installation.md)
- **🤖 AI ဆိုင်ရာမေးခွန်းများ**: [အခန်း ၂: AI-First Development](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 ပြဿနာဖြေရှင်းခြင်း**: [အခန်း ၇: Troubleshooting & Debugging](../docs/troubleshooting/common-issues.md)

## မိတ်ဆက်

ဒီအကျယ်အဝန်းပါသော FAQ သည် Azure Developer CLI (azd) နှင့် Azure deployments အကြောင်း မကြာခဏမေးလေ့ရှိသောမေးခွန်းများအတွက် အဖြေများပေးသည်။ အမြန်ဖြေရှင်းနည်းများ ရှာဖွေပါ၊ အကောင်းဆုံးအလေ့အကျင့်များကို နားလည်ပါ၊ azd ၏ အကြောင်းအရာများနှင့် လုပ်ငန်းစဉ်များကို ရှင်းလင်းစွာ သိရှိနိုင်ပါသည်။

## သင်ယူရမည့်ရည်မှန်းချက်များ

ဒီ FAQ ကိုကြည့်ရှုခြင်းအားဖြင့် သင်သည်:
- Azure Developer CLI နှင့်ပတ်သက်သော မကြာခဏဖြစ်ပေါ်သောမေးခွန်းများနှင့် ပြဿနာများအတွက် အမြန်ဖြေရှင်းနည်းများ ရှာဖွေနိုင်မည်
- အကျိုးကျေးဇူးရှိသော Q&A ပုံစံမှ အဓိကအကြောင်းအရာများနှင့် အသုံးအနှုန်းများကို နားလည်နိုင်မည်
- မကြာခဏဖြစ်ပေါ်သော ပြဿနာများနှင့် အမှားအယွင်းအခြေအနေများအတွက် ဖြေရှင်းနည်းများ ရယူနိုင်မည်
- အကောင်းဆုံးအလေ့အကျင့်များကို အမြဲမေးလေ့ရှိသောမေးခွန်းများမှတဆင့် သင်ယူနိုင်မည်
- ကျွမ်းကျင်သူများ၏မေးခွန်းများမှတဆင့် အဆင့်မြင့်အင်္ဂါရပ်များနှင့် စွမ်းဆောင်ရည်များကို ရှာဖွေနိုင်မည်
- ကုန်ကျစရိတ်၊ လုံခြုံရေးနှင့် deployment မဟာဗျူဟာဆိုင်ရာ လမ်းညွှန်ချက်များကို ထိရောက်စွာ ရည်ညွှန်းနိုင်မည်

## သင်ယူရမည့်ရလဒ်များ

ဒီ FAQ ကိုအကြိမ်ကြိမ်ရည်ညွှန်းခြင်းအားဖြင့် သင်သည်:
- ပေးထားသောဖြေရှင်းနည်းများကို အသုံးပြု၍ Azure Developer CLI ဆိုင်ရာ ပြဿနာများကို ကိုယ်တိုင်ဖြေရှင်းနိုင်မည်
- Deployment မဟာဗျူဟာများနှင့် configuration များအကြောင်း ဆုံးဖြတ်ချက်များကို သိရှိပြီး ဆောင်ရွက်နိုင်မည်
- azd နှင့် အခြား Azure tools များနှင့် services များအကြား ဆက်စပ်မှုကို နားလည်နိုင်မည်
- အသိုင်းအဝိုင်း၏အတွေ့အကြုံနှင့် ကျွမ်းကျင်သူများ၏အကြံပေးချက်များအပေါ် အခြေခံ၍ အကောင်းဆုံးအလေ့အကျင့်များကို အသုံးချနိုင်မည်
- Authentication, deployment, configuration ဆိုင်ရာပြဿနာများကို ထိရောက်စွာ ဖြေရှင်းနိုင်မည်
- FAQ ၏ အကြံပေးချက်များနှင့် အကြံဉာဏ်များကို အသုံးပြု၍ ကုန်ကျစရိတ်နှင့် စွမ်းဆောင်ရည်ကို အကောင်းဆုံးဖြစ်အောင် လုပ်ဆောင်နိုင်မည်

## အကြောင်းအရာများစာရင်း

- [စတင်ခြင်း](../../../resources)
- [Authentication & Access](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [အကောင်းဆုံးအလေ့အကျင့်များ](../../../resources)
- [အဆင့်မြင့်အကြောင်းအရာများ](../../../resources)

---

## စတင်ခြင်း

### Q: Azure Developer CLI (azd) ဆိုတာဘာလဲ?
**A**: Azure Developer CLI (azd) သည် developer အလေးထားသော command-line tool ဖြစ်ပြီး သင့် application ကို local development environment မှ Azure သို့ အမြန်ဆုံးရောက်ရှိစေသည်။ Template များမှတဆင့် အကောင်းဆုံးအလေ့အကျင့်များကို ပေးပြီး deployment lifecycle အားလုံးကို ကူညီပေးသည်။

### Q: azd သည် Azure CLI နှင့် ဘာကွာခြားသလဲ?
**A**: 
- **Azure CLI**: Azure resources များကို စီမံခန့်ခွဲရန် general-purpose tool
- **azd**: Application deployment workflows အတွက် developer အလေးထားသော tool
- azd သည် Azure CLI ကို အတွင်းပိုင်းတွင် အသုံးပြုသော်လည်း development scenarios များအတွက် အဆင့်မြင့် abstraction များကို ပေးသည်
- azd တွင် template များ၊ environment management နှင့် deployment automation ပါဝင်သည်

### Q: azd ကို အသုံးပြုရန် Azure CLI ကို တပ်ဆင်ထားရမလား?
**A**: ဟုတ်ပါတယ်၊ azd သည် authentication နှင့် အချို့သောလုပ်ဆောင်မှုများအတွက် Azure CLI ကို လိုအပ်သည်။ အရင်ဆုံး Azure CLI ကို တပ်ဆင်ပြီးနောက် azd ကို တပ်ဆင်ပါ။

### Q: azd သည် ဘာ programming languages များကို ပံ့ပိုးပေးသလဲ?
**A**: azd သည် language-agnostic ဖြစ်သည်။ အောက်ပါများနှင့်အလုပ်လုပ်နိုင်သည်:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Static websites
- Containerized applications

### Q: azd ကို ရှိပြီးသား project များနှင့် အသုံးပြုနိုင်မလား?
**A**: ဟုတ်ပါတယ်! သင်သည်:
1. `azd init` ကို အသုံးပြု၍ ရှိပြီးသား project များတွင် azd configuration ထည့်နိုင်သည်
2. ရှိပြီးသား project များကို azd template structure နှင့် ကိုက်ညီအောင် ပြောင်းနိုင်သည်
3. သင့်ရဲ့ architecture အပေါ်အခြေခံပြီး custom templates များကို ဖန်တီးနိုင်သည်

---

## Authentication & Access

### Q: azd ကို အသုံးပြု၍ Azure နှင့် authenticate လုပ်ရန် ဘယ်လိုလုပ်ရမလဲ?
**A**: `azd auth login` ကို အသုံးပြုပါ၊ ဒါဟာ Azure authentication အတွက် browser window ကို ဖွင့်ပေးပါမည်။ CI/CD scenarios များအတွက် service principals သို့မဟုတ် managed identities ကို အသုံးပြုပါ။

### Q: azd ကို Azure subscriptions များစွာနှင့် အသုံးပြုနိုင်မလား?
**A**: ဟုတ်ပါတယ်။ `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` ကို အသုံးပြု၍ subscription တစ်ခုစီအတွက် သတ်မှတ်နိုင်သည်။

### Q: azd ဖြင့် deploy လုပ်ရန် ဘယ်လို permissions လိုအပ်သလဲ?
**A**: သာမန်အားဖြင့် သင်သည်:
- **Contributor** role ကို resource group သို့မဟုတ် subscription တွင် လိုအပ်သည်
- **User Access Administrator** role ကို role assignments လိုအပ်သော resources များကို deploy လုပ်ရန် လိုအပ်သည်
- Template နှင့် deploy လုပ်မည့် resources အပေါ်မူတည်၍ အထူး permissions များ လိုအပ်နိုင်သည်

### Q: azd ကို CI/CD pipelines တွင် အသုံးပြုနိုင်မလား?
**A**: အမှန်ပါပဲ! azd သည် CI/CD integration အတွက် ဖန်တီးထားသည်။ Authentication အတွက် service principals ကို အသုံးပြုပြီး configuration အတွက် environment variables များကို သတ်မှတ်ပါ။

### Q: GitHub Actions တွင် authentication ကို ဘယ်လိုကိုင်တွယ်ရမလဲ?
**A**: Azure Login action ကို service principal credentials ဖြင့် အသုံးပြုပါ:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: azd templates များကို ဘယ်မှာရှာနိုင်မလဲ?
**A**: 
- Official templates: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Community templates: GitHub တွင် "azd-template" ရှာဖွေပါ
- `azd template list` ကို အသုံးပြု၍ ရရှိနိုင်သော templates များကို browse လုပ်ပါ

### Q: Custom template ကို ဘယ်လိုဖန်တီးရမလဲ?
**A**: 
1. ရှိပြီးသား template structure ကို စတင်ပါ
2. `azure.yaml`, infrastructure files, application code ကို ပြောင်းလဲပါ
3. `azd up` ဖြင့် စမ်းသပ်ပါ
4. GitHub တွင် သင့် template ကို tags များဖြင့် publish လုပ်ပါ

### Q: Template မပါဘဲ azd ကို အသုံးပြုနိုင်မလား?
**A**: ဟုတ်ပါတယ်၊ `azd init` ကို ရှိပြီးသား project တွင် အသုံးပြု၍ လိုအပ်သော configuration files များကို ဖန်တီးနိုင်သည်။ `azure.yaml` နှင့် infrastructure files များကို manual configure လုပ်ရန် လိုအပ်ပါမည်။

### Q: Official templates နှင့် community templates အကြား ဘာကွာခြားသလဲ?
**A**: 
- **Official templates**: Microsoft မှ maintain လုပ်ထားပြီး documentation ပြည့်စုံသည်
- **Community templates**: Developer များဖန်တီးထားပြီး အထူးသုံးအမှုများရှိနိုင်သည်၊ အရည်အသွေးနှင့် maintain လုပ်မှုကွဲပြားနိုင်သည်

### Q: Project တွင် template ကို update လုပ်ရန် ဘယ်လိုလုပ်ရမလဲ?
**A**: Template များကို auto update မလုပ်ပါ။ သင်သည်:
1. Source template မှ manual compare နှင့် merge လုပ်နိုင်သည်
2. Updated template ကို အသုံးပြု၍ `azd init` ဖြင့် စတင်နိုင်သည်
3. Updated templates မှ specific improvements များကို cherry-pick လုပ်နိုင်သည်

---

## Deployment & Infrastructure

### Q: azd သည် ဘယ် Azure services များကို deploy လုပ်နိုင်သလဲ?
**A**: azd သည် Bicep/ARM templates မှတဆင့် Azure services များ deploy လုပ်နိုင်သည်၊ အထူးသဖြင့်:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Networking, security, monitoring resources

### Q: တစ်ခုထက်မက region များတွင် deploy လုပ်နိုင်မလား?
**A**: ဟုတ်ပါတယ်၊ သင့် Bicep templates တွင် multiple regions ကို configure လုပ်ပြီး environment တစ်ခုစီအတွက် location parameter ကို သတ်မှတ်ပါ။

### Q: Database schema migrations ကို ဘယ်လိုကိုင်တွယ်ရမလဲ?
**A**: `azure.yaml` တွင် deployment hooks ကို အသုံးပြုပါ:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Infrastructure ကို application မပါဘဲ deploy လုပ်နိုင်မလား?
**A**: ဟုတ်ပါတယ်၊ `azd provision` ကို အသုံးပြု၍ templates တွင် သတ်မှတ်ထားသော infrastructure components များကိုသာ deploy လုပ်နိုင်သည်။

### Q: ရှိပြီးသား Azure resources ကို deploy လုပ်နိုင်မလား?
**A**: ဒါဟာ ရှုပ်ထွေးပြီး တိုက်ရိုက် support မရှိပါ။ သင်:
1. ရှိပြီးသား resources များကို သင့် Bicep templates တွင် import လုပ်နိုင်သည်
2. Templates တွင် ရှိပြီးသား resource references ကို အသုံးပြုနိုင်သည်
3. Resources များကို conditionally create သို့မဟုတ် reference လုပ်ရန် templates ကို ပြောင်းနိုင်သည်

### Q: Bicep အစား Terraform ကို အသုံးပြုနိုင်မလား?
**A**: လက်ရှိတွင် azd သည် Bicep/ARM templates ကို အဓိက support လုပ်ပါသည်။ Terraform support သည် တရားဝင်မရှိသော်လည်း community solutions များ ရှိနိုင်သည်။

---

## Configuration & Environments

### Q: Environment များ (dev, staging, prod) ကို ဘယ်လိုစီမံရမလဲ?
**A**: `azd env new <environment-name>` ကို အသုံးပြု၍ environment များကို ဖန်တီးပြီး environment တစ်ခုစီအတွက် settings များကို configure လုပ်ပါ:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Environment configurations များကို ဘယ်မှာသိမ်းဆည်းထားသလဲ?
**A**: Project directory အတွင်းရှိ `.azure` folder တွင် သိမ်းဆည်းထားသည်။ Environment တစ်ခုစီတွင် configuration files ပါဝင်သည်။

### Q: Environment-specific configuration ကို ဘယ်လိုသတ်မှတ်ရမလဲ?
**A**: `azd env set` ကို အသုံးပြု၍ environment variables များကို configure လုပ်ပါ:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Environment configurations များကို အဖွဲ့ဝင်များအကြားမျှဝေနိုင်မလား?
**A**: `.azure` folder တွင် sensitive information ပါဝင်ပြီး version control တွင် commit မလုပ်သင့်ပါ။ အစား:
1. လိုအပ်သော environment variables များကို documentation တွင် ဖော်ပြပါ
2. Deployment scripts ကို အသုံးပြု၍ environments များကို setup လုပ်ပါ
3. Sensitive configuration အတွက် Azure Key Vault ကို အသုံးပြုပါ

### Q: Template defaults များကို ဘယ်လို override လုပ်ရမလဲ?
**A**: Template parameters နှင့် ကိုက်ညီသော environment variables များကို သတ်မှတ်ပါ:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: `azd up` အလုပ်မလုပ်ဘဲ fail ဖြစ်နေသည့်အကြောင်းရင်းများကဘာလဲ?
**A**: အကြောင်းရင်းများ:
1. **Authentication ပြဿနာများ**: `azd auth login` ကို run လုပ်ပါ
2. **Permissions မလုံလောက်ခြင်း**: Azure role assignments ကို စစ်ဆေးပါ
3. **Resource naming conflicts**: AZURE_ENV_NAME ကို ပြောင်းပါ
4. **Quota/capacity ပြဿနာများ**: Regional availability ကို စစ်ဆေးပါ
5. **Template အမှားများ**: Bicep templates ကို validate လုပ်ပါ

### Q: Deployment fail ဖြစ်နေသည့်အခါ debug လုပ်ရန် ဘယ်လိုလုပ်ရမလဲ?
**A**: 
1. `azd deploy --debug` ကို run လုပ်၍ verbose output ရယူပါ
2. Azure portal deployment history ကို စစ်ဆေးပါ
3. Azure portal တွင် Activity Log ကို ကြည့်ပါ
4. `azd show` ကို အသုံးပြု၍ လက်ရှိ environment state ကို ပြပါ

### Q: Environment variables မအလုပ်လုပ်ခြင်း၏အကြောင်းရင်းများကဘာလဲ?
**A**: စစ်ဆေးရန်:
1. Variable names သည် template parameters နှင့် တိတိကျကျကိုက်ညီရမည်
2. Values တွင် space ပါရှိပါက သင့်တင့်စွာ quote လုပ်ထားရမည်
3. Environment ကို select လုပ်ထားရမည်: `azd env select <environment>`
4. Variables များကို သင့် environment မှာ set လုပ်ထားရမည်

### Q: Fail ဖြစ်သွားသော deployments များကို clean up လုပ်ရန် ဘယ်လိုလုပ်ရမလဲ?
**A**: 
```bash
azd down --force --purge
```
ဒါဟာ resources အားလုံးနှင့် environment configuration ကို ဖယ်ရှားပေးပါမည်။

### Q: Deployment ပြီးဆုံးပြီး application မရောက်ရှိခြင်း၏အကြောင်းရင်းများကဘာလဲ?
**A**: စစ်ဆေးရန်:
1. Deployment အောင်မြင်စွာ ပြီးဆုံးထားသည်
2. Application သည် run ဖြစ်နေသည် (Azure portal logs ကို စစ်ဆေးပါ)
3. Network security groups သည် traffic ကို ခွင့်ပြုထားသည်
4. DNS/custom domains သည် မှန်ကန်စွာ configure လုပ်ထားသည်

---

## Cost & Billing

### Q: azd deployments ကုန်ကျစရိတ် ဘယ်လောက်ရှိမလဲ?
**A**: ကုန်ကျစရိတ်သည်:
- Deploy လုပ်သော Azure services
- Service tiers/SKUs ရွေးချယ်မှု
- Regional pricing ကွာခြားမှု
- အသုံးပြုမှုပုံစံများ

[Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) ကို အသုံးပြု၍ ခန့်မှန်းနိုင်ပါသည်။

### Q: azd deployments တွင် ကုန်ကျစရိတ်ကို ဘယ်လိုထိန်းချုပ်ရမလဲ?
**A**: 
1. Development environments အတွက် lower-tier SKUs ကို အသုံးပြုပါ
2. Azure budgets နှင့် alerts ကို setup လုပ်ပါ
3. Resources မလိုအပ်သောအခါ
2. **Templates**: [template guidelines](https://github.com/Azure-Samples/awesome-azd) ကိုလိုက်နာပြီး template များဖန်တီးပါ  
3. **Documentation**: [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs) တွင်စာရွက်စာတမ်းများထည့်သွင်းပါ  

### Q: azd အတွက် roadmap ဘာတွေလဲ?  
**A**: [official roadmap](https://github.com/Azure/azure-dev/projects) ကိုကြည့်ပြီး feature အသစ်များနှင့်တိုးတက်မှုများကိုစစ်ဆေးပါ  

### Q: အခြား deployment tools တွေကနေ azd ကိုဘယ်လိုပြောင်းမလဲ?  
**A**:  
1. လက်ရှိ deployment architecture ကိုခွဲခြမ်းစိတ်ဖြာပါ  
2. အတူတူသော Bicep templates များဖန်တီးပါ  
3. `azure.yaml` ကိုလက်ရှိ service များနှင့်ကိုက်ညီအောင် configure လုပ်ပါ  
4. Development environment မှာအပြည့်အဝစမ်းသပ်ပါ  
5. Environment များကိုတဖြည်းဖြည်းပြောင်းပါ  

---

## မေးစရာရှိသေးလား?  

### **ရှာဖွေပါ**  
- [official documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ကိုကြည့်ပါ  
- [GitHub issues](https://github.com/Azure/azure-dev/issues) တွင်တူညီသောပြဿနာများကိုရှာပါ  

### **အကူအညီရယူပါ**  
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Community support  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Technical questions  
- [Azure Discord](https://discord.gg/azure) - Real-time community chat  

### **ပြဿနာများรายงาน**  
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Bug report နှင့် feature request များ  
- သက်ဆိုင်သော logs, error messages, နှင့်ပြဿနာကိုပြန်လုပ်နိုင်သောအဆင့်များထည့်ပါ  

### **ပိုမိုလေ့လာရန်**  
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*ဤ FAQ ကိုအကြိမ်ကြိမ် update လုပ်ပါသည်။ နောက်ဆုံး update: September 9, 2025*  

---

**Navigation**  
- **Previous Lesson**: [Glossary](glossary.md)  
- **Next Lesson**: [Study Guide](study-guide.md)  

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် ရှုလေ့လာသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်မှုကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။