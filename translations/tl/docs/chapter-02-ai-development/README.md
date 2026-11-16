# Kabanata 2: Pag-develop na AI-First

**📚 Kurso**: [AZD Para sa Mga Baguhan](../../README.md) | **⏱️ Tagal**: 4-5 na oras kabilang ang workshop | **⭐ Antas ng Kahirapan**: Intermediate

---

## Pangkalahatang-ideya

Nakatuon ang kabanatang ito sa pag-deploy ng mga AI-powered na aplikasyon gamit ang Azure Developer CLI at Microsoft Foundry services. Mula sa mga simpleng AI chat apps hanggang sa mga intelligent agents na may mga tool.

> **Review ng release (2026-11-04):** Sinuri ang gabay ng AI CLI laban sa nailathalang `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, at `azure.ai.evaluations` `1.0.0-beta.2` na dokumentasyon/source. Gamitin ang `azd >= 1.37.0` para sa pinagsamang workflow. Ngayon ay gumagamit ang mga pagsusuri ng hiwalay na `azd ai eval` namespace; tingnan ang [mga pagbabago sa release at gabay sa migrasyon](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Ito ay hindi pagsusuri ng live deployment.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, ikaw ay:
- Magde-deploy ng mga AI application gamit ang mga pre-built na AZD template
- Maiintindihan ang integrasyon ng Microsoft Foundry sa AZD
- Mai-configure at ma-customize ang mga AI agents na may mga tool
- Makakapag-deploy ng RAG (Retrieval-Augmented Generation) na mga aplikasyon

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Integrasyon ng Microsoft Foundry](microsoft-foundry-integration.md) | Ikonekta ang AZD sa Foundry services | 30 min |
| 2 | [Gabay sa AI Agents](agents.md) | Mag-deploy ng mga intelligent agents na may mga tool | 45 min |
| 3 | [Pag-deploy ng AI Model](ai-model-deployment.md) | Mag-deploy at mag-configure ng AI models | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Hands-on: Suriin ang isang template at planuhin ang iyong conversion | 2-3 oras |

---

## 🚀 Mabilis na Pagsisimula

Pumili ng isang opsyon sa isang bagong walang laman na direktoryo. Ang trailing na `.` ay nag-i-initialize ng kasalukuyang direktoryo; kung hindi, maaaring gumawa ang AZD ng subdirectory nang hindi binabago ang working directory ng iyong shell.

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

## 🤖 Tampok na mga AI Template

| Template | Paglalarawan | Mga Serbisyo |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat na may mga citation | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent na may mga tool | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Pangunahing AI chat | OpenAI + Container Apps |

---

## 💰 Kamalayan sa Gastos

Ito ay mga ilustratibong saklaw lamang, hindi mga quote o limitasyon; ang trapiko ng modelo, Search/compute SKUs, rehiyon, at opsyonal na mga tampok ay maaaring lumampas dito. Suriin ang kasalukuyang gabay sa pagpepresyo ng iyong piniling sample bago mag-provision.

| Kapaligiran | Tinatayang Gastos Buwanang |
|-------------|--------------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Tip:** Patakbuhin ang `azd down` pagkatapos ng pagsusuri upang maiwasan ang mga singil.

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|----------|
| **Nakaraan** | [Kabanata 1: Pundasyon](../chapter-01-foundation/README.md) |
| **Susunod** | [Kabanata 3: Konfigurasyon](../chapter-03-configuration/README.md) |
| **Talaktakan sa** | [Kabanata 8: Mga Pattern ng Produksyon](../chapter-08-production/README.md) |

---

## 📖 May Kaugnayang Mga Mapagkukunan

- [Pag-aayos ng Problema sa AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Mga Praktis sa Produksyon ng AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->