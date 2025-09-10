<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-10T05:40:24+00:00",
  "source_file": "README.md",
  "language_code": "my"
}
-->
# AZD အခြေခံများ

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.my.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

ဤအရင်းအမြစ်များကို အသုံးပြုရန်အဆင့်များကို လိုက်နာပါ-  
1. **Repository ကို Fork လုပ်ပါ**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork) ကိုနှိပ်ပါ  
2. **Repository ကို Clone လုပ်ပါ**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Azure Discord Communities ကို Join လုပ်ပြီး ကျွမ်းကျင်သူများနှင့် Developer မိတ်ဆွေများနှင့် တွေ့ဆုံပါ**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 ဘာသာစကားများ အထောက်အပံ့

#### GitHub Action မှတဆင့် အလိုအလျောက် (အမြဲ Update ဖြစ်နေသော)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](./README.md)  

**အခြားဘာသာစကားများကို ထည့်သွင်းလိုပါက [ဒီမှာ](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md) ရှိသော အထောက်အပံ့ရနိုင်သော ဘာသာစကားများကို ကြည့်ပါ။**

## မိတ်ဆက်

Azure Developer CLI (azd) အတွက် လမ်းညွှန်ချက်များကို ကြိုဆိုပါတယ်။ ဤ Repository သည် ကျောင်းသားများမှ စ၍ Professional Developer များအထိ Azure Developer CLI ကို သင်ယူပြီး Cloud Deployment များကို ထိရောက်စွာ လုပ်ဆောင်နိုင်ရန် အကူအညီပေးရန် ရည်ရွယ်ထားသည်။ ဤလေ့လာမှုအရင်းအမြစ်သည် Azure Cloud Deployment များ၊ အခက်အခဲများကို ဖြေရှင်းခြင်းနှင့် AZD Template Deployment များအတွက် အကောင်းဆုံး လုပ်ဆောင်မှုများကို လက်တွေ့ကျကျ လေ့လာနိုင်စေသည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဤ Repository ကို အသုံးပြုခြင်းအားဖြင့်-
- Azure Developer CLI အခြေခံများနှင့် အဓိကအကြောင်းအရာများကို ကျွမ်းကျင်ပါ
- Infrastructure as Code ကို အသုံးပြု၍ Azure Resources များကို Deploy နှင့် Provision လုပ်ပါ
- AZD Deployment များတွင် ကြုံတွေ့ရသော အခက်အခဲများကို ဖြေရှင်းနိုင်စွမ်း ရရှိပါ
- Pre-deployment Validation နှင့် Capacity Planning ကို နားလည်ပါ
- Security အကောင်းဆုံး လုပ်ဆောင်မှုများနှင့် ကုန်ကျစရိတ် လျှော့ချမှု Strategies များကို အကောင်အထည်ဖော်ပါ
- Azure တွင် Production-ready Applications များကို Deploy လုပ်ရာတွင် ယုံကြည်မှု ရရှိပါ

## သင်ယူပြီးရရှိမည့် ရလဒ်များ

ဤသင်ခန်းစာကို ပြီးမြောက်ပြီးနောက်-
- Azure Developer CLI ကို အောင်မြင်စွာ Install, Configure နှင့် အသုံးပြုနိုင်ပါမည်
- AZD Templates ကို အသုံးပြု၍ Applications များကို Create နှင့် Deploy လုပ်နိုင်ပါမည်
- Authentication, Infrastructure နှင့် Deployment ပြဿနာများကို Troubleshoot လုပ်နိုင်ပါမည်
- Capacity Planning နှင့် SKU Selection အပါအဝင် Pre-deployment Checks များကို လုပ်ဆောင်နိုင်ပါမည်
- Monitoring, Security နှင့် Cost Management အကောင်းဆုံး လုပ်ဆောင်မှုများကို အကောင်အထည်ဖော်နိုင်ပါမည်
- AZD Workflows များကို CI/CD Pipelines တွင် ပေါင်းစပ်နိုင်ပါမည်

## အကြောင်းအရာများ

