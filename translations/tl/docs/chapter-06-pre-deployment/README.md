# Kabanata 6: Plano at Beripikasyon Bago ang Pag-deploy

**📚 Kurso**: [AZD Para sa mga Baguhan](../../README.md) | **⏱️ Tagal**: 2-4 na oras ng pagbabasa; karagdagang oras para sa mga naangkop na lab | **⭐ Kahirapan**: Intermediate–Advanced

---

## Pangkalahatang-ideya

Sinasaklaw ng kabanatang ito ang mahahalagang hakbang sa pagpaplano at beripikasyon bago i-deploy ang iyong aplikasyon. Matutunan kung paano maiwasan ang magagastos na pagkakamali sa tamang pagpaplano ng kapasidad, pagpili ng SKU, at mga preflight check.

> Sinuri ang gabay sa utos laban sa inilabas na `azd 1.37.2` reperensya. Hindi isinagawa ang mga pag-deploy sa cloud. Ang mas mahahabang aralin ay naglalaman ng mga ilustratibong bahagi, hindi kumpletong mga lokal na proyekto ng pag-deploy.

## Mga Layunin ng Pagkatuto

Sa pagkumpleto ng kabanatang ito, ikaw ay:
- Gagawa ng mga preflight check bago ang pag-deploy
- Magpaplano ng kapasidad at magtataya ng mga pangangailangan sa resources
- Pipili ng angkop na mga SKU para sa optimisasyon ng gastos
- Magkokonpigura ng Application Insights para sa pagmamanman
- Mauunawaan ang mga pattern ng koordinasyon ng multi-agent at ang kanilang mga pangangailangan sa pag-deploy

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Mga Preflight Check](preflight-checks.md) | Beripikahin ang konfigurasyon bago ang pag-deploy | 15 min |
| 2 | [Pagpaplano ng Kapasidad](capacity-planning.md) | Tayahin ang mga pangangailangan sa resources | 20 min |
| 3 | [Pagpili ng SKU](sku-selection.md) | Pumili ng angkop na mga antas ng presyo | 15 min |
| 4 | [Application Insights](application-insights.md) | I-configure ang pagmamanman | 20 min |
| 5 | [Mga Pattern ng Koordinasyon](coordination-patterns.md) | Advanced na disenyo ng multi-agent orchestration | 60-75 min |

---

## 🚀 Mabilisang Simula

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ Listahan ng Suriin Bago Mag-Deploy

### Bago ang `azd provision`

- [ ] Nasuri ang quota para sa rehiyon
- [ ] Nakapili ng angkop na mga SKU
- [ ] Nasuri ang pagtataya ng gastos
- [ ] Konsistente ang naming convention
- [ ] Nakonpigura ang Seguridad/RBAC

### Bago ang `azd deploy`

- [ ] Nakapag-set ng mga environment variables
- [ ] May mga sikreto sa Key Vault
- [ ] Nasuri ang mga connection string
- [ ] Nakonpigura ang mga health check

---

## 💰 Gabay sa Pagpili ng SKU

| Gawain | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Consumption o dedikadong workload profile, batay sa nasuring load |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI models | Sinusuportahan na pay-as-you-go na uri ng pag-deploy | Pay-as-you-go o provisioned throughput; depende sa modelo/rehiyon |
| AI Search | Libre/Basic sa loob ng mga limitasyon | Basic o Standard na tier na naayon sa index, mga repleka, at load ng query |

---

## 🔗 Nabigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Susunod** | [Kabanata 7: Pag-troubleshoot](../chapter-07-troubleshooting/README.md) |

---

## 📖 Mga Kaugnay na Mapagkukunan

- [Gabay sa Konfigurasyon](../chapter-03-configuration/configuration.md)
- [Gabay sa Pag-deploy](../chapter-04-infrastructure/deployment-guide.md)
- [Karaniwang mga Isyu](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->