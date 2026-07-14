# Kabanata 6: Pagpaplano at Pagpapatunay Bago ang Pag-deploy

**📚 Kurso**: [AZD Para sa mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 1 oras | **⭐ Antas ng Kahirapan**: Gitna

---

## Pangkalahatang Ideya

Tinutukoy sa kabanatang ito ang mahahalagang hakbang sa pagpaplano at pagpapatunay bago i-deploy ang iyong aplikasyon. Matutong iwasan ang magastos na mga pagkakamali sa tamang pagpaplano ng kapasidad, pagpili ng SKU, at mga preflight check.

> Na-validate gamit ang `azd 1.27.1` noong Hulyo 2026.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, magagawa mo:
- Magsagawa ng preflight checks bago ang deployment
- Magplano ng kapasidad at tantiyahin ang pangangailangan sa mga resources
- Piliin ang angkop na mga SKU para sa optimal na gastos
- I-configure ang Application Insights para sa monitoring
- Maunawaan ang mga pattern ng koordinasyon ng koponan

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Patunayan ang configuration bago mag-deploy | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Tantiyahin ang pangangailangan sa mga resources | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Piliin ang angkop na pricing tiers | 15 min |
| 4 | [Application Insights](application-insights.md) | I-configure ang monitoring | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Mga workflow ng koponan sa deployment | 15 min |

---

## 🚀 Mabilisang Panimula

```bash
# Suriin ang mga quota ng subscription
az vm list-usage --location eastus --output table

# Tingnan ang deployment (walang likhaang resources)
azd provision --preview

# Patunayan ang syntax ng Bicep
az bicep build --file infra/main.bicep

# Suriin ang configuration ng kapaligiran
azd env get-values
```

---

## ☑️ Checklist Bago ang Deployment

### Bago ang `azd provision`

- [ ] Kwarto ng quota para sa rehiyon beripikado
- [ ] Mga SKU napili ng wasto
- [ ] Tinatayang gastos nirepaso
- [ ] Konsistent ang naming convention
- [ ] Na-configure ang Seguridad/RBAC

### Bago ang `azd deploy`

- [ ] Naitakda ang mga environment variables
- [ ] Lihim sa Key Vault
- [ ] Mga connection string na-verify
- [ ] Na-configure ang health checks

---

## 💰 Gabay sa Pagpili ng SKU

| Gawain | Pag-unlad | Produksyon |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Mga Modelo ng Microsoft Foundry | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Pag-navigate

| Direksyon | Kabanata |
|-----------|---------|
| **Nauna** | [Kabanata 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Susunod** | [Kabanata 7: Pag-troubleshoot](../chapter-07-troubleshooting/README.md) |

---

## 📖 Kaugnay na mga Sanggunian

- [Gabay sa Configuration](../chapter-03-configuration/configuration.md)
- [Gabay sa Deployment](../chapter-04-infrastructure/deployment-guide.md)
- [Karaniwang Isyu](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->