# Kabanata 2: Pag-unlad na Pinangungunahan ng AI

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 1-2 oras | **⭐ Antas ng Kahirapan**: Katamtaman

---

## Pangkalahatang-ideya

Ang kabanatang ito ay nakatuon sa pag-deploy ng mga aplikasyong pinapagana ng AI gamit ang Azure Developer CLI at mga serbisyo ng Microsoft Foundry. Mula sa mga simpleng AI chat app hanggang sa mga intelihenteng ahente na may mga tool.

## Mga Layunin sa Pagkatuto

By completing this chapter, you will:
- Mag-deploy ng mga application ng AI gamit ang mga paunang-gawang template ng AZD
- Maunawaan ang integrasyon ng Microsoft Foundry sa AZD
- I-configure at i-customize ang mga AI agent gamit ang mga tool
- I-deploy ang mga aplikasyon ng RAG (Retrieval-Augmented Generation)

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Integrasyon ng Microsoft Foundry](microsoft-foundry-integration.md) | Ikonekta ang AZD sa mga serbisyo ng Foundry | 30 min |
| 2 | [Gabay sa Mga AI Agents](agents.md) | Mag-deploy ng mga intelihenteng agent na may mga tool | 45 min |
| 3 | [Pag-deploy ng Modelo ng AI](ai-model-deployment.md) | Mag-deploy at i-configure ang mga modelo ng AI | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Hands-on: Gawing handa sa AZD ang iyong solusyon sa AI | 60 min |

---

## 🚀 Mabilis na Simula

```bash
# Opsyon 1: RAG Chat na Aplikasyon
azd init --template azure-search-openai-demo
azd up

# Opsyon 2: Mga ahente ng AI
azd init --template get-started-with-ai-agents
azd up

# Opsyon 3: Mabilis na Aplikasyon ng Chat
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Mga Tampok na Template ng AI

| Template | Paglalarawan | Mga Serbisyo |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat na may mga sanggunian | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent na may mga tool | AI Agent Service |
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

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 1: Foundation](../chapter-01-foundation/README.md) |
| **Susunod** | [Kabanata 3: Configuration](../chapter-03-configuration/README.md) |
| **Tumalon sa** | [Kabanata 8: Mga Pattern sa Produksyon](../chapter-08-production/README.md) |

---

## 📖 Kaugnay na Mga Mapagkukunan

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Mga Praktika sa Produksyon para sa AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI na pagsasalin na [Co-op Translator] (https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami na maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi eksaktong pagsasalin. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->