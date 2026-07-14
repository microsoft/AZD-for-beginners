# Kabanata 2: AI-First Development

**📚 Kurso**: [AZD Para sa mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 1-2 oras | **⭐ Antas ng Kahirapan**: Intermediate

---

## Pangkalahatang Pagsusuri

Nakatuon ang kabanatang ito sa pag-deploy ng mga AI-powered na aplikasyon gamit ang Azure Developer CLI at mga Microsoft Foundry na serbisyo. Mula sa simpleng AI chat apps hanggang sa matatalinong ahente na may mga tools.

> **Paalala sa Pagpapatunay (2026-07-13):** Ang daloy ng utos at gabay sa extension sa kabanatang ito ay nirebyu laban sa `azd` `1.27.1` at ang kasalukuyang preview AI agent extension release `azure.ai.agents` `1.0.0-beta.5`. Kung gumagamit ka ng lumang AZD build, mag-update muna bago ipagpatuloy ang mga pagsasanay.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, ikaw ay:
- Magde-deploy ng mga AI na aplikasyon gamit ang mga pre-built na template ng AZD
- Maiintindihan ang integrasyon ng Microsoft Foundry sa AZD
- Makakakumpigur at mapapasadya ang mga AI agent gamit ang mga tools
- Makakadeploy ng mga RAG (Retrieval-Augmented Generation) na aplikasyon

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Integrasyon ng Microsoft Foundry](microsoft-foundry-integration.md) | Ikonekta ang AZD sa mga Foundry na serbisyo | 30 min |
| 2 | [Gabayan sa AI Agents](agents.md) | Mag-deploy ng matatalinong ahente gamit ang mga tools | 45 min |
| 3 | [Deployment ng AI Model](ai-model-deployment.md) | Mag-deploy at mag-configure ng AI models | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Hands-on: Gawing AZD-ready ang iyong AI solusyon | 60 min |

---

## 🚀 Mabilis na Simula

```bash
# Opsyon 1: RAG Chat Application
azd init --template azure-search-openai-demo
azd up

# Opsyon 2: AI Agents
azd init --template get-started-with-ai-agents
azd up

# Opsyon 3: Mabilis na Chat App
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Tampok na AI Templates

| Template | Paglalarawan | Mga Serbisyo |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat na may mga citation | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent na may tools | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Pangunahing AI chat | OpenAI + Container Apps |

---

## 💰 Kamalayan sa Gastos

| Kapaligiran | Tinatayang Buwanang Gastos |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Tip:** Patakbuhin ang `azd down` pagkatapos ng pagsubok upang maiwasan ang singil.

---

## 🔗 Pag-navigate

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 1: Pundasyon](../chapter-01-foundation/README.md) |
| **Susunod** | [Kabanata 3: Konfigurasyon](../chapter-03-configuration/README.md) |
| **Tumalon sa** | [Kabanata 8: Mga Pattern sa Produksyon](../chapter-08-production/README.md) |

---

## 📖 Kaugnay na mga Recursos

- [Pag-troubleshoot ng AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Mga Praktis sa Produksyon ng AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->