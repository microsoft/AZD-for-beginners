# Kabanata 8: Mga Pattern sa Produksyon at Enterprise

**📚 Kurso**: [AZD para sa mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 2-3 oras | **⭐ Kompleksidad**: Mataas na Antas

---

## Pangkalahatang-ideya

Tinatalakay ng kabanatang ito ang mga pattern ng deployment na handa para sa enterprise, pagpapatibay ng seguridad, pagmamanman, at pag-optimize ng gastos para sa mga produksiyon na workload ng AI.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, makakaya mong:
- Mag-deploy ng mga aplikasyon na matatag sa maraming rehiyon
- Ipatupad ang mga pattern ng seguridad para sa enterprise
- I-configure ang kumprehensibong pagmamanman
- I-optimize ang gastos sa malaking sukat
- Mag-set up ng mga CI/CD pipeline gamit ang AZD

---

## 📚 Mga Leksyon

| # | Aralin | Deskripsyon | Oras |
|---|--------|-------------|------|
| 1 | [Mga Kasanayan sa Produksyon ng AI](production-ai-practices.md) | Mga pattern ng deployment para sa enterprise | 90 min |

---

## 🚀 Checklist para sa Produksyon

- [ ] Deployment sa maraming rehiyon para sa pagiging matatag
- [ ] Managed identity para sa authentication (walang mga key)
- [ ] Application Insights para sa pagmamanman
- [ ] Mga budget ng gastos at mga alerto na naka-configure
- [ ] Pinagana ang pag-scan ng seguridad
- [ ] Integrasyon ng CI/CD pipeline
- [ ] Plano para sa disaster recovery

---

## 🏗️ Mga Pattern ng Arkitektura

### Pattern 1: Microservices AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   API Gateway   │───▶│   AI Service    │───▶│   Azure OpenAI  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │
         ▼                      ▼
┌─────────────────┐    ┌─────────────────┐
│   Auth Service  │    │   Data Store    │
└─────────────────┘    └─────────────────┘
```

### Pattern 2: Event-Driven AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Pinakamahusay na Kasanayan sa Seguridad

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Pag-optimize ng Gastos

| Estratehiya | Pag-iipon |
|----------|---------|
| I-scale hanggang zero (Container Apps) | 60-80% |
| Gamitin ang consumption tiers para sa dev | 50-70% |
| Naka-iskedyul na pag-scale | 30-50% |
| Nakatalagang kapasidad | 20-40% |

```bash
# Itakda ang mga alerto sa badyet
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Pagsasaayos ng Pagmomonitor

```bash
# I-stream ang mga log
azd monitor --logs

# Suriin ang Application Insights
azd monitor

# Tingnan ang mga metric
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 7: Pag-troubleshoot](../chapter-07-troubleshooting/README.md) |
| **Kumpletong Kurso** | [Tahanan ng Kurso](../../README.md) |

---

## 📖 Mga Kaugnay na Mapagkukunan

- [Gabay sa Mga AI Agents](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Mga Solusyon na Multi-Agent](../chapter-05-multi-agent/README.md)
- [Halimbawa ng Microservices](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Ang dokumentong ito ay isinalin gamit ang serbisyong AI sa pagsasalin [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong sanggunian. Para sa mga kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasaling ginawa ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->