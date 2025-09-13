<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T23:33:14+00:00",
  "source_file": "workshop/README.md",
  "language_code": "my"
}
-->
# AZD for AI Developers Workshop

**အရင်:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **နောက်တစ်ခု:** [Workshop Lab Modules](../../../workshop)

Azure Developer CLI (AZD) ကို အသုံးပြု၍ AI application များကို deploy လုပ်ခြင်းအပေါ် အထူးအာရုံစိုက်ထားသော လက်တွေ့ workshop သို့ ကြိုဆိုပါသည်။ ဒီ workshop သည် AZD အခြေခံမှ စ၍ production-ready AI solution များကို deploy လုပ်နိုင်ရန်အထိ သင်ကြားပေးရန် ရည်ရွယ်ထားပါသည်။

## Workshop အကျဉ်းချုပ်

**ကြာမြင့်ချိန်:** 2-3 နာရီ  
**အဆင့်:** အခြေခံမှ အလယ်အလတ်  
**လိုအပ်ချက်များ:** Azure, command line tools, နှင့် AI အကြောင်းအရာများအပေါ် အခြေခံအသိရှိခြင်း

### သင်လေ့လာရမည့်အရာများ

- **AZD အခြေခံများ**: AZD ဖြင့် Infrastructure as Code ကို နားလည်ခြင်း  
- 🤖 **AI Service Integration**: Azure OpenAI, AI Search နှင့် အခြား AI service များကို deploy လုပ်ခြင်း  
- **Container Deployment**: AI application များအတွက် Azure Container Apps ကို အသုံးပြုခြင်း  
- **လုံခြုံရေးအကောင်းဆုံးနည်းလမ်းများ**: Managed Identity နှင့် လုံခြုံသော configuration များကို အကောင်အထည်ဖော်ခြင်း  
- **Monitoring & Observability**: AI workload များအတွက် Application Insights ကို စနစ်တကျတပ်ဆင်ခြင်း  
- **Production Patterns**: စီးပွားရေးလုပ်ငန်းအဆင့် deployment နည်းလမ်းများ  

## Workshop ဖွဲ့စည်းပုံ

### Module 1: AZD အခြေခံများ (30 မိနစ်)
- AZD ကို install လုပ်ခြင်းနှင့် configure လုပ်ခြင်း  
- AZD project ဖွဲ့စည်းပုံကို နားလည်ခြင်း  
- AZD deployment ပထမဆုံးအကြိမ်  
- **Lab**: ရိုးရှင်းသော web application ကို deploy လုပ်ခြင်း  

### Module 2: Azure OpenAI Integration (45 မိနစ်)
- Azure OpenAI resource များကို စနစ်တကျတပ်ဆင်ခြင်း  
- Model deployment နည်းလမ်းများ  
- API access နှင့် authentication ကို configure လုပ်ခြင်း  
- **Lab**: GPT-4 ဖြင့် chat application ကို deploy လုပ်ခြင်း  

### Module 3: RAG Applications (45 မိနစ်)
- Azure AI Search integration  
- Azure Document Intelligence ဖြင့် စာရွက်စာတမ်းများကို အလုပ်လုပ်စေခြင်း  
- Vector embedding နှင့် semantic search  
- **Lab**: စာရွက်စာတမ်း Q&A စနစ်တစ်ခုကို တည်ဆောက်ခြင်း  

### Module 4: Production Deployment (30 မိနစ်)
- Container Apps configuration  
- Scaling နှင့် performance ကို အကောင်းဆုံးဖြစ်စေရန် ပြုပြင်ခြင်း  
- Monitoring နှင့် logging  
- **Lab**: Observability ဖြင့် production သို့ deploy လုပ်ခြင်း  

### Module 5: Advanced Patterns (15 မိနစ်)
- Multi-environment deployment  
- CI/CD integration  
- ကုန်ကျစရိတ်ကို လျှော့ချရန် နည်းလမ်းများ  
- **Wrap-up**: Production readiness checklist  

## လိုအပ်ချက်များ

### လိုအပ်သော Tools

Workshop မတိုင်မီ ဒီ tools များကို install လုပ်ပါ:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Azure Account Setup

1. **Azure Subscription**: [အခမဲ့ စတင်ရန်](https://azure.microsoft.com/free/)  
2. **Azure OpenAI Access**: [Access ကို တောင်းဆိုရန်](https://aka.ms/oai/access)  
3. **လိုအပ်သော အခွင့်အရေးများ**:
   - Subscription သို့မဟုတ် resource group အပေါ် Contributor role  
   - User Access Administrator (RBAC assignment များအတွက်)  

### လိုအပ်ချက်များကို စစ်ဆေးရန်

ဒီ script ကို run လုပ်ပါ:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## Workshop Materials

### Lab Exercises

Module တစ်ခုစီတွင် starter code နှင့် လုပ်ဆောင်ရန်အဆင့်ဆင့်လမ်းညွှန်ချက်များပါဝင်သော လက်တွေ့ lab များပါဝင်သည်:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - AZD deployment ပထမဆုံးအကြိမ်  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Azure OpenAI ဖြင့် chat application  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - AI Search ဖြင့် RAG application  
- **[lab-4-production/](../../../workshop/lab-4-production)** - Production deployment patterns  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Advanced deployment scenarios  

### Reference Materials

- **[AI Foundry Integration Guide](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Comprehensive integration patterns  
- **[AI Model Deployment Guide](../docs/ai-foundry/ai-model-deployment.md)** - Model deployment အကောင်းဆုံးနည်းလမ်းများ  
- **[Production AI Practices](../docs/ai-foundry/production-ai-practices.md)** - စီးပွားရေးလုပ်ငန်းအဆင့် deployment patterns  
- **[AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md)** - အများဆုံးဖြစ်သော ပြဿနာများနှင့် ဖြေရှင်းနည်းများ  

### Sample Templates

AI scenario များအတွက် Quick-start templates:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## စတင်ရန်

### Option 1: GitHub Codespaces (အကြံပြုထားသည်)

Workshop ကို စတင်ရန် အမြန်ဆုံးနည်းလမ်း:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Option 2: Local Development

1. **Workshop repository ကို clone လုပ်ပါ:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Azure သို့ login လုပ်ပါ:**
```bash
az login
azd auth login
```

3. **Lab 1 ဖြင့် စတင်ပါ:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Option 3: Instructor-Led Workshop

သင်တန်းဆရာအနေနှင့် လမ်းညွှန် session တက်ရောက်နေပါက:

- 🎥 **Workshop Recording**: [လိုအပ်သောအချိန်တွင် ကြည့်နိုင်ပါသည်](https://aka.ms/azd-ai-workshop)  
- 💬 **Discord Community**: [Live support ရရန် Join လုပ်ပါ](https://aka.ms/foundry/discord)  
- **Workshop Feedback**: [သင့်အတွေ့အကြုံကို မျှဝေပါ](https://aka.ms/azd-workshop-feedback)  

## Workshop Timeline

### Self-Paced Learning (3 နာရီ)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Instructor-Led Session (2.5 နာရီ)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## အောင်မြင်မှုအချက်များ

Workshop ပြီးဆုံးချိန်တွင် သင်သည် အောက်ပါအရာများကို လုပ်နိုင်မည်ဖြစ်သည်:

✅ **AI application များကို deploy လုပ်ခြင်း** AZD templates အသုံးပြု၍  
✅ **Azure OpenAI service များကို configure လုပ်ခြင်း** လုံခြုံရေးအပြည့်အဝဖြင့်  
✅ **RAG application များကို တည်ဆောက်ခြင်း** Azure AI Search integration ဖြင့်  
✅ **Production patterns များကို အကောင်အထည်ဖော်ခြင်း** စီးပွားရေးလုပ်ငန်းအဆင့် AI workload များအတွက်  
✅ **AI application deployment များကို စစ်ဆေးခြင်းနှင့် ပြဿနာများကို ဖြေရှင်းခြင်း**  
✅ **AI workload များအတွက် ကုန်ကျစရိတ်ကို လျှော့ချခြင်း** နည်းလမ်းများကို အသုံးပြုခြင်း  

## Community & Support

### Workshop အတွင်း

- 🙋 **မေးခွန်းများ**: Workshop chat ကို အသုံးပြုပါ သို့မဟုတ် လက်မြှောက်ပါ  
- 🐛 **ပြဿနာများ**: [Troubleshooting guide](../docs/troubleshooting/ai-troubleshooting.md) ကို ကြည့်ပါ  
- **Tips**: အခြားပါဝင်သူများနှင့် သင့်ရဲ့ ရှာဖွေတွေ့ရှိမှုများကို မျှဝေပါ  

### Workshop ပြီးဆုံးပြီးနောက်

- 💬 **Discord**: [Azure AI Foundry Community](https://aka.ms/foundry/discord)  
- **GitHub Issues**: [Template issue များကို Report လုပ်ပါ](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **Feedback**: [Workshop evaluation form](https://aka.ms/azd-workshop-feedback)  

## နောက်တစ်ဆင့်များ

### ဆက်လက်လေ့လာရန်

1. **Advanced Scenarios**: [Multi-region deployments](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment) ကို လေ့လာပါ  
2. **CI/CD Integration**: [GitHub Actions workflows](../docs/deployment/github-actions.md) ကို စနစ်တကျတပ်ဆင်ပါ  
3. **Custom Templates**: [AZD templates ကို ကိုယ်တိုင်ဖန်တီးပါ](../docs/getting-started/custom-templates.md)  

### သင့်ရဲ့ Project များတွင် အသုံးချရန်

1. **Assessment**: [Readiness checklist](./production-readiness-checklist.md) ကို အသုံးပြုပါ  
2. **Templates**: [AI-specific templates](../../../workshop/templates) ဖြင့် စတင်ပါ  
3. **Support**: [Azure AI Foundry Discord](https://aka.ms/foundry/discord) ကို Join လုပ်ပါ  

### သင့်ရဲ့ အောင်မြင်မှုကို မျှဝေပါ

- ⭐ **Repository ကို Star လုပ်ပါ** Workshop က သင့်ကို အကျိုးရှိခဲ့လျှင်  
- 🐦 **Social media တွင် မျှဝေပါ** #AzureDeveloperCLI #AzureAI ဖြင့်  
- 📝 **Blog post ရေးပါ** သင့်ရဲ့ AI deployment ခရီးစဉ်အကြောင်း  

---

## Workshop Feedback

သင့်ရဲ့ feedback သည် Workshop အတွေ့အကြုံကို တိုးတက်စေရန် ကူညီပါသည်:

| Aspect | Rating (1-5) | Comments |
|--------|--------------|----------|
| Content Quality | ⭐⭐⭐⭐⭐ | |
| Hands-on Labs | ⭐⭐⭐⭐⭐ | |
| Documentation | ⭐⭐⭐⭐⭐ | |
| Difficulty Level | ⭐⭐⭐⭐⭐ | |
| Overall Experience | ⭐⭐⭐⭐⭐ | |

**Feedback ပေးပါ**: [Workshop Evaluation Form](https://aka.ms/azd-workshop-feedback)

---

**အရင်:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **နောက်တစ်ခု:** [Lab 1: AZD Basics](../../../workshop/lab-1-azd-basics)

**AZD ဖြင့် AI application များကို တည်ဆောက်ရန် စတင်ရန် အသင့်ဖြစ်ပါပြီလား?**

[Lab 1: AZD Foundations →](./lab-1-azd-basics/README.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ခြင်းတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါရှိနိုင်သည်ကို သတိပြုပါ။ မူရင်းစာရွက်စာတမ်းကို ၎င်း၏ မူရင်းဘာသာစကားဖြင့် အာဏာတရားရှိသော အရင်းအမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များမှ ပရော်ဖက်ရှင်နယ် ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအမှားများ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။