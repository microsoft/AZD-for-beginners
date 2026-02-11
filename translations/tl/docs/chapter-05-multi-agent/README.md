# Kabanata 5: Mga Solusyon ng Multi-Agent AI

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 2-3 oras | **⭐ Antas**: Advanced

---

## Pangkalahatang-ideya

Saklaw ng kabanatang ito ang mga advanced na pattern ng arkitektura ng multi-agent, orchestration ng mga ahente, at production-ready na mga deployment ng AI para sa mga kumplikadong senaryo.

## Mga Layunin sa Pagkatuto

Sa pagtapos ng kabanatang ito, maiintindihan mo:
- Mga pattern ng arkitektura ng multi-agent
- Mag-deploy ng mga pinagsamang sistema ng AI agent
- Magpatupad ng komunikasyon mula ahente-sa-ahente
- Bumuo ng production-ready na mga solusyon ng multi-agent

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Retail Multi-Agent na Solusyon](../../examples/retail-scenario.md) | Kumpletong walkthrough ng implementasyon | 90 min |
| 2 | [Mga Pattern ng Koordinasyon](../chapter-06-pre-deployment/coordination-patterns.md) | Mga estratehiya ng orkestrasyon ng mga ahente | 30 min |
| 3 | [Pag-deploy ng ARM Template](../../examples/retail-multiagent-arm-template/README.md) | Isang-click na pag-deploy | 30 min |

---

## 🚀 Mabilisang Pagsisimula

```bash
# I-deploy ang multi-agent na solusyon para sa retail
cd examples/retail-multiagent-arm-template
./deploy.sh

# O gamitin ang template nang direkta
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Arkitektura ng Multi-Ahente

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 Tampok na Solusyon: Retail Multi-Agent

Ipinapakita ng [Retail Multi-Agent na Solusyon](../../examples/retail-scenario.md):

- **Customer Agent**: Humahawak ng pakikipag-ugnayan sa gumagamit at mga kagustuhan
- **Inventory Agent**: Namamahala ng stock at pagproseso ng mga order
- **Orchestrator**: Nakikipag-coordinate sa pagitan ng mga ahente
- **Shared Memory**: Pamamahala ng konteksto sa pagitan ng mga ahente

### Mga Serbisyong Ginamit

| Serbisyo | Layunin |
|---------|---------|
| Azure OpenAI | Pag-unawa sa wika |
| Azure AI Search | Katalogo ng produkto |
| Cosmos DB | Estado at memorya ng ahente |
| Container Apps | Pagho-host ng mga ahente |
| Application Insights | Pagsubaybay |

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 4: Imprastruktura](../chapter-04-infrastructure/README.md) |
| **Susunod** | [Kabanata 6: Bago ang Pag-deploy](../chapter-06-pre-deployment/README.md) |

---

## 📖 Kaugnay na Mga Mapagkukunan

- [Gabay sa AI Agents](../chapter-02-ai-development/agents.md)
- [Mga Praktika sa Produksyon ng AI](../chapter-08-production/production-ai-practices.md)
- [Pag-troubleshoot ng AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Ang dokumentong ito ay isinalin gamit ang AI na serbisyo sa pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpakan. Ang orihinal na dokumento sa katutubong wika nito ang dapat ituring na pinakapinagkakatiwalaang sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng isang tao. Hindi kami mananagot sa anumang hindi pagkakaintindihan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->