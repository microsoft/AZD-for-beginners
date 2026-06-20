# Kabanata 6: Pagpaplano at Pagpapatunay Bago ang Pag-deploy

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 1 oras | **⭐ Antas ng Kahirapan**: Katamtaman

---

## Pangkalahatang-ideya

Saklaw ng kabanatang ito ang mahahalagang hakbang sa pagpaplano at pagpapatunay bago i-deploy ang iyong aplikasyon. Matutunan kung paano iwasan ang magastos na pagkakamali sa pamamagitan ng tamang pagpaplano ng kapasidad, pagpili ng SKU, at mga preflight check.

> Napatunayan laban sa `azd 1.25.6` noong Hunyo 2026.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, magagawa mo:
- Patakbuhin ang mga preflight check bago ang pag-deploy
- Magplano ng kapasidad at magtantya ng pangangailangan ng mga resources
- Pumili ng angkop na SKUs para sa pag-optimize ng gastos
- I-configure ang Application Insights para sa monitoring
- Maunawaan ang mga pattern ng koordinasyon ng koponan

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Mga Preflight Check](preflight-checks.md) | Suriin ang konfigurasyon bago i-deploy | 15 min |
| 2 | [Pagpaplano ng Kapasidad](capacity-planning.md) | Tantyahin ang pangangailangan ng mga resources | 20 min |
| 3 | [Pagpili ng SKU](sku-selection.md) | Pumili ng angkop na pricing tiers | 15 min |
| 4 | [Application Insights](application-insights.md) | I-configure ang monitoring | 20 min |
| 5 | [Mga Pattern ng Koordinasyon](coordination-patterns.md) | Mga workflow ng pag-deploy ng koponan | 15 min |

---

## 🚀 Mabilis na Panimula

```bash
# Suriin ang mga quota ng subscription
az vm list-usage --location eastus --output table

# I-preview ang deployment (walang nilikhang resources)
azd provision --preview

# Suriin ang syntax ng Bicep
az bicep build --file infra/main.bicep

# Suriin ang konfigurasyon ng kapaligiran
azd env get-values
```

---

## ☑️ Pre-Deployment Checklist

### Bago ang `azd provision`

- [ ] Na-verify ang quota para sa rehiyon
- [ ] Angkop na napiling SKUs
- [ ] Nasuri ang pagtataya ng gastos
- [ ] Pare-pareho ang konbensiyon ng pagbibigay ng pangalan
- [ ] Nakakonpigura ang Seguridad/RBAC

### Bago ang `azd deploy`

- [ ] Nakatakda ang mga environment variable
- [ ] Mga secret na nasa Key Vault
- [ ] Napatunayan ang mga connection string
- [ ] Nakakonpigura ang health checks

---

## 💰 Gabay sa Pagpili ng SKU

| Gawain | Pag-unlad | Produksyon |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Susunod** | [Kabanata 7: Paglutas ng Mga Suliranin](../chapter-07-troubleshooting/README.md) |

---

## 📖 Kaugnay na Mga Mapagkukunan

- [Gabay sa Konfigurasyon](../chapter-03-configuration/configuration.md)
- [Gabay sa Pag-deploy](../chapter-04-infrastructure/deployment-guide.md)
- [Mga Karaniwang Isyu](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->