- [Azure Developer CLI ဆိုတာဘာလဲ?](../..)  
- [Quick Start](../..)  
- [Documentation](../..)  
- [Examples & Templates](../..)  
- [Resources](../..)  
- [Contributing](../..)  

## Azure Developer CLI ဆိုတာဘာလဲ?

Azure Developer CLI (azd) သည် Developer များအတွက် အထူးပြု Command-line Interface ဖြစ်ပြီး Azure တွင် Applications များကို Build နှင့် Deploy လုပ်ရာတွင် အမြန်ဆုံး လုပ်ဆောင်နိုင်စေသည်။  

- **Template-based deployments** - အများဆုံး အသုံးပြုသော Application Patterns များအတွက် Pre-built Templates များကို အသုံးပြုပါ  
- **Infrastructure as Code** - Bicep သို့မဟုတ် Terraform ကို အသုံးပြု၍ Azure Resources များကို စီမံပါ  
- **Integrated workflows** - Applications များကို Provision, Deploy နှင့် Monitor လုပ်ရာတွင် လွယ်ကူစွာ လုပ်ဆောင်နိုင်ပါ  
- **Developer-friendly** - Developer များအတွက် ထိရောက်မှုနှင့် အတွေ့အကြုံကို အထူးပြုထားသည်  

## Quick Start

### လိုအပ်ချက်များ
- Azure Subscription  
- Azure CLI Install လုပ်ထားရမည်  
- Git (Templates များကို Clone လုပ်ရန်)  

### Installation
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```  

### သင့်ရဲ့ ပထမဆုံး Deployment
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```  

## Documentation

### စတင်ခြင်း
- [**AZD အခြေခံများ**](docs/getting-started/azd-basics.md) - အဓိကအကြောင်းအရာများနှင့် အဓိပ္ပါယ်  
- [**Installation & Setup**](docs/getting-started/installation.md) - Platform-specific Installation လမ်းညွှန်  
- [**Configuration**](docs/getting-started/configuration.md) - Environment Setup နှင့် Authentication  
- [**သင့်ရဲ့ ပထမဆုံး Project**](docs/getting-started/first-project.md) - အဆင့်ဆင့် လမ်းညွှန်  

### Deployment & Provisioning
- [**Deployment Guide**](docs/deployment/deployment-guide.md) - Deployment Workflows အပြည့်အစုံ  
- [**Provisioning Resources**](docs/deployment/provisioning.md) - Azure Resource Management  

### Pre-Deployment Checks
- [**Capacity Planning**](docs/pre-deployment/capacity-planning.md) - Azure Resource Capacity Validation  
- [**SKU Selection**](docs/pre-deployment/sku-selection.md) - Azure SKUs ကို ရွေးချယ်ခြင်း  
- [**Pre-flight Checks**](docs/pre-deployment/preflight-checks.md) - Automated Validation Scripts  

### Troubleshooting
- [**Common Issues**](docs/troubleshooting/common-issues.md) - မကြုံစဖူးသော ပြဿနာများနှင့် ဖြေရှင်းနည်းများ  
- [**Debugging Guide**](docs/troubleshooting/debugging.md) - အဆင့်ဆင့် Debugging Strategies  

## Examples & Templates

### Starter Templates
- [**Simple Web Application**](../../examples/simple-web-app) - အခြေခံ Node.js Web Application Deployment  
- [**Static Website**](../../examples/static-website) - Azure Storage တွင် Static Website Hosting  
- [**Container Application**](../../examples/container-app) - Containerized Application Deployment  
- [**Database Application**](../../examples/database-app) - Database Integration ပါဝင်သော Web Application  

### Advanced Scenarios
- [**Microservices**](../../examples/microservices) - Multi-service Application Architecture  
- [**Serverless Functions**](../../examples/serverless-function) - Azure Functions Deployment  
- [**Configuration Examples**](../../examples/configurations) - Reusable Configuration Patterns  

## Resources

### Quick References
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - AZD Commands အရေးကြီးများ  
- [**Glossary**](resources/glossary.md) - Azure နှင့် AZD အဓိပ္ပါယ်များ  
- [**FAQ**](resources/faq.md) - မကြာခဏ မေးလေ့ရှိသော မေးခွန်းများ  
- [**Study Guide**](resources/study-guide.md) - သင်ယူရမည့် ရည်မှန်းချက်များနှင့် လေ့ကျင့်မှုများ  

