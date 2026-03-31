# Kabanata 2: Pag-unlad na Pinangunahan ng AI

**📚 Kurso**: [AZD For Beginners](../../README.md) | **⏱️ Tagal**: 1-2 oras | **⭐ Kompleksidad**: Katamtaman

---

## Pangkalahatang-ideya

Itong kabanata ay nakatuon sa pag-deploy ng mga AI-powered na aplikasyon gamit ang Azure Developer CLI at mga serbisyo ng Microsoft Foundry. Mula sa simpleng AI chat apps hanggang sa mga intelligent agents na may mga tool.

> **Tala sa Pagpapatunay (2026-03-25):** The command flow and extension guidance in this chapter were reviewed against `azd` `1.23.12` and the current preview AI agent extension release `azure.ai.agents` `0.1.18-preview`. If you are on an older AZD build, update first and then continue with the exercises.

## Mga Layunin sa Pagkatuto

Sa pagkumpleto ng kabanatang ito, magagawa mo:
- I-deploy ang mga aplikasyon ng AI gamit ang mga pre-built na template ng AZD
- Maunawaan ang integrasyon ng Microsoft Foundry sa AZD
- I-configure at i-customize ang mga AI agent gamit ang mga tool
- Mag-deploy ng mga aplikasyon ng RAG (Retrieval-Augmented Generation)

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Ikonekta ang AZD sa mga serbisyo ng Foundry | 30 min |
| 2 | [AI Agents Guide](agents.md) | Mag-deploy ng mga intelligent agent na may mga tool | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | I-deploy at i-configure ang mga modelo ng AI | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Hands-on: Gawing AZD-ready ang iyong AI solution | 60 min |

---

## 🚀 Mabilis na Simula

```bash
# Opsyon 1: RAG na Aplikasyon ng Chat
azd init --template azure-search-openai-demo
azd up

# Opsyon 2: Mga Ahente ng AI
azd init --template get-started-with-ai-agents
azd up

# Opsyon 3: Mabilis na Aplikasyon ng Chat
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Tampok na Mga Template ng AI

| Template | Paglalarawan | Mga Serbisyo |
|----------|-------------|--------------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat na may mga sanggunian | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent na may mga tool | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Pangunahing AI chat | OpenAI + Container Apps |

---

## 💰 Pagkamulat sa Gastos

| Kapaligiran | Tinatayang Buwanang Gastos |
|-------------|---------------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Tip:** Patakbuhin ang `azd down` pagkatapos ng pagsubok upang maiwasan ang singil.

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 1: Pundasyon](../chapter-01-foundation/README.md) |
| **Susunod** | [Kabanata 3: Konfigurasyon](../chapter-03-configuration/README.md) |
| **Laktawan sa** | [Kabanata 8: Mga Pattern sa Produksyon](../chapter-08-production/README.md) |

---

## 📖 Kaugnay na Mga Sanggunian

- [Pag-troubleshoot ng AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Mga Praktis ng AI sa Produksyon](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang serbisyong AI para sa pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ay dapat ituring na awtoritatibong sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->