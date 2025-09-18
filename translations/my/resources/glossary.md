<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f16d2988a24670d1b6aa2372de1a231a",
  "translation_date": "2025-09-18T13:36:07+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "my"
}
-->
# အဘိဓာန် - Azure နှင့် AZD အကြောင်းအရာများ

**အခန်းအားလုံးအတွက် ရည်ညွှန်းချက်**
- **📚 သင်တန်းမူလစာမျက်နှာ**: [AZD For Beginners](../README.md)
- **📖 အခြေခံများကို သင်ယူပါ**: [အခန်း ၁: AZD အခြေခံများ](../docs/getting-started/azd-basics.md)
- **🤖 AI အကြောင်းအရာများ**: [အခန်း ၂: AI-First Development](../docs/ai-foundry/azure-ai-foundry-integration.md)

## နိဒါန်း

ဤအဘိဓာန်သည် Azure Developer CLI နှင့် Azure cloud development တွင် အသုံးပြုသော အကြောင်းအရာများ၊ အယူအဆများနှင့် အတိုကောက်များအတွက် အဓိပ္ပါယ်များကို ပေးထားသည်။ သင်တန်းစာတမ်းများကို နားလည်ရန်၊ ပြဿနာများကို ဖြေရှင်းရန်နှင့် azd ပရောဂျက်များနှင့် Azure ဝန်ဆောင်မှုများအကြောင်း ဆက်သွယ်ရန် အရေးကြီးသော ရည်ညွှန်းချက်တစ်ခုဖြစ်သည်။

## သင်ယူရမည့် ရည်မှန်းချက်များ

ဤအဘိဓာန်ကို အသုံးပြုခြင်းဖြင့် သင်သည်:
- Azure Developer CLI အကြောင်းအရာများနှင့် အယူအဆများကို နားလည်မည်
- Azure cloud development အဘိဓာန်နှင့် နည်းပညာဆိုင်ရာ စကားလုံးများကို ကျွမ်းကျင်မည်
- Infrastructure as Code နှင့် deployment အကြောင်းအရာများကို ထိရောက်စွာ ရည်ညွှန်းနိုင်မည်
- Azure ဝန်ဆောင်မှုအမည်များ၊ အတိုကောက်များနှင့် ၎င်းတို့၏ ရည်ရွယ်ချက်များကို နားလည်မည်
- ပြဿနာရှာဖွေခြင်းနှင့် debugging အတွက် အသုံးဝင်သော အဓိပ္ပါယ်များကို ရယူနိုင်မည်
- Azure architecture နှင့် development အဆင့်မြင့်အကြောင်းအရာများကို သင်ယူမည်

## သင်ယူပြီးရမည့် ရလဒ်များ

ဤအဘိဓာန်ကို မကြာခဏ ရည်ညွှန်းခြင်းဖြင့် သင်သည်:
- Azure Developer CLI အကြောင်းအရာများကို မှန်ကန်သောစကားလုံးများဖြင့် ထိရောက်စွာ ဆက်သွယ်နိုင်မည်
- နည်းပညာဆိုင်ရာ စာတမ်းများနှင့် အမှားစာတိုများကို ပိုမိုရှင်းလင်းစွာ နားလည်နိုင်မည်
- Azure ဝန်ဆောင်မှုများနှင့် အယူအဆများကို ယုံကြည်မှုဖြင့် လှည့်လည်နိုင်မည်
- ပြဿနာများကို သင့်တော်သော နည်းပညာဆိုင်ရာ စကားလုံးများဖြင့် ဖြေရှင်းနိုင်မည်
- အဖွဲ့ဆွေးနွေးပွဲများတွင် မှန်ကန်သော နည်းပညာဆိုင်ရာ စကားလုံးများဖြင့် ပါဝင်ဆွေးနွေးနိုင်မည်
- Azure cloud development အကြောင်းအရာများကို စနစ်တကျ တိုးချဲ့သင်ယူနိုင်မည်

## A

**ARM Template**  
Azure Resource Manager template ဖြစ်သည်။ JSON အခြေခံထားသော Infrastructure as Code ပုံစံဖြင့် Azure ရင်းမြစ်များကို ကြေညာရေးပုံစံဖြင့် သတ်မှတ်ခြင်းနှင့် တင်သွင်းခြင်းအတွက် အသုံးပြုသည်။

**App Service**  
Azure ၏ platform-as-a-service (PaaS) ဝန်ဆောင်မှုဖြစ်ပြီး၊ web applications, REST APIs နှင့် mobile backends များကို infrastructure ကို စီမံခန့်ခွဲရန် မလိုဘဲ တင်သွင်းနိုင်သည်။

**Application Insights**  
Azure ၏ application performance monitoring (APM) ဝန်ဆောင်မှုဖြစ်ပြီး၊ application performance, availability နှင့် usage အကြောင်းအရာများကို နက်နက်ရှိုင်းရှိုင်း သိရှိစေသည်။

**Azure CLI**  
Azure ရင်းမြစ်များကို စီမံခန့်ခွဲရန် command-line interface ဖြစ်သည်။ azd မှ authentication နှင့် အချို့သော လုပ်ဆောင်မှုများအတွက် အသုံးပြုသည်။

**Azure Developer CLI (azd)**  
Developer များအတွက် အထူးသင့်လျော်သော command-line tool ဖြစ်ပြီး၊ templates နှင့် Infrastructure as Code ကို အသုံးပြု၍ Azure သို့ application များကို တည်ဆောက်ခြင်းနှင့် တင်သွင်းခြင်းလုပ်ငန်းစဉ်ကို အရှိန်မြှင့်ပေးသည်။

**azure.yaml**  
azd ပရောဂျက်တစ်ခု၏ အဓိက configuration ဖိုင်ဖြစ်ပြီး၊ services, infrastructure နှင့် deployment hooks များကို သတ်မှတ်ထားသည်။

**Azure Resource Manager (ARM)**  
Azure ၏ deployment နှင့် management ဝန်ဆောင်မှုဖြစ်ပြီး၊ ရင်းမြစ်များကို ဖန်တီးခြင်း၊ အပ်ဒိတ်လုပ်ခြင်းနှင့် ဖျက်သိမ်းခြင်းအတွက် စီမံခန့်ခွဲမှုအလွှာကို ပေးသည်။

## B

**Bicep**  
Microsoft မှ ဖွံ့ဖြိုးတိုးတက်စေသော domain-specific language (DSL) ဖြစ်ပြီး၊ Azure ရင်းမြစ်များကို တင်သွင်းရန် အသုံးပြုသည်။ ARM templates ထက် ရိုးရှင်းသော syntax ကို ပေးသည်။

**Build**  
Source code ကို compile လုပ်ခြင်း၊ dependencies များကို install လုပ်ခြင်းနှင့် applications များကို တင်သွင်းရန် ပြင်ဆင်ခြင်းလုပ်ငန်းစဉ်ဖြစ်သည်။

**Blue-Green Deployment**  
Downtime နှင့် အန္တရာယ်ကို လျှော့ချရန် identical production environments (blue နှင့် green) နှစ်ခုကို အသုံးပြုသည့် deployment မဟာဗျူဟာဖြစ်သည်။

## C

**Container Apps**  
Azure ၏ serverless container ဝန်ဆောင်မှုဖြစ်ပြီး၊ containerized applications များကို infrastructure ကို စီမံခန့်ခွဲရန် မလိုဘဲ တင်သွင်းနိုင်သည်။

**CI/CD**  
Continuous Integration/Continuous Deployment ဖြစ်သည်။ Code ပြောင်းလဲမှုများကို ပေါင်းစည်းခြင်းနှင့် applications များကို တင်သွင်းခြင်းလုပ်ငန်းစဉ်များကို အလိုအလျောက်လုပ်ဆောင်သည်။

**Cosmos DB**  
Azure ၏ ကမ္ဘာလုံးဆိုင်ရာ ဖြန့်ဝေထားသော multi-model database ဝန်ဆောင်မှုဖြစ်ပြီး၊ throughput, latency, availability နှင့် consistency အတွက် ပြည့်စုံသော SLA များကို ပေးသည်။

**Configuration**  
Application အပြုအမူနှင့် deployment ရွေးချယ်မှုများကို ထိန်းချုပ်သည့် settings နှင့် parameters များဖြစ်သည်။

## D

**Deployment**  
Applications နှင့် ၎င်းတို့၏ dependencies များကို ရည်မှန်းထားသော infrastructure တွင် တင်သွင်းခြင်းလုပ်ငန်းစဉ်ဖြစ်သည်။

**Docker**  
Containerization နည်းပညာကို အသုံးပြု၍ applications များကို ဖွံ့ဖြိုးတိုးတက်စေခြင်း၊ ပို့ဆောင်ခြင်းနှင့် အလုပ်လုပ်စေခြင်းအတွက် platform ဖြစ်သည်။

**Dockerfile**  
Docker container image တစ်ခုကို တည်ဆောက်ရန် လိုအပ်သော ညွှန်ကြားချက်များပါရှိသည့် text ဖိုင်ဖြစ်သည်။

## E

**Environment**  
သင့် application ၏ အထူးသတ်မှတ်ထားသော instance တစ်ခုကို ကိုယ်စားပြုသည့် deployment target (ဥပမာ - development, staging, production) ဖြစ်သည်။

**Environment Variables**  
Applications များ runtime တွင် access ပြုနိုင်သည့် key-value pairs အဖြစ် သိမ်းဆည်းထားသော configuration values များဖြစ်သည်။

**Endpoint**  
Application သို့မဟုတ် service ကို access ပြုနိုင်သည့် URL သို့မဟုတ် network address ဖြစ်သည်။

## F

**Function App**  
Azure ၏ serverless compute ဝန်ဆောင်မှုဖြစ်ပြီး၊ infrastructure ကို စီမံခန့်ခွဲရန် မလိုဘဲ အဖြစ်အပျက်အခြေပြု code များကို အလုပ်လုပ်စေသည်။

## G

**GitHub Actions**  
GitHub repositories နှင့် ပေါင်းစည်းထားသော CI/CD platform ဖြစ်ပြီး၊ workflows များကို အလိုအလျောက်လုပ်ဆောင်သည်။

**Git**  
Source code တွင် ပြောင်းလဲမှုများကို ခြေရာခံရန် အသုံးပြုသည့် distributed version control system ဖြစ်သည်။

## H

**Hooks**  
Deployment lifecycle ၏ အထူးအချိန်များတွင် (ဥပမာ - preprovision, postprovision, predeploy, postdeploy) အလုပ်လုပ်စေသည့် custom scripts သို့မဟုတ် commands များဖြစ်သည်။

**Host**  
Application တစ်ခုကို တင်သွင်းမည့် Azure ဝန်ဆောင်မှုအမျိုးအစား (ဥပမာ - appservice, containerapp, function) ဖြစ်သည်။

## I

**Infrastructure as Code (IaC)**  
Infrastructure ကို လက်ဖြင့်လုပ်ဆောင်ခြင်းမဟုတ်ဘဲ code ဖြင့် သတ်မှတ်ခြင်းနှင့် စီမံခန့်ခွဲခြင်းလုပ်ငန်းစဉ်ဖြစ်သည်။

**Init**  
Template တစ်ခုမှ အသစ်သော azd ပရောဂျက်တစ်ခုကို စတင်ခြင်းလုပ်ငန်းစဉ်ဖြစ်သည်။

## J

**JSON**  
JavaScript Object Notation ဖြစ်သည်။ Configuration ဖိုင်များနှင့် API responses များအတွက် အများအားဖြင့် အသုံးပြုသော data interchange format ဖြစ်သည်။

**JWT**  
JSON Web Token ဖြစ်သည်။ JSON object အဖြစ် အချက်အလက်များကို ဘေးကင်းစွာ ပေးပို့ရန်အတွက် စံသတ်မှတ်ချက်ဖြစ်သည်။

## K

**Key Vault**  
Secrets, keys နှင့် certificates များကို ဘေးကင်းစွာ သိမ်းဆည်းရန်နှင့် စီမံခန့်ခွဲရန်အတွက် Azure ၏ ဝန်ဆောင်မှုဖြစ်သည်။

**Kusto Query Language (KQL)**  
Azure Monitor, Application Insights နှင့် အခြား Azure ဝန်ဆောင်မှုများတွင် data ကို ခွဲခြမ်းစိတ်ဖြာရန် အသုံးပြုသည့် query language ဖြစ်သည်။

## L

**Load Balancer**  
ဝင်ရောက်လာသည့် network traffic ကို servers သို့မဟုတ် instances များစွာအကြား ဖြန့်ဝေသည့် ဝန်ဆောင်မှုဖြစ်သည်။

**Log Analytics**  
Cloud နှင့် on-premises ပတ်ဝန်းကျင်များမှ telemetry data များကို စုဆောင်းခြင်း၊ ခွဲခြမ်းစိတ်ဖြာခြင်းနှင့် လုပ်ဆောင်ခြင်းအတွက် Azure ဝန်ဆောင်မှုဖြစ်သည်။

## M

**Managed Identity**  
Azure ဝန်ဆောင်မှုများကို အခြား Azure ဝန်ဆောင်မှုများနှင့် authentication ပြုလုပ်ရန် အလိုအလျောက်စီမံခန့်ခွဲထားသော identity ကို ပေးသည်။

**Microservices**  
Applications များကို သေးငယ်သော၊ လွတ်လပ်သော ဝန်ဆောင်မှုများအဖြစ် တည်ဆောက်သည့် architectural approach ဖြစ်သည်။

**Monitor**  
Applications နှင့် infrastructure အကြောင်းအရာများကို အပြည့်အစုံ ကြည့်ရှုနိုင်စေရန် Azure ၏ unified monitoring solution ဖြစ်သည်။

## N

**Node.js**  
Server-side applications များကို တည်ဆောက်ရန် Chrome ၏ V8 JavaScript engine အပေါ်တွင် တည်ဆောက်ထားသော JavaScript runtime ဖြစ်သည်။

**npm**  
Node.js အတွက် package manager ဖြစ်ပြီး၊ dependencies နှင့် packages များကို စီမံခန့်ခွဲသည်။

## O

**Output**  
Infrastructure deployment မှ ပြန်လာသည့် values များဖြစ်ပြီး၊ applications သို့မဟုတ် အခြားရင်းမြစ်များက အသုံးပြုနိုင်သည်။

## P

**Package**  
Application code နှင့် dependencies များကို တင်သွင်းရန် ပြင်ဆင်ခြင်းလုပ်ငန်းစဉ်ဖြစ်သည်။

**Parameters**  
Infrastructure templates များသို့ input အဖြစ် ပေးသွင်းသည့် values များဖြစ်သည်။

**PostgreSQL**  
Azure တွင် managed service အဖြစ် ပံ့ပိုးထားသော open-source relational database system ဖြစ်သည်။

**Provisioning**  
Infrastructure templates တွင် သတ်မှတ်ထားသော Azure ရင်းမြစ်များကို ဖန်တီးခြင်းနှင့် စီမံခန့်ခွဲခြင်းလုပ်ငန်းစဉ်ဖြစ်သည်။

## Q

**Quota**  
Azure subscription သို့မဟုတ် region တစ်ခုတွင် ဖန်တီးနိုင်သည့် ရင်းမြစ်အရေအတွက်အပေါ်ရှိ ကန့်သတ်ချက်များဖြစ်သည်။

## R

**Resource Group**  
တူညီသော lifecycle, permissions နှင့် policies များကို မျှဝေသည့် Azure ရင်းမြစ်များအတွက် logical container ဖြစ်သည်။

**Resource Token**  
azd မှ ဖန်တီးထားသော unique string ဖြစ်ပြီး၊ resource names များကို deployments အကြား unique ဖြစ်စေရန် အသုံးပြုသည်။

**REST API**  
HTTP methods များကို အသုံးပြု၍ networked applications များကို ဒီဇိုင်းဆွဲရန်အတွက် architectural style ဖြစ်သည်။

**Rollback**  
Application သို့မဟုတ် infrastructure configuration ၏ ယခင်ဗားရှင်းသို့ ပြန်သွားခြင်းလုပ်ငန်းစဉ်ဖြစ်သည်။

## S

**Service**  
azure.yaml တွင် သတ်မှတ်ထားသော application ၏ component (ဥပမာ - web frontend, API backend, database) ဖြစ်သည်။

**SKU**  
Stock Keeping Unit ဖြစ်သည်။ Azure ရင်းမြစ်များအတွက် service tiers သို့မဟုတ် performance အဆင့်များကို ကိုယ်စားပြုသည်။

**SQL Database**  
Microsoft SQL Server အပေါ်အခြေခံထားသော Azure ၏ managed relational database ဝန်ဆောင်မှုဖြစ်သည်။

**Static Web Apps**  
Source code repositories မှ တည်ဆောက်ခြင်းနှင့် တင်သွင်းခြင်းအတွက် Azure ၏ ဝန်ဆောင်မှုဖြစ်သည်။

**Storage Account**  
Blobs, files, queues နှင့် tables အပါအဝင် data objects များအတွက် cloud storage ကို ပေးသော Azure ဝန်ဆောင်မှုဖြစ်သည်။

**Subscription**  
Resource groups နှင့် resources များကို ထိန်းသိမ်းထားသည့် Azure account container ဖြစ်ပြီး၊ billing နှင့် access management နှင့် ဆက်စပ်သည်။

## T

**Template**  
Application code, infrastructure definitions နှင့် configuration များပါရှိသည့် pre-built project structure ဖြစ်သည်။

**Terraform**  
Azure အပါအဝင် cloud providers များစွာကို ပံ့ပိုးသည့် open-source Infrastructure as Code tool ဖြစ်သည်။

**Traffic Manager**  
Global Azure regions များအကြား traffic ကို ဖြန့်ဝေသည့် Azure ၏ DNS-based traffic load balancer ဖြစ်သည်။

## U

**URI**  
Uniform Resource Identifier ဖြစ်သည်။ ရင်းမြစ်တစ်ခုကို သတ်မှတ်သည့် string ဖြစ်သည်။

**URL**  
Uniform Resource Locator ဖြစ်သည်။ ရင်းမြစ်တစ်ခု၏ တည်နေရာနှင့် ၎င်းကို ရယူရန် နည်းလမ်းကို သတ်မှတ်သည်။

## V

**Virtual Network (VNet)**  
Azure တွင် private networks များအတွက် အခြေခံအဆောက်အအုံဖြစ်ပြီး၊ isolation နှင့် segmentation ကို ပေးသည်။

**VS Code**  
Visual Studio Code ဖြစ်သည်။ Azure နှင့် azd အတွက် အလွန်ကောင်းမွန်သော integration ရှိသည့် လူကြိုက်များသော code editor ဖြစ်သည်။

## W

**Webhook**  
CI/CD pipelines များတွင် အများအားဖြင့် အသုံးပြုသည့်၊ အထူးဖြစ်ရပ်များဖြင့် trigger လုပ်သည့် HTTP callback ဖြစ်သည်။

**What-if**  
Deployment တစ်ခုမှ ပြုလုပ်မည့် ပြောင်းလဲမှုများကို အကောင်အထည်မဖော်မီ ကြိုတင်ပြသသည့် Azure ၏ feature ဖြစ်သည်။

## Y

**YAML**  
YAML Ain't Markup Language ဖြစ်သည်။ azure.yaml ကဲ့သို့သော configuration ဖိုင်များအတွက် လူနားလည်လွယ်သော data serialization စံသတ်မှတ်ချက်ဖြစ်သည်။

## Z

**Zone**  
Redundancy နှင့် high availability ကို ပေးသည့် Azure region အတွင်းရှိ physically separate locations များဖြစ်သည်။

---

## အတိုကောက်များ

| အတိုကောက် | အပြည့်အစုံ | ဖော်ပြချက် |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Identity နှင့် access management ဝန်ဆောင်မှု |
| ACR | Azure Container Registry | Container image registry ဝန်ဆောင်မှု |
| AKS | Azure Kubernetes Service | Managed Kubernetes ဝန်ဆောင်မှု |
| API | Application Programming Interface | Software တည်ဆောက်ရန်အတွက် protocols များ |
| ARM | Azure Resource Manager | Azure ၏ deployment နှင့် management ဝန်ဆောင်မှု |
| CDN | Content Delivery Network | Servers များဖြန့်ဝေထားသော network |
| CI/CD | Continuous Integration/Continuous Deployment | Automated development practices |
| CLI | Command Line Interface | Text-based user interface |
| DNS | Domain Name System | Domain names များကို IP addresses သို့ ပြောင်းလဲသည့် စနစ် |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP ၏ ဘေးကင်းသော ဗားရှင်း |
| IaC | Infrastructure as Code | Infrastructure ကို code ဖြင့် စီမံခန့်ခွဲခြင်း |
|

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာတရ အရင်းအမြစ်အဖြစ် ရှုလို့ရပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူက ဘာသာပြန်မှုကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။