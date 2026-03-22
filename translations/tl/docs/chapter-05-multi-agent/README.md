# Kabanata 5: Mga Solusyon ng Multi-Agent AI

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 2-3 oras | **⭐ Kompleksidad**: Mataas na Antas

---

## Pangkalahatang-ideya

Tinatalakay ng kabanatang ito ang mga advanced na pattern ng arkitektura ng multi-agent, orchestrasyon ng agent, at mga production-ready na pag-deploy ng AI para sa mga kumplikadong senaryo.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, makakamit mo ang mga sumusunod:
- Maunawaan ang mga pattern ng arkitektura ng multi-agent
- I-deploy ang magkakaugnay na mga sistema ng AI agent
- Magpatupad ng komunikasyon agent-sa-agent
- Buuin ang mga multi-agent na solusyon na handa na para sa produksyon

---

## 📚 Mga Aralin

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Solusyon ng Multi-Agent para sa Retail](../../examples/retail-scenario.md) | Kompletong gabay sa pagpapatupad | 90 min |
| 2 | [Mga Pattern ng Koordinasyon](../chapter-06-pre-deployment/coordination-patterns.md) | Mga estratehiya ng orchestrasyon ng agent | 30 min |
| 3 | [Pag-deploy ng ARM Template](../../examples/retail-multiagent-arm-template/README.md) | Isang-klik na pag-deploy | 30 min |

---

## 🚀 Mabilis na Pagsisimula

```bash
# Opsyon 1: I-deploy mula sa isang template
azd init --template agent-openai-python-prompty
azd up

# Opsyon 2: I-deploy mula sa agent manifest (nangangailangan ng extension na azure.ai.agents)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **Aling pamamaraan?** Gamitin ang `azd init --template` upang magsimula mula sa isang gumaganang sample. Gamitin ang `azd ai agent init` kapag mayroon kang sariling agent manifest. Tingnan ang [Sanggunian ng AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para sa buong detalye.

---

## 🤖 Arkitektura ng Multi-Agent

```mermaid
graph TD
    Orchestrator[Ahente ng Orkestrador<br/>Nagro-route ng mga kahilingan, pinangangasiwaan ang daloy ng trabaho] --> Customer[Ahente ng Kustomer<br/>Mga tanong ng gumagamit, mga kagustuhan]
    Orchestrator --> Inventory[Ahente ng Imbentaryo<br/>Mga antas ng stock, mga order]
```
---

## 🎯 Tampok na Solusyon: Multi-Agent para sa Retail

Ipinapakita ng [Solusyon ng Multi-Agent para sa Retail](../../examples/retail-scenario.md):

- **Customer Agent**: Humahawak ng pakikipag-ugnayan sa gumagamit at mga kagustuhan
- **Inventory Agent**: Namamahala ng imbentaryo at pagproseso ng mga order
- **Orchestrator**: Nag-uugnay sa pagitan ng mga agent
- **Shared Memory**: Pamamahala ng konteksto sa pagitan ng mga agent

### Mga Serbiyong Ginamit

| Serbisyo | Layunin |
|---------|---------|
| Microsoft Foundry Models | Pag-unawa sa wika |
| Azure AI Search | Katalogo ng produkto |
| Cosmos DB | Estado at memorya ng agent |
| Container Apps | Pagho-host ng agent |
| Application Insights | Pagmamanman |

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 4: Imprastraktura](../chapter-04-infrastructure/README.md) |
| **Susunod** | [Kabanata 6: Bago Pag-deploy](../chapter-06-pre-deployment/README.md) |

---

## 📖 Mga Kaugnay na Mapagkukunan

- [Gabay sa mga AI Agent](../chapter-02-ai-development/agents.md)
- [Mga Praktika sa Produksyon ng AI](../chapter-08-production/production-ai-practices.md)
- [Pag-troubleshoot ng AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI na pagsasalin [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa kawastuhan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling isinasagawa ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->