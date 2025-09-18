<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be2a85ad63abe28f2eb71ba3f3800272",
  "translation_date": "2025-09-18T13:26:38+00:00",
  "source_file": "workshop/README.md",
  "language_code": "my"
}
-->
# AZD အတွက် AI Developer Workshop

**Workshop Navigation**
- **📚 သင်တန်းအိမ်**: [AZD For Beginners](../README.md)
- **📖 ဆက်စပ်အခန်းများ**: [အခန်း ၁](../README.md#-chapter-1-foundation--quick-start), [အခန်း ၂](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers), [အခန်း ၅](../README.md#-chapter-5-multi-agent-ai-solutions-advanced) ကိုဖုံးလွှမ်းထားသည်။
- **🛠️ လက်တွေ့လေ့ကျင့်ခန်း**: [AI Workshop Lab](../docs/ai-foundry/ai-workshop-lab.md)
- **🚀 နောက်တစ်ဆင့်များ**: [Workshop Lab Modules](../../../workshop)

Azure Developer CLI (AZD) ကို AI application deployment အာရုံစိုက်ပြီး လေ့လာရန်အတွက် လက်တွေ့လေ့ကျင့်ခန်း workshop မှကြိုဆိုပါသည်။ Workshop သည် AZD အခြေခံမှ စတင်ပြီး ထုတ်လုပ်မှုအဆင့် AI ဖြေရှင်းချက်များ deploy လုပ်နိုင်ရန် ရည်ရွယ်ထားသည်။

## Workshop အကျဉ်းချုပ်

**ကြာမြင့်ချိန်:** ၂-၃ နာရီ  
**အဆင့်:** Beginner မှ Intermediate  
**လိုအပ်ချက်များ:** Azure, command line tools, နှင့် AI အကြောင်းအရာများ၏ အခြေခံအသိပညာ

### သင်လေ့လာရမည့်အရာများ

- **AZD အခြေခံများ**: AZD ဖြင့် Infrastructure as Code ကိုနားလည်ခြင်း
- 🤖 **AI Service Integration**: Azure OpenAI, AI Search နှင့် အခြား AI services များ deploy လုပ်ခြင်း
- **Container Deployment**: AI applications အတွက် Azure Container Apps အသုံးပြုခြင်း
- **လုံခြုံရေးအကောင်းဆုံးအလေ့အကျင့်များ**: Managed Identity နှင့် လုံခြုံရေး configuration များအကောင်းဆုံးအကဲဖြတ်ခြင်း
- **Monitoring & Observability**: AI workloads အတွက် Application Insights ကိုတပ်ဆင်ခြင်း
- **ထုတ်လုပ်မှုပုံစံများ**: အဖွဲ့အစည်းအဆင့် deployment များအတွက် အကောင်းဆုံးနည်းလမ်းများ

## Workshop ဖွဲ့စည်းပုံ

### Module 1: AZD Foundations (၃၀ မိနစ်)
- AZD ကို install နှင့် configure လုပ်ခြင်း
- AZD project structure ကိုနားလည်ခြင်း
- AZD deployment ပထမဆုံးအကြိမ်
- **Lab**: ရိုးရှင်းသော web application တစ်ခုကို deploy လုပ်ပါ

### Module 2: Azure OpenAI Integration (၄၅ မိနစ်)
- Azure OpenAI resources များကိုတပ်ဆင်ခြင်း
- Model deployment နည်းလမ်းများ
- API access နှင့် authentication ကို configure လုပ်ခြင်း
- **Lab**: GPT-4 ဖြင့် chat application တစ်ခုကို deploy လုပ်ပါ

### Module 3: RAG Applications (၄၅ မိနစ်)
- Azure AI Search integration
- Azure Document Intelligence ဖြင့်စာရွက်စာတမ်းများကို process လုပ်ခြင်း
- Vector embeddings နှင့် semantic search
- **Lab**: စာရွက်စာတမ်း Q&A system တစ်ခုကိုတည်ဆောက်ပါ

### Module 4: Production Deployment (၃၀ မိနစ်)
- Container Apps configuration
- Scaling နှင့် performance optimization
- Monitoring နှင့် logging
- **Lab**: Observability ဖြင့် production သို့ deploy လုပ်ပါ

### Module 5: Advanced Patterns (၁၅ မိနစ်)
- Multi-environment deployments
- CI/CD integration
- ကုန်ကျစရိတ် optimization နည်းလမ်းများ
- **Wrap-up**: Production readiness checklist

## လိုအပ်ချက်များ

### လိုအပ်သော Tools

Workshop မတိုင်မီ tools များကို install လုပ်ပါ:

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

1. **Azure Subscription**: [အခမဲ့စာရင်းသွင်းပါ](https://azure.microsoft.com/free/)
2. **Azure OpenAI Access**: [Access တောင်းဆိုပါ](https://aka.ms/oai/access)
3. **လိုအပ်သောခွင့်များ**:
   - Subscription သို့မဟုတ် resource group အပေါ် Contributor role
   - User Access Administrator (RBAC assignments အတွက်)

### လိုအပ်ချက်များကိုစစ်ဆေးပါ

သင့် setup ကိုစစ်ဆေးရန် script ကို run လုပ်ပါ:

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

Module တစ်ခုစီတွင် starter code နှင့် လုပ်ဆောင်ရန်အဆင့်ဆင့်လမ်းညွှန်ချက်များပါဝင်သော လက်တွေ့လေ့ကျင့်ခန်းများပါဝင်သည်:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - AZD deployment ပထမဆုံးအကြိမ်
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Azure OpenAI ဖြင့် chat application
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - AI Search ဖြင့် RAG application
- **[lab-4-production/](../../../workshop/lab-4-production)** - Production deployment patterns
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Advanced deployment scenarios

### Reference Materials

- **[AI Foundry Integration Guide](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Comprehensive integration patterns
- **[AI Model Deployment Guide](../docs/ai-foundry/ai-model-deployment.md)** - Model deployment best practices
- **[Production AI Practices](../docs/ai-foundry/production-ai-practices.md)** - Enterprise deployment patterns
- **[AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md)** - Common issues နှင့် ဖြေရှင်းနည်းများ

### Sample Templates

AI scenarios များအတွက် Quick-start templates:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## စတင်ခြင်း

### Option 1: GitHub Codespaces (အကြံပြုထားသည်)

Workshop ကိုစတင်ရန် အမြန်ဆုံးနည်းလမ်း:

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

3. **Lab 1 ဖြင့်စတင်ပါ:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Option 3: Instructor-Led Workshop

သင်တန်းဆရာဦးဆောင်သော session တက်ရောက်နေပါက:

- 🎥 **Workshop Recording**: [လိုအပ်သောအချိန်တွင်ရရှိနိုင်သည်](https://aka.ms/azd-ai-workshop)
- 💬 **Discord Community**: [Live support အတွက် Join လုပ်ပါ](https://aka.ms/foundry/discord)
- **Workshop Feedback**: [သင့်အတွေ့အကြုံကိုမျှဝေပါ](https://aka.ms/azd-workshop-feedback)

## Workshop Timeline

### Self-Paced Learning (၃ နာရီ)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Instructor-Led Session (၂.၅ နာရီ)

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

Workshop အဆုံးတွင် သင်သည် အောက်ပါအရာများကိုလုပ်ဆောင်နိုင်မည်ဖြစ်သည်:

✅ **AI applications ကို deploy လုပ်ပါ** AZD templates အသုံးပြု၍  
✅ **Azure OpenAI ကို configure လုပ်ပါ** လုံခြုံရေးအကောင်းဆုံးနည်းလမ်းများဖြင့်  
✅ **RAG applications တည်ဆောက်ပါ** Azure AI Search integration ဖြင့်  
✅ **ထုတ်လုပ်မှု patterns ကိုအကောင်အထည်ဖော်ပါ** အဖွဲ့အစည်းအဆင့် AI workloads အတွက်  
✅ **AI application deployments ကိုစောင့်ကြည့်နှင့်ပြဿနာဖြေရှင်းပါ**  
✅ **ကုန်ကျစရိတ် optimization နည်းလမ်းများကိုအသုံးပြုပါ** AI workloads အတွက်  

## Community & Support

### Workshop အတွင်း

- 🙋 **မေးခွန်းများ**: Workshop chat ကိုအသုံးပြုပါ သို့မဟုတ် လက်မြှောက်ပါ
- 🐛 **ပြဿနာများ**: [Troubleshooting guide](../docs/troubleshooting/ai-troubleshooting.md) ကိုကြည့်ပါ
- **အကြံပြုချက်များ**: အခြားပါဝင်သူများနှင့် ရှာဖွေတွေ့ရှိမှုများမျှဝေပါ

### Workshop အပြီး

- 💬 **Discord**: [Azure AI Foundry Community](https://aka.ms/foundry/discord)
- **GitHub Issues**: [Template ပြဿနာများကို report လုပ်ပါ](https://github.com/YOUR_ORG/AZD-for-beginners/issues)
- 📧 **Feedback**: [Workshop evaluation form](https://aka.ms/azd-workshop-feedback)

## နောက်တစ်ဆင့်များ

### ဆက်လက်လေ့လာပါ

1. **Advanced Scenarios**: [multi-region deployments](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment) ကိုလေ့လာပါ
2. **CI/CD Integration**: [GitHub Actions workflows](../docs/deployment/github-actions.md) ကိုတပ်ဆင်ပါ
3. **Custom Templates**: [AZD templates ကိုတည်ဆောက်ပါ](../docs/getting-started/custom-templates.md)

### သင့် Project များတွင်အသုံးပြုပါ

1. **Assessment**: [readiness checklist](./production-readiness-checklist.md) ကိုအသုံးပြုပါ
2. **Templates**: [AI-specific templates](../../../workshop/templates) ဖြင့်စတင်ပါ
3. **Support**: [Azure AI Foundry Discord](https://aka.ms/foundry/discord) ကို join လုပ်ပါ

### သင့်အောင်မြင်မှုကိုမျှဝေပါ

- ⭐ **Repository ကို star လုပ်ပါ** Workshop သင့်ကိုအကျိုးရှိခဲ့လျှင်
- 🐦 **Social media တွင်မျှဝေပါ** #AzureDeveloperCLI #AzureAI ဖြင့်
- 📝 **Blog post ရေးပါ** သင့် AI deployment ခရီးစဉ်အကြောင်း

---

## Workshop Feedback

သင့် feedback သည် Workshop အတွေ့အကြုံကိုတိုးတက်စေပါသည်:

| Aspect | Rating (1-5) | Comments |
|--------|--------------|----------|
| Content Quality | ⭐⭐⭐⭐⭐ | |
| Hands-on Labs | ⭐⭐⭐⭐⭐ | |
| Documentation | ⭐⭐⭐⭐⭐ | |
| Difficulty Level | ⭐⭐⭐⭐⭐ | |
| Overall Experience | ⭐⭐⭐⭐⭐ | |

**Feedback ပေးပါ**: [Workshop Evaluation Form](https://aka.ms/azd-workshop-feedback)

---

**အရင်:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **နောက်တစ်ဆင့်:** [Lab 1: AZD Basics](../../../workshop/lab-1-azd-basics) ကိုစတင်ပါ

**AZD ဖြင့် AI applications တည်ဆောက်ရန် အသင့်ဖြစ်ပါပြီလား?**

[Lab 1: AZD Foundations →](./lab-1-azd-basics/README.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်မှုများတွင် အမှားများ သို့မဟုတ် မတိကျမှုများ ပါဝင်နိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များကို အသုံးပြု၍ ဘာသာပြန်ခြင်းကို အကြံပြုပါသည်။ ဤဘာသာပြန်မှုကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားလွဲမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။