### အပြင်ပန်း Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)  
- [Azure Status](https://status.azure.com/)  

## Learning Path

### ကျောင်းသားများနှင့် အခြေခံများအတွက်
1. [AZD အခြေခံများ](docs/getting-started/azd-basics.md) ကို စတင်ပါ  
2. [Installation Guide](docs/getting-started/installation.md) ကို လိုက်နာပါ  
3. [သင့်ရဲ့ ပထမဆုံး Project](docs/getting-started/first-project.md) ကို ပြီးမြောက်ပါ  
4. [Simple Web App Example](../../examples/simple-web-app) ကို လေ့ကျင့်ပါ  

### Developer များအတွက်
1. [Configuration Guide](docs/getting-started/configuration.md) ကို ပြန်လည်သုံးသပ်ပါ  
2. [Deployment Guide](docs/deployment/deployment-guide.md) ကို လေ့လာပါ  
3. [Database App Example](../../examples/database-app) ကို လုပ်ဆောင်ပါ  
4. [Container App Example](../../examples/container-app) ကို စမ်းသပ်ပါ  

### DevOps Engineers များအတွက်
1. [Provisioning Resources](docs/deployment/provisioning.md) ကို ကျွမ်းကျင်ပါ  
2. [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) ကို အကောင်အထည်ဖော်ပါ  
3. [Capacity Planning](docs/pre-deployment/capacity-planning.md) ကို လေ့ကျင့်ပါ  
4. [Microservices Example](../../examples/microservices) ကို လေ့လာပါ  

## Contributing

ကျွန်ုပ်တို့သည် အထောက်အပံ့များကို ကြိုဆိုပါသည်! [Contributing Guide](CONTRIBUTING.md) ကို ဖတ်ရှုပါ-  
- ပြဿနာများနှင့် Feature Requests များကို တင်သွင်းနည်း  
- Code Contribution လမ်းညွှန်  
- Documentation တိုးတက်မှုများ  
- Community Standards  

## Support

- **Issues**: [ပြဿနာများကို Report လုပ်ပြီး Feature များကို Request လုပ်ပါ](https://github.com/microsoft/azd-for-beginners/issues)  
- **Discussions**: [Microsoft Azure Discord Community Q&A နှင့် ဆွေးနွေးမှုများ](https://discord.gg/microsoft-azure)  
- **Email**: Private မေးမြန်းမှုများအတွက်  
- **Microsoft Learn**: [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## License

ဤ Project သည် MIT License အောက်တွင် လိုင်စင်ရရှိထားသည် - [LICENSE](../../LICENSE) ဖိုင်ကို ကြည့်ပါ။

## 🎒 အခြားသင်ခန်းစာများ

ကျွန်ုပ်တို့၏အဖွဲ့သည် အခြားသင်ခန်းစာများကို ထုတ်လုပ်ပါသည်! ကြည့်ပါ-  

- [**NEW** Model Context Protocol (MCP) For Beginners](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Agents for Beginners](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI for Beginners using .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generative AI for Beginners](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI for Beginners using Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML for Beginners](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Data Science for Beginners](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI for Beginners](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [Cybersecurity for Beginners](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [ဝဘ်ဆာဗာဖွံ့ဖြိုးရေး အခြေခံများ](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT အခြေခံများ](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR ဖွံ့ဖြိုးရေး အခြေခံများ](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Paired Programming အတွက် GitHub Copilot ကို ကျွမ်းကျင်စွာ အသုံးပြုခြင်း](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [C#/.NET Developer များအတွက် GitHub Copilot ကို ကျွမ်းကျင်စွာ အသုံးပြုခြင်း](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [သင့်ကိုယ်ပိုင် Copilot စွန့်စားမှုကို ရွေးချယ်ပါ](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**လမ်းညွှန်**
- **နောက်သင်ခန်းစာ**: [AZD အခြေခံများ](docs/getting-started/azd-basics.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်ဝန်ဆောင်မှုကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။