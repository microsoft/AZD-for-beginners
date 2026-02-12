# အဘိဓာန် - Azure နှင့် AZD ဆိုင်ရာ အပြောအဆိုများ

**အခန်းအားလုံးအတွက် ကိုးကားချက်**
- **📚 သင်ကြားမှု မူလစာမျက်နှာ**: [AZD အစပြုသူများအတွက်](../README.md)
- **📖 အခြေခံများ သင်ယူရန်**: [အခန်း ၁: AZD အခြေခံများ](../docs/getting-started/azd-basics.md)
- **🤖 AI သက်ဆိုင်ရာ စကားလုံးများ**: [အခန်း ၂: AI-ဦးစားပေး ဖွံ့ဖြိုးရေး](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## နိဒါန်း

ဒီကျယ်ပြန့်သော အဘိဓာန်မှာ Azure Developer CLI နှင့် Azure မိုးလုံလေလုံ ဖွံ့ဖြိုးရေးတွင် အသုံးများသော 용어များ၊ အယူအဆများနှင့် အတိုကောက်အသုံးများအတွက် အဓိပ္ပါယ်များကို ဖော်ပြထားပါသည်။ နည်းပညာစာတမ်းများကို နားလည်ရန်၊ ပြသာနာဖြေရှင်းရာတွင် အသုံးပြုရန်နှင့် azd ပရောဂျက်များနှင့် Azure ဝန်ဆောင်မှုများအကြောင်း ထိရောက်စွာ ဆက်သွယ်ရန် မရှိမျှမလွယ်ကူသည့် ကိုးကားစာအုပ်ဖြစ်ပါသည်။

## သင်ယူရမည့် အဓိက ရည်မှန်းချက်များ

ဒီအဘိဓာန်ကို အသုံးပြုခြင်းဖြင့် သင်သည်-
- Azure Developer CLI ၏ အဓိက 용어များနှင့် အယူအဆများကို နားလည်နိုင်မည်
- Azure မိုးလုံလေလုံ ဖွံ့ဖြိုးရေး၏ ဝေါဟာရနှင့် နည်းပညာဆိုင်ရာ 용어များကို ကျွမ်းကျင်နိုင်မည်
- Infrastructure as Code နှင့် တပ်ဆင်မှု (deployment) 용어များကို ထိရောက်စွာ ကိုးကားနိုင်မည်
- Azure ဝန်ဆောင်မှုအမည်များ၊ အတိုကောက်များနှင့် ၎င်းတို့၏ အဓိပ္ပါယ်များကို နားလည်နိုင်မည်
- ပြဿနာရှာဖွေရေးနှင့် ဒီဘပ်များ (debugging) အတွက် သက်ဆိုင်သော 용어များ၏ အဓိပ္ပါယ်ကို ကြည့်ရှုနိုင်မည်
- Azure အင်ဂျင်နီယာရေးနှင့် ဖွံ့ဖြိုးရေး ဆိုင်ရာ အဆင့်မြင့် အယူအဆများကို သင်ယူနိုင်မည်

## သင်ယူပြီးရမည့် ရလဒ်များ

ဒီအဘိဓာန်အား အကြိမ်ကြိမ် ကိုးကားခြင်းဖြင့် သင်သည်-
- Azure Developer CLI ၏ သတ်မှတ်ထားသော 용어များကို သေချာစွာ အသုံးပြု၍ ထိရောက်စွာ ဆက်သွယ်နိုင်မည်
- နည်းပညာစာတမ်းများနှင့် error မက်ဆေ့များကို ပိုမိုရှင်းလင်းစွာ နားလည်နိုင်မည်
- Azure ဝန်ဆောင်မှုများနှင့် အယူအဆများကို ယုံကြည်စိတ်ချစွာ လမ်းကြောင်းရှာနိုင်မည်
- အပြဿနာများကို သက်ဆိုင်ရာ နည်းပညာ အသုံးအနှုန်းများဖြင့် ဖြေရှင်းနိုင်မည်
- အသင်းအစည်းများ၏ ဆွေးနွေးပွဲများတွင် မှန်ကန်သော နည်းပညာစကားလုံးဖြင့် ပါဝင်ဆောင်ရွက်နိုင်မည်
- သင်၏ Azure မိုးလုံလေလုံ ဖွံ့ဖြိုးရေး ဗဟုသုတကို စနစ်တကျ တိုးချဲ့နိုင်မည်

## A

**ARM Template**  
Azure Resource Manager template။ Azure resources များကို ဖော်ပြ၍ တာဝန်ပေးထားသော JSON-အခြေခံ Infrastructure as Code ဖော်မတ်။

**App Service**  
web applications, REST APIs, နှင့် mobile backends များကို အုတ်မြစ်စီမံခန့်ခွဲရန်မလိုဘဲ တင်ပြနိုင်ရန် Azure ၏ platform-as-a-service (PaaS) ဝန်ဆောင်မှု။

**Application Insights**  
application performance monitoring (APM) ဝန်ဆောင်မှုဖြစ်ပြီး application ၏ အလုပ်ဆောင်မှု၊ ရရှိနိုင်မှုနှင့် အသုံးပြုမှုအပေါ် သေချာသိရှိစေတတ်သည်။

**Azure CLI**  
Azure resources များကို စီမံရန် အသုံးပြုသော command-line interface။ azd မှ authentication နှင့် အချို့ လုပ်ဆောင်ချက်များအတွက် အသုံးပြုသည်။

**Azure Developer CLI (azd)**  
Developer ကို ဦးတည်ထားသော command-line ကိရိယာတစ်ခုဖြစ်ပြီး templates နှင့် Infrastructure as Code များကို အသုံးပြု၍ Azure သို့ application တည်ဆောက်ခြင်းနှင့် တင်သွင်းခြင်း ပြုလုပ်ရာကို မြန်ဆန်စေသည်။

**azure.yaml**  
azd ပရောဂျက်တစ်ခုအတွက် service များ၊ အကြမ်းဖျင်း အင်ဖရာစတက်ချာ (infrastructure) နှင့် deployment hooks များကို သတ်မှတ်ထားသော အဓိက configuration ဖိုင်။

**Azure Resource Manager (ARM)**  
Azure ၏ deployment နှင့် စီမံခန့်ခွဲရေး ဝန်ဆောင်မှုဖြစ်ပြီး resources များကို ဖန်တီးခြင်း၊ Update ပြုလုပ်ခြင်းနှင့် ဖျက်ခြင်းတို့အတွက် management အလွှာကို ပေးသည်။

## B

**Bicep**  
Microsoft က ဖန်တီးထားသည့် domain-specific language (DSL) တစ်ခုဖြစ်ပြီး Azure resources များကို တပ်ဆင်ရာတွင် အသုံးပြုသည်။ ARM templates ထက် ရိုးရှင်းသည့် စာလုံးပေါင်းပုံစံကို ပေးပြီး ARM သို့ ကုဒ်ကို ကုဒ်ကွန်ပိုင်လ် ပြောင်းပေးသည်။

**Build**  
source code ကို ကွန်ပိုင်လ်လုပ်ခြင်း၊ လိုအပ်သော အပစ္စယများကို 설치ခြင်းနှင့် applications များကို တင်သွင်းရန် ပြင်ဆင်ခြင်း။

**Blue-Green Deployment**  
downtime နှင့် အန္တရာယ်လျော့ချရန် တူညီသည့် production ပတ်ဝန်းကျင်နှစ်ခု (blue နှင့် green) ကို အသုံးပြုသည့် deployment မျဉ်းစည်းမှု။

## C

**Container Apps**  
ကြီးမားသော အင်ဖရာစထီခုမစီမံရပဲ containerized applications များကို လည်ပတ်စေသော Azure ၏ serverless container ဝန်ဆောင်မှု။

**CI/CD**  
Continuous Integration/Continuous Deployment။ code ပြင်ဆင်မှုများကို ပေါင်းစည်းခြင်းနှင့် applications များကို အလိုအလျောက် တင်သွင်းခြင်းအတွက် အလိုအလျောက်လုပ်ငန်းစဉ်များ။

**Cosmos DB**  
Azure ၏ အပြည်ပြည်ဆိုင်ရာ ဖြန့်ချိထားသည့် multi-model database ဝန်ဆောင်မှုဖြစ်ပြီး throughput၊ latency၊ availability နှင့် consistency အတွက် ပြည့်စုံသော SLA များကို ပေးသည်။

**Configuration**  
application အပြုအမူနှင့် တင်သွင်းမှု ရွေးချယ်စရာများကို ထိန်းချုပ်သည့် settings နှင့် parameters များ။

## D

**Deployment**  
applications နှင့် ၎င်းတို့၏ သက်ဆိုင်ရာ အပစ္စည်းများကို တင်သွင်း၍ target အင်ဖရာစထ်ချာပေါ်တွင် ပြင်ဆင်ခြင်း။

**Docker**  
containerization နည်းပညာကို အသုံးပြု၍ applications များ ဖန်တီး၊ ပို့ဆောင်နှင့် လည်ပတ်စေသည့် ပလက်ဖောင်း။

**Dockerfile**  
Docker container image တစ်ခုတည်ဆောက်ရန် အချက်အလက်များကို ထည့်သွင်းထားသည့် စာသားဖိုင်။

## E

**Environment**  
သင်၏ application ၏ သတ်မှတ်ထားသည့် အထူးသတ်မှတ်ရသော တင်သွင်းရမည့် ပတ်ဝန်းကျင် (ဥပမာ development, staging, production)။

**Environment Variables**  
applications များ runtime တွင် ဝင်ရောက်သုံးနိုင်သည့် key-value အဖြစ် သိမ်းဆည်းထားသော configuration သတင်းအချက်အလက်များ။

**Endpoint**  
application သို့မဟုတ် service တစ်ခုကို ဝင်ရောက်လက်လှမ်းမီနိုင်သည့် URL သို့မဟုတ် network လိပ်စာ။

## F

**Function App**  
အချက်အလက်များဖြင့် ဖြစ်ပေါ်လာသည့် အဖြစ်များအပေါ် event-driven code များကို လည်ပတ်စေသည့် Azure ၏ serverless compute ဝန်ဆောင်မှု။

## G

**GitHub Actions**  
GitHub repository များနှင့် ပေါင်းစည်းထားသည့် CI/CD ပလက်ဖောင်းဖြစ်ပြီး workflow များကို အလိုအလျောက်လုပ်ဆောင်ရန် တိုက်ရိုက်ထောက်ပံ့ပေးသည်။

**Git**  
source code တွင် ပြောင်းလဲမှုများကို လေ့လာခြင်းနှင့် ထိန်းသိမ်းရာတွင် အသုံးပြုသော distributed version control system။

## H

**Hooks**  
deployment lifecycle ၏ အချို့အချိန်များတွင် (preprovision, postprovision, predeploy, postdeploy) လည်ပတ်သည့် custom script များ သို့မဟုတ် command များ။

**Host**  
application ကို တင်သွင်းမည့် Azure service အမျိုးအစား (ဥပမာ appservice, containerapp, function)။

## I

**Infrastructure as Code (IaC)**  
လက်ဖြင့်မလုပ်ဘဲ code ဖြင့် အင်ဖရာစတက်ချာကို သတ်မှတ်ခြင်းနှင့် စီမံခန့်ခွဲခြင်း၏ လေ့လာမှု။

**Init**  
အသစ်ထိ စတင် azd ပရောဂျက်ကို အခြေခံ template မှ initialize ပြုလုပ်သော လုပ်ငန်းစဉ်။

## J

**JSON**  
JavaScript Object Notation။ configuration ဖိုင်များနှင့် API ပြန်လည်ပေးပို့မှုများတွင် မကြာခဏအသုံးပြုသော ဒေတာ အလဲအလှယ် ဖော်မတ်။

**JWT**  
JSON Web Token။ မျိုးစုံပါတီများအကြား အချက်အလက်များကို လုံခြုံစွာ ပို့ဆောင်ရန် အသုံးပြုသော မြေပုံပုံစံ။

## K

**Key Vault**  
secrets, keys, နှင့် certificates များကို လုံခြုံစိတ်ချစွာ သိမ်းဆည်း၍ စီမံခန့်ခွဲရန် Azure ၏ ဝန်ဆောင်မှု။

**Kusto Query Language (KQL)**  
Azure Monitor, Application Insights နှင့် အခြား Azure ဝန်ဆောင်မှုများတွင် ဒေတာ विश्लेषण ပြုလုပ်ရန် အသုံးပြုသော query ဘာသာစကား။

## L

**Load Balancer**  
ဝင်ရောက်လာသော network traffic ကို အများကြီးရှိသော servers သို့ သို့မဟုတ် instances များအကြား ဖြန့်ချိပေးသည့် ဝန်ဆောင်မှု။

**Log Analytics**  
cloud နှင့် on-premises ပတ်ဝန်းကျင်များထံမှ telemetry ဒေတာများကို စုဆောင်း၊ 分析နှင့် အလုပ်ဆောင်ရန် အသုံးပြုသော Azure ၏ ဝန်ဆောင်မှု။

## M

**Managed Identity**  
အခြား Azure ဝန်ဆောင်မှုများသို့ authentication ပြုလုပ်ရာတွင် Azure services များအား အလိုအလျောက် စီမံပေးသည့် identity အင်္ဂါရပ်။

**Microservices**  
application များကို သေးငယ်၍ လွတ်လပ်သော service မျိုးများအဖြစ် ဖွဲ့စည်းထားသည့် architecture နည်းလမ်း။

**Monitor**  
applications နှင့် အင်ဖရာစထ်ချာတစ်ကြောင်းလုံးပေါ်တွင် observability ပြည့်စုံစေသည့် Azure ၏ တစ်စုတစ်စည်း monitoring ဖြေရှင်းချက်။

## N

**Node.js**  
Chrome ၏ V8 JavaScript engine အပေါ် တည်ဆောက်ထားသည့် JavaScript runtime ဖြစ်ပြီး server-side applications တည်ဆောက်ရန် အသုံးပြုသည်။

**npm**  
Node.js အတွက် package manager ဖြစ်ပြီး dependencies နှင့် packages များကို စီမံပေးသည်။

## O

**Output**  
infrastructure တပ်ဆင်မှုမှ ပြန်လည်ထုတ်ပေးသည့် တန်ဖိုးများဖြစ်ပြီး applications သို့မဟုတ် အခြား resources များက အသုံးချနိုင်သည်။

## P

**Package**  
application code နှင့် dependencies များကို တင်သွင်းရန် ပြင်ဆင်ခြင်းလုပ်ငန်းစဉ်။

**Parameters**  
deployment များကို ကိုယ့်လိုချင်သည့်ပုံစံစိတ်ကြိုက် ပြုလုပ်နိုင်ရန် infrastructure templates အထဲသို့ ပေးပို့သည့် input တန်ဖိုးများ။

**PostgreSQL**  
opensource relational database system အဖြစ် Azure မှ managed service အဖြစ် ထောက်ပံ့ပေးသော ဒေတာဘေ့စ်စနစ်။

**Provisioning**  
infrastructure templates တွင် သတ်မှတ်ထားသည့် Azure resources များကို ဖန်တီး၍ ပြင်ဆင်ပေးသည့် လုပ်ငန်းစဉ်။

## Q

**Quota**  
Azure subscription သို့မဟုတ် region တစ်ခုတွင် ဖန်တီးနိုင်သည့် resources အရေအတွက်ပေါ်ရှိ ကန့်သတ်ချက်များ။

## R

**Resource Group**  
တူညီသည့် lifecycle၊ permissions နှင့် မူဝါဒများကို ဝေမျှထားသော Azure resources များအတွက် ရုပ်ပိုင်းဆိုင်ရာ ထုပ်စု (logical container)။

**Resource Token**  
resource အမည်များအား deployment အတွင်း တင်သွင်းရာတွင် ထူးခြားပြီး ရယူနိုင်စေရန် azd မှ ထုတ်ပေးသော unique string။

**REST API**  
HTTP method များကို အသုံးပြု၍ networked applications များကိုဒီဇိုင်းဆွဲရာတွင် အသုံးပြုသည့် နည်းလမ်း။

**Rollback**  
application သို့မဟုတ် infrastructure configuration ၏ ယခင်ဗားရှင်းသို့ ပြန်သွားရန် ပြုလုပ်သည့် လုပ်ငန်းစဉ်။

## S

**Service**  
azure.yaml ထဲတွင် သတ်မှတ်ထားသည့် သင်၏ application ၏ အပိုင်းအစတစ်ခု (ဥပမာ web frontend, API backend, database)။

**SKU**  
Stock Keeping Unit။ Azure resources များအတွက် ဝန်ဆောင်မှု အဆင့်များ သို့မဟုတ် လုပ်ဆောင်နိုင်မှုပိုင်းကို ကိုယ်စားပြုသော အမျိုးအစား။

**SQL Database**  
Microsoft SQL Server အခြေခံထားသည့် Azure ၏ managed relational database ဝန်ဆောင်မှု။

**Static Web Apps**  
source code repository များမှ ပြန်ထုတ်၍ full-stack web applications များကို တည်ဆောက်သည့် Azure ဝန်ဆောင်မှု။

**Storage Account**  
blobs, files, queues, နှင့် tables အပါအဝင် ဒေတာ objects များအတွက် cloud storage ကို ပေးသည့် Azure ဝန်ဆောင်မှု။

**Subscription**  
resource groups နှင့် resources များကို ပါဝင်ထားသည့် Azure အကောင့် သိုက်ကွန်တာ၊ billing နှင့် access စီမံခန့်ခွဲမှုနှင့် ပတ်သက်သော အရာ။

## T

**Template**  
application code, infrastructure အက်ဥပဒေ (definitions), နှင့် common scenarios များအတွက် configuration များ ပါရှိသည့် pre-built project ဖွဲ့စည်းမှု။

**Terraform**  
Azure အပါအဝင် cloud providers များစွာအတွက် ထောက်ပံ့ပေးသော open-source Infrastructure as Code ကိရိယာ။

**Traffic Manager**  
DNS-အခြေပြု traffic load balancer ဖြစ်ပြီး global Azure regions များအကြား traffic ကို ဖြန့်ချိပေးသည်။

## U

**URI**  
Uniform Resource Identifier။ ဗွီသည် resource တစ်ခုကို ရှာဖွေဖော်အောင် သတ်မှတ်သည့် string။

**URL**  
Uniform Resource Locator။ resource တစ်ခုရှိရာနေရာနှင့် ထို resource ကို မည်သို့ ရယူရမည်ကို ဖော်ပြသည့် URI ၏ အမျိုးအစား။

## V

**Virtual Network (VNet)**  
Azure တွင် ပုဂ္ဂလိက network များအတွက် အခြေခံတည်ဆောက်ပစ္စည်းဖြစ်ပြီး isolation နှင့် segmentation ကို ပေးစွမ်းသည်။

**VS Code**  
Visual Studio Code။ Azure နှင့် azd ဖြင့် ကောင်းစွာ ပေါင်းစည်းနိုင်သည့် လူကြိုက်များသော code editor။

## W

**Webhook**  
သတ်မှတ်ထားသော events များဖြင့် triggered ဖြစ်သည့် HTTP callback တစ်ခုဖြစ်ကာ CI/CD pipeline များတွင် ခေတ်သုံးအားဖြင့် အသုံးပြုသည်။

**What-if**  
deployment တစ်ခုက ဘာပြောင်းလဲမည်နည်း ကို အကောင်အထည်မဖော်ဘဲ ပြသပေးသည့် Azure အင်္ဂါရပ်။

## Y

**YAML**  
YAML Ain't Markup Language။ azure.yaml ကဲ့သို့ configuration ဖိုင်များအတွက် အသုံးပြုသော လူဖတ်ရှုရလွယ်သော ဒေတာ serialization စံနှုန်း။

## Z

**Zone**  
Azure region အတွင်းရှိ ရုပ်ပိုင်းစိတ်ဖြာထားသော တည်နေရာများဖြစ်ပြီး redundancy နှင့် high availability ကို ပံ့ပိုးပေးသည်။

---

## ပုံမှန် အသုံးပြုသော အတိုကောက်များ

| အတိုကောက် | Full Form | ဖော်ပြချက် |
|---------|-----------|-------------|
| AAD | Azure Active Directory | မှတ်ပုံတင်နှင့် ဝင်ခွင့် စီမံခန့်ခွဲမှု ဝန်ဆောင်မှု |
| ACR | Azure Container Registry | Container image registry ဝန်ဆောင်မှု |
| AKS | Azure Kubernetes Service | Managed Kubernetes ဝန်ဆောင်မှု |
| API | Application Programming Interface | ဆော့ဖ်ဝဲ တည်ဆောက်ရာ protocol အစု |
| ARM | Azure Resource Manager | Azure ၏ deployment နှင့် စီမံခန့်ခွဲရေး ဝန်ဆောင်မှု |
| CDN | Content Delivery Network | ဖိုင်မျိုးစုံကို ဖြန့်ချိရန် ဝန်ဆောင်မှုကွန်ယက် |
| CI/CD | Continuous Integration/Continuous Deployment | အလိုအလျောက် ဖွံ့ဖြိုးရေး လုပ်ထုံးလုပ်နည်းများ |
| CLI | Command Line Interface | စာထဲအခြေခံ အသုံးပြုသူ အင်တာဖေ့စ် |
| DNS | Domain Name System | domain နာမည်များကို IP လိပ်စာများသို့ ဘာသာပြန်တည်ဆောက်ရေးစနစ် |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP ၏ လုံခြုံသည့် ဗားရှင်း |
| IaC | Infrastructure as Code | infrastructure ကို code ဖြင့် စီမံခြင်း |
| JSON | JavaScript Object Notation | ဒေတာ အလဲအလှယ် ဖော်မတ် |
| JWT | JSON Web Token | လုံခြုံစွာ အချက်အလက် ပို့ဆောင်ရန် token ဖော်မတ် |
| KQL | Kusto Query Language | Azure ဒေတာ ဝန်ဆောင်မှုများအတွက် query ဘာသာစကား |
| RBAC | Role-Based Access Control | အသုံးပြုသူ ရာထူးအပေါ် အခြေခံ၍ ဝင်ခွင့်ထိန်းချုပ်မှု |
| REST | Representational State Transfer | web services များအတွက် architectural ပုံစံ |
| SDK | Software Development Kit | ဖွံ့ဖြိုးရေး ကိရိယာစုစည်းမှု |
| SLA | Service Level Agreement | ဝန်ဆောင်မှု ရရှိနိုင်မှု/စွမ်းဆောင်ရည် အပေါ် ကတိ |
| SQL | Structured Query Language | relational databases များကို စီမံရန် ဘာသာစကား |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | 암호화 protocols |
| URI | Uniform Resource Identifier | resource တစ်ခုကို သတ်မှတ်ပေးသည့် string |
| URL | Uniform Resource Locator | resource ရှိရာနေရာကို ဖော်ပြသည့် URI ၏ အမျိုးအစား |
| VM | Virtual Machine | ကွန်ပျူတာစနစ်တစ်ခု ကို ဧကရာဇ်ပုံစံ နဲ့ သရုပ်ဖော်ထားသော အရာ |
| VNet | Virtual Network | Azure တွင် အသုံးပြုသော ပုဂ္ဂလိက network |
| YAML | YAML Ain't Markup Language | ဒေတာ serialization စံနှုန်း |

---

## Azure ဝန်ဆောင်မှု အမည် မြှုပ်နှံချက်များ

| Common Name | Official Azure Service Name | azd Host Type |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## ပတ်သက်ရာ အခြေအနေအလိုက် 용어များ

### ဖွံ့ဖြိုးရေး 용어များ
- **Hot Reload**: တိုးတက်ရေးအချိန်တွင် application ကို ပိတ်မထားပဲ အလိုအလျောက် အပ်ဒိတ်လုပ်ခြင်း
- **Build Pipeline**: code များကို တည်ဆောက်၍ စမ်းသပ်ရန် အလိုအလျောက် လုပ်ငန်းစဉ်
- **Deployment Slot**: App Service အတွင်းရှိ staging ပတ်ဝန်းကျင်
- **Environment Parity**: development, staging, နှင့် production ပတ်ဝန်းကျင်များကို ဆင်တူရှိအောင် ထိန်းသိမ်းခြင်း

### လုံခြုံရေး 용어များ
- **Managed Identity**: အလိုအလျောက် credential စီမံခန့်ခွဲမှုကို ပေးသည့် Azure အင်္ဂါရပ်
- **Key Vault**: secrets, keys, နှင့် certificates များအတွက် လုံခြုံသိမ်းဆည်းရေး
- **RBAC**: Azure resources များအတွက် role-based ဝင်ရောက်ခွင့် ထိန်းချုပ်မှု
- **Network Security Group**: network traffic ကို ထိန်းချုပ်ရန် virtual firewall

### စောင့်ကြည့်ရေး 용어များ
- **Telemetry**: အတိုင်းအတာများနှင့် ဒေတာများကို အလိုအလျှောက် စုဆောင်းခြင်း
- **Application Performance Monitoring (APM)**: software အလုပ်ဆောင်မှုကို စောင့်ကြည့်ခြင်း
- **Log Analytics**: log ဒေတာများကို စုဆောင်း၍ 分析 ပြုလုပ်ရန် ဝန်ဆောင်မှု
- **Alert Rules**: မျှော်လင့်ချက်များ သို့မဟုတ် အခြေအနေများအပေါ် အလိုအလျောက် သတင်းပို့ခြင်း

### တင်သွင်းမှု 용어များ
- **Blue-Green Deployment**: downtime တဖြည်းဖြည်းလျော့ချသည့် deployment မျဉ်းစည်းမှု
- **Canary Deployment**: အသုံးပြုသူ တစ်စိတ်တစ်ပိုင်းသို့ အစကြုံစောင့်ကြည့်ဖြင့် အလျော့အစား မိတ်ဆက်ခြင်း
- **Rolling Update**: application instances များကို တစိတ်တစိတ် အစားထိုးသည့် နည်းလမ်း
- **Rollback**: ယခင် application ဗားရှင်းသို့ ပြန်လှည့်ခြင်း

---

**အသုံးပြုရန် အကြံပြုချက်**: ဒီအဘိဓာန်ထဲမှ တစ်ခုခုကို မြန်မြန်ရှာဖွေရန် `Ctrl+F` ကို အသုံးပြုပါ။ 용어များကို လိုအပ်သည့်နေရာများတွင် ဆက်သွယ်ဖော်ပြထားပါသည်။

---

**Navigation**
- **Previous Lesson**: [Cheat Sheet](cheat-sheet.md)
- **Next Lesson**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
အသိပေးချက်:
ဤစာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ဖြင့် ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးပမ်းပါသော်လည်း အလိုအလျောက် ဘာသာပြန်ချက်များတွင် အမှားများ သို့မဟုတ် တိကျမှုမရှိမှုများ ပါဝင်နိုင်ကြောင်း သတိပြုပါ။ မူရင်းစာတမ်းကို မူရင်းဘာသာဖြင့် အာဏာပိုင် ရင်းမြစ်အဖြစ် ယူဆသင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ချက်ကို အသုံးပြုမှ ဖြစ်ပေါ်လာနိုင်သည့် နားမလည်မှုများ သို့မဟုတ် မှားယွင်းစွာ နားလည်မှုများအတွက် ကျွန်ုပ်တို့ တာဝန်မယူပါ။
<!-- CO-OP TRANSLATOR DISCLAIMER END -->