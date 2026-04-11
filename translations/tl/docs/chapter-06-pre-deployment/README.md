# Kabanata 6: Pagpaplano at Pagpapatunay Bago Mag-deploy

**📚 Kurso**: [AZD For Beginners](../../README.md) | **⏱️ Tagal**: 1 oras | **⭐ Antas ng Kahirapan**: Katamtaman

---

## Pangkalahatang-ideya

Saklaw ng kabanatang ito ang mahahalagang hakbang sa pagpaplano at pagpapatunay bago i-deploy ang iyong aplikasyon. Matutunan kung paano iwasan ang magastos na pagkakamali sa pamamagitan ng wastong capacity planning, pagpili ng SKU, at preflight checks.

> Napatunayan laban sa `azd 1.23.12` noong Marso 2026.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, magagawa mong:
- Patakbuhin ang preflight checks bago mag-deploy
- Magplano ng kapasidad at tantyahin ang mga pangangailangan ng resources
- Pumili ng angkop na SKUs para sa pag-optimize ng gastos
- I-configure ang Application Insights para sa pagsubaybay
- Maunawaan ang mga pattern ng koordinasyon ng koponan

---

## 📚 Mga Aralin

| # | Aralin | Deskripsyon | Oras |
|---|--------|-------------|------|
| 1 | [Pagsusuri bago mag-deploy](preflight-checks.md) | Patunayan ang konfigurasyon bago ang pag-deploy | 15 min |
| 2 | [Pagpaplano ng Kapasidad](capacity-planning.md) | Tantyahin ang mga pangangailangan sa resources | 20 min |
| 3 | [Pagpili ng SKU](sku-selection.md) | Pumili ng angkop na antas ng presyo | 15 min |
| 4 | [Application Insights](application-insights.md) | I-configure ang pagsubaybay | 20 min |
| 5 | [Mga Pattern ng Koordinasyon](coordination-patterns.md) | Mga workflow ng koponan para sa pag-deploy | 15 min |

---

## 🚀 Mabilis na Pagsisimula

```bash
# Suriin ang mga quota ng subscription
az vm list-usage --location eastus --output table

# I-preview ang deployment (hindi lilikha ng anumang resource)
azd provision --preview

# Suriin ang sintaks ng Bicep
az bicep build --file infra/main.bicep

# Suriin ang konfigurasyon ng kapaligiran
azd env get-values
```

---

## ☑️ Tseklista Bago Mag-deploy

### Bago `azd provision`

- [ ] Na-verify ang quota para sa rehiyon
- [ ] Napili ang mga SKU nang naaangkop
- [ ] Nirepaso ang pagtatantya ng gastos
- [ ] Magkakatugma ang naming convention
- [ ] Na-configure ang seguridad/RBAC

### Bago `azd deploy`

- [ ] Nakatalaga ang mga environment variable
- [ ] Nasa Key Vault ang mga secret
- [ ] Na-verify ang mga connection string
- [ ] Na-configure ang mga health check

---

## 💰 Gabay sa Pagpili ng SKU

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Nabigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Chapter 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Susunod** | [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

---

## 📖 Kaugnay na Mga Mapagkukunan

- [Gabay sa Konfigurasyon](../chapter-03-configuration/configuration.md)
- [Gabay sa Pag-deploy](../chapter-04-infrastructure/deployment-guide.md)
- [Karaniwang Mga Isyu](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Isinalin ang dokumentong ito gamit ang AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o mga di-tumpak na bahagi. Ang orihinal na dokumento sa sariling wika nito ang dapat ituring na opisyal na sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->