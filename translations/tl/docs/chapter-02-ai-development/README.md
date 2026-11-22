# Kabanata 2: AI-First Development

**📚 Kurso**: [AZD Para sa mga Baguhan](../../README.md) | **⏱️ Tagal**: 4-5 oras kabilang ang workshop | **⭐ Kahirapan**: Panggitna

---

## Pangkalahatang-ideya

Nakatuon ang kabanatang ito sa pag-deploy ng mga AI-powered na aplikasyon gamit ang Azure Developer CLI at Microsoft Foundry services. Mula sa simpleng AI chat apps hanggang sa matatalinong ahente na may mga tool.

> **Foundry GA update (2026-11-09):** Ang `microsoft.foundry` 1.0 bundle ay [generally available](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Gumamit ng `azd >= 1.37.0`; nananatiling hiwalay ang mga pagsusuri sa pag-install. Tinatalakay ng [hosted-agent walkthrough](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) ang lokal na pagsusuri ng Agent Inspector at malayuang pag-deploy ng code. Ito ay isang pagsusuri ng dokumentasyon, hindi isang live na pag-validate ng pag-deploy; ang mga opsyonal na preview na tampok ay may sarili pa ring katayuan.

## Mga Layunin sa Pagkatuto

Sa pagtapos ng kabanatang ito, magagawa mong:
- Mag-deploy ng mga AI na aplikasyon gamit ang mga pre-built na AZD na template
- Maunawaan ang integrasyon ng Microsoft Foundry sa AZD
- Mag-install ng GA bundle at subukan ang hosted agent nang lokal bago ideploy ang source nito sa Foundry
- Suriin ang `azure.yaml`, mga evaluation assets, at paglilinis ng proyekto sa pagitan ng bago at muling ginagamit
- I-configure at i-customize ang mga AI agent na may mga tool
- Mag-deploy ng RAG (Retrieval-Augmented Generation) na mga aplikasyon

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | GA bundle, hosted-agent lokal-sa-cloud na workflow, at mga pagsusuri | 60 min |
| 2 | [AI Agents Guide](agents.md) | Mag-deploy ng mga matatalinong agent na may mga tool | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Mag-deploy at mag-configure ng mga AI model | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Hands-on: Tuklasin ang isang template at planuhin ang iyong conversion | 2-3 oras |

---

## 🚀 Mabilisang Panimula

Pumili ng isang opsyon sa isang bagong walang laman na direktoryo. Ang nakadugtong na `.` ay nag-i-initialize ng kasalukuyang direktoryo; kung hindi, maaaring gumawa ang AZD ng subdirectory nang hindi binabago ang working directory ng iyong shell.

Para sa **GA hosted-agent code-deployment path**, simulan sa [guided walkthrough](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Kinakailangan nito ng AZD 1.37.0+, kasalukuyang uv, Python 3.13+, Foundry permissions, at model quota. Ang mga buo na template ng aplikasyon sa ibaba ay mga alternatibo, hindi kinakailangan para sa walkthrough na iyon.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 Tampok na AI Template

| Template | Paglalarawan | Mga Serbisyo |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat na may mga citation | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent na may mga tool | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Pangunahing AI chat | OpenAI + Container Apps |

---

## 💰 Kamalayan sa Gastos

Ito ay mga halimbawa ng saklaw, hindi mga quote o limitasyon; maaaring lumampas ang trapiko ng model, Search/compute SKUs, rehiyon, at mga opsyonal na tampok sa mga ito. Suriin ang kasalukuyang gabay sa pagpepresyo ng iyong piniling sample bago mag-provision.

| Kapaligiran | Tinatayang Buwanang Gastos |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Paglilinis:** Suriin ang `azd down` bago mag-confirm: para sa bagong likhang Foundry project, binubura nito ang resource group at lahat ng nasa loob nito. Para sa muling nagamit na Foundry project, iniiwan nito ang proyekto at mga resource ng ahente sa lugar; sundin ang [walkthrough cleanup guidance](microsoft-foundry-integration.md#7-clean-up-deliberately) upang tanggalin nang hiwalay ang mga hindi nais na resource.

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 1: Foundation](../chapter-01-foundation/README.md) |
| **Susunod** | [Kabanata 3: Configuration](../chapter-03-configuration/README.md) |
| **Laktawan sa** | [Kabanata 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 Kaugnay na Mga Sanggunian

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->