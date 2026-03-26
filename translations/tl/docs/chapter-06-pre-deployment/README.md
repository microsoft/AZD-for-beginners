# Kabanata 6: Plano at Pagpapatunay Bago ang Deployment

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 1 oras | **⭐ Antas ng Kahirapan**: Katamtaman

---

## Pangkalahatang-ideya

Sinasaklaw ng kabanatang ito ang mahahalagang hakbang sa pagpaplano at pagpapatunay bago i-deploy ang iyong aplikasyon. Matutunan kung paano maiwasan ang magastos na pagkakamali sa pamamagitan ng tamang pagpaplano ng kapasidad, pagpili ng SKU, at mga preflight check.

## Mga Layunin sa Pagkatuto

Pagkatapos makumpleto ang kabanatang ito, magagawa mo:
- Magsagawa ng mga preflight check bago mag-deploy
- Magplano ng kapasidad at tantiyahin ang mga pangangailangan sa mga mapagkukunan
- Pumili ng angkop na SKUs para sa pag-optimize ng gastos
- I-configure ang Application Insights para sa pagsubaybay
- Unawain ang mga pattern ng koordinasyon ng koponan

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Mga Preflight Check](preflight-checks.md) | I-validate ang konfigurasyon bago mag-deploy | 15 min |
| 2 | [Pagpaplano ng Kapasidad](capacity-planning.md) | Tantiyahin ang mga pangangailangan sa mga mapagkukunan | 20 min |
| 3 | [Pagpili ng SKU](sku-selection.md) | Pumili ng angkop na mga antas ng presyo | 15 min |
| 4 | [Application Insights](application-insights.md) | I-configure ang pagsubaybay | 20 min |
| 5 | [Mga Pattern ng Koordinasyon](coordination-patterns.md) | Mga workflow ng deployment ng koponan | 15 min |

---

## 🚀 Mabilis na Simula

```bash
# Suriin ang mga quota ng subskripsyon
az vm list-usage --location eastus --output table

# I-preview ang deployment (walang lilikha ng mga resource)
azd provision --preview

# I-validate ang syntax ng Bicep
az bicep build --file infra/main.bicep

# Suriin ang konfigurasyon ng kapaligiran
azd env get-values
```

---

## ☑️ Checklist Bago Mag-deploy

### Bago `azd provision`

- [ ] Quota na beripikado para sa rehiyon
- [ ] Napiling angkop ang mga SKU
- [ ] Nasuri ang pagtataya ng gastos
- [ ] Magkakatugma ang patakaran sa pagbibigay ng pangalan
- [ ] Naka-configure ang Seguridad/RBAC

### Bago `azd deploy`

- [ ] Nai-set ang mga environment variable
- [ ] Nasa Key Vault ang mga secret
- [ ] Na-verify ang mga connection string
- [ ] Naka-configure ang mga health check

---

## 💰 Gabay sa Pagpili ng SKU

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Previous** | [Kabanata 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Next** | [Kabanata 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

---

## 📖 Mga Kaugnay na Mapagkukunan

- [Gabay sa Konfigurasyon](../chapter-03-configuration/configuration.md)
- [Gabay sa Pag-deploy](../chapter-04-infrastructure/deployment-guide.md)
- [Karaniwang Mga Isyu](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI para sa pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o di-katumpakan. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring bilang opisyal na pinagkukunan. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->