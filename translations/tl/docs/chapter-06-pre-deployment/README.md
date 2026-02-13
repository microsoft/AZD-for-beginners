# Kabanata 6: Pagpaplano at Pagpapatunay Bago ang Pag-deploy

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 1 oras | **⭐ Antas ng Kahirapan**: Katamtaman

---

## Pangkalahatang-ideya

Sinasaklaw ng kabanatang ito ang mahahalagang hakbang sa pagpaplano at pagpapatunay bago i-deploy ang iyong aplikasyon. Matutunan kung paano iwasan ang magastos na pagkakamali sa pamamagitan ng wastong pagpaplano ng kapasidad, pagpili ng SKU, at mga preflight check.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, ikaw ay:
- Magpapatakbo ng mga preflight check bago mag-deploy
- Magpaplano ng kapasidad at pagtatantya ng mga kinakailangang mapagkukunan
- Pipipili ng angkop na SKUs para sa pag-optimize ng gastos
- Magko-configure ng Application Insights para sa pagsubaybay
- Mauunawaan ang mga pattern ng koordinasyon ng koponan

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Mga Preflight Check](preflight-checks.md) | I-validate ang konfigurasyon bago ang pag-deploy | 15 min |
| 2 | [Pagpaplano ng Kapasidad](capacity-planning.md) | Tantyahin ang mga kinakailangang mapagkukunan | 20 min |
| 3 | [Pagpili ng SKU](sku-selection.md) | Pumili ng angkop na pricing tiers | 15 min |
| 4 | [Application Insights](application-insights.md) | I-configure ang pagsubaybay | 20 min |
| 5 | [Mga Pattern ng Koordinasyon](coordination-patterns.md) | Mga workflow ng koponan sa pag-deploy | 15 min |

---

## 🚀 Mabilis na Simula

```bash
# Suriin ang mga quota ng subscription
az vm list-usage --location eastus --output table

# I-preview ang deployment (walang mga resource na nilikha)
azd provision --preview

# Beripikahin ang sintaks ng Bicep
az bicep build --file infra/main.bicep

# Suriin ang konfigurasyon ng kapaligiran
azd env get-values
```

---

## ☑️ Checklist Bago ang Pag-deploy

### Bago ang `azd provision`

- [ ] Nakumpirma ang quota para sa rehiyon
- [ ] Napili nang tama ang SKUs
- [ ] Na-review ang pagtatantya ng gastos
- [ ] Pare-pareho ang konbensiyon ng pangalan
- [ ] Naka-configure ang Seguridad/RBAC

### Bago ang `azd deploy`

- [ ] Naitakda ang mga environment variable
- [ ] Mga secret sa Key Vault
- [ ] Nakumpirma ang mga connection string
- [ ] Naka-configure ang health checks

---

## 💰 Gabay sa Pagpili ng SKU

| Uri ng Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigasyon

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Kabanata 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Next** | [Kabanata 7: Pag-troubleshoot](../chapter-07-troubleshooting/README.md) |

---

## 📖 Kaugnay na Mga Mapagkukunan

- [Gabay sa Konfigurasyon](../chapter-03-configuration/configuration.md)
- [Gabay sa Pag-deploy](../chapter-04-infrastructure/deployment-guide.md)
- [Karaniwang Mga Isyu](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Isinalin ang dokumentong ito gamit ang AI na serbisyo para sa pagsasalin [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami na maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa sariling wika nito ang dapat ituring na pangunahing pinagmumulan ng impormasyon. Para sa mga kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng salin na ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->