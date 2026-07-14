# Kabanata 5: Mga Solusyon ng Multi-Agent AI

**📚 Kurso**: [AZD Para sa mga Nagsisimula](../../README.md) | **⏱️ Haba**: 2-3 oras | **⭐ Kahirapan**: Advanced

---

## Pangkalahatang-ideya

Saklaw ng kabanatang ito ang mga advanced na pattern ng multi-agent architecture, agent orchestration, at production-ready na mga deployment ng AI para sa mga komplikadong senaryo.

> Napatunayan gamit ang `azd 1.27.1` noong Hulyo 2026.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, ikaw ay:
- Maiintindihan ang mga pattern ng multi-agent architecture
- Maide-deploy ang magkakasamang sistema ng AI agents
- Maisasakatuparan ang komunikasyon ng agent-sa-agent
- Makakabuo ng production-ready na multi-agent solutions

---

## 📚 Mga Leksyon

| # | Leksyon | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Mga Pundasyon ng Multi-Agent](multi-agent-basics.md) | Hands-on: i-deploy ang gumaganang multi-agent app gamit ang `azd up` | 45 min |
| 2 | [Mga Pattern ng Koordinasyon](../chapter-06-pre-deployment/coordination-patterns.md) | Mga estratehiya ng agent orchestration (ipagpapatuloy sa Kabanata 6) | 30 min |
| 3 | [Deployment ng ARM Template](../../examples/retail-multiagent-arm-template/README.md) | Halimbawa ng one-click deployment | 30 min |

> **Simulan sa Leksyon 1.** Ito lamang ang ganap na hands-on at maaring i-deploy na leksyon sa kabanatang ito. Matatagpuan naman ang Leksyon 2 sa Kabanata 6 (kahit na ito ay kasabay ng pre-deployment planning), at ang [Retail Multi-Agent Solution](../../examples/retail-scenario.md) ay isang blueprint ng arkitektura—isang disenyo na sanggunian, hindi isang one-command na template.

---

## 🚀 Mabilis na Pagsisimula

```bash
# Opsyon 1: Mag-deploy mula sa isang template
azd init --template agent-openai-python-prompty
azd up

# Opsyon 2: Mag-deploy mula sa isang agent manifest (kailangan ang azure.ai.agents extension)
azd extension install azure.ai.agents
azd ai agent init -m agent-manifest.yaml
azd up
```

> **Alin ang gamitin?** Gamitin ang `azd init --template` upang magsimula mula sa isang gumaganang halimbawa. Gamitin ang `azd ai agent init` kapag mayroon ka nang sariling agent manifest. Tingnan ang [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para sa kumpletong detalye.

---

## 🤖 Multi-Agent Architecture

```mermaid
graph TD
    Orchestrator[Ahente ng Orkestrador<br/>Inaayos ang mga kahilingan, pinamamahalaan ang daloy ng trabaho] --> Customer[Ahente ng Customer<br/>Mga tanong ng gumagamit, mga kagustuhan]
    Orchestrator --> Inventory[Ahente ng Imbentaryo<br/>Mga antas ng stock, mga order]
```

---

## 🎯 Tampok na Solusyon: Retail Multi-Agent

Ipinapakita ng [Retail Multi-Agent Solution](../../examples/retail-scenario.md) ang:

- **Customer Agent**: Humahawak sa pakikipag-ugnayan at mga kagustuhan ng gumagamit
- **Inventory Agent**: Namamahala sa stock at pagproseso ng order
- **Orchestrator**: Naka-coordinate sa pagitan ng mga agent
- **Shared Memory**: Pamamahala ng konteksto sa pagitan ng mga agent

### Mga Serbing Ginamit

| Serbisyo | Layunin |
|---------|---------|
| Microsoft Foundry Models | Pag-unawa ng wika |
| Azure AI Search | Katalogo ng produkto |
| Cosmos DB | Estado at memorya ng agent |
| Container Apps | Pag-host ng agent |
| Application Insights | Pagsubaybay |

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 4: Imprastruktura](../chapter-04-infrastructure/README.md) |
| **Susunod** | [Kabanata 6: Pre-Deployment](../chapter-06-pre-deployment/README.md) |

---

## 📖 Mga Kaugnay na Sanggunian

- [Gabayan sa AI Agents](../chapter-02-ai-development/agents.md)
- [Mga Praktis sa Production AI](../chapter-08-production/production-ai-practices.md)
- [Troubleshooting ng AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->