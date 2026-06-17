# Kabanata 2: Pag-unlad na Nakatuon sa AI

**📚 Kurso**: [AZD For Beginners](../../README.md) | **⏱️ Tagal**: 1-2 oras | **⭐ Kahirapan**: Katamtaman

---

## Overview

Nakatuon ang kabanatang ito sa pag-deploy ng mga application na pinapagana ng AI gamit ang Azure Developer CLI at Microsoft Foundry services. Mula sa simpleng AI chat apps hanggang sa intelihenteng mga agent na may mga tool.

> **Validation note (2026-06-15):** Ang command flow at extension guidance sa kabanatang ito ay nirepaso laban sa `azd` `1.25.6` at ang kasalukuyang preview AI agent extension release `azure.ai.agents` `0.1.40-preview`. Kung nasa mas lumang AZD build ka, i-update muna at saka magpatuloy sa mga ehersisyo.

## Mga Layunin sa Pagkatuto

Sa pamamagitan ng pagkumpleto ng kabanatang ito, magagawa mo:
- Mag-deploy ng mga AI application gamit ang mga pre-built AZD template
- Maunawaan ang integrasyon ng Microsoft Foundry sa AZD
- I-configure at i-customize ang mga AI agent na may mga tool
- Mag-deploy ng mga RAG (Retrieval-Augmented Generation) na aplikasyon

---

## 📚 Mga Aralin

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Ikonekta ang AZD sa mga serbisyo ng Foundry | 30 min |
| 2 | [AI Agents Guide](agents.md) | I-deploy ang mga intelihenteng agent na may mga tool | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | I-deploy at i-configure ang mga modelo ng AI | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktikal: Gawing handa sa AZD ang iyong solusyon sa AI | 60 min |

---

## 🚀 Mabilis na Pagsisimula

```bash
# Opsyon 1: Aplikasyong Chat na RAG
azd init --template azure-search-openai-demo
azd up

# Opsyon 2: Mga Ahente ng AI
azd init --template get-started-with-ai-agents
azd up

# Opsyon 3: Mabilis na Aplikasyong Chat
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Tampok na AI Templates

| Template | Deskripsyon | Serbisyo |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat na may mga sanggunian | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent na may mga tool | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Pangunahing AI chat | OpenAI + Container Apps |

---

## 💰 Kamalayan sa Gastos

| Kapaligiran | Tinatayang Buwanang Gastos |
|-------------|----------------------------|
| Pag-unlad | $80-150 |
| Paghahanda | $150-300 |
| Produksyon | $300-3,500+ |

**Tip:** Patakbuhin ang `azd down` pagkatapos mag-test upang maiwasan ang singil.

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 1: Pundasyon](../chapter-01-foundation/README.md) |
| **Susunod** | [Kabanata 3: Konfigurasyon](../chapter-03-configuration/README.md) |
| **Laktawan sa** | [Kabanata 8: Mga Pattern sa Produksyon](../chapter-08-production/README.md) |

---

## 📖 Mga Kaugnay na Mapagkukunan

- [Pag-troubleshoot ng AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Mga Kasanayan sa AI para sa Produksyon](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->