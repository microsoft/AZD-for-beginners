# Kabanata 3: Konfigurasyon at Pagpapatotoo

**📚 Kurso**: [AZD For Beginners](../../README.md) | **⏱️ Tagal**: 45-60 minutes | **⭐ Kahirapan**: Intermediate

---

## Pangkalahatang-ideya

Sinasaklaw ng kabanatang ito ang konfigurasyon ng environment, mga pattern ng pagpapatotoo, at mga pinakamahusay na praktika sa seguridad para sa Azure Developer CLI deployments.

> Na-validate laban sa `azd 1.25.6` noong Hunyo 2026.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, magagawa mo:
- Maging dalubhasa sa hierarchy ng konfigurasyon ng AZD
- Pamahalaan ang maramihang mga environment (dev, staging, prod)
- Magpatupad ng ligtas na pagpapatotoo gamit ang managed identities
- I-configure ang mga setting na partikular sa environment

---

## 📚 Mga Leksyon

| # | Leksyon | Paglalarawan | Time |
|---|--------|-------------|------|
| 1 | [Gabay sa Konfigurasyon](configuration.md) | Pagsasaayos at pamamahala ng environment | 30 min |
| 2 | [Pagpapatotoo at Seguridad](authsecurity.md) | Mga pattern ng managed identity at RBAC | 30 min |

---

## 🚀 Mabilis na Pagsisimula

```bash
# Lumikha ng maramihang mga kapaligiran
azd env new dev
azd env new staging
azd env new prod

# Magpalit ng kapaligiran
azd env select prod

# Itakda ang mga variable ng kapaligiran
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Tingnan ang konfigurasyon
azd env get-values
```

---

## 🔧 Hierarchy ng Konfigurasyon

AZD ina-apply ang mga setting sa pagkakasunod na ito (ang huli ay nag-override sa nauna):

1. **Mga default na halaga** (nakapaloob sa mga template)
2. **azure.yaml** (konfigurasyon ng proyekto)
3. **Mga environment variable** (`azd env set`)
4. **Mga command-line flag** (`--location eastus`)

---

## 🔐 Mga Pinakamahuhusay na Praktika sa Seguridad

```bash
# Gumamit ng managed identity (inirerekomenda)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Suriin ang katayuan ng pagpapatunay ng AZD
azd auth status

# Opsyonal: beripikahin ang konteksto ng Azure CLI kung balak mong magpatakbo ng mga utos na az
az account show

# Muling magpatunay kung kinakailangan
azd auth login

# Opsyonal: i-refresh ang pagpapatunay ng Azure CLI para sa mga utos na az
az login
```

---

## 🔗 Pag-navigate

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 2: Pag-unlad ng AI](../chapter-02-ai-development/README.md) |
| **Susunod** | [Kabanata 4: Imprastruktura](../chapter-04-infrastructure/README.md) |

---

## 📖 Mga Kaugnay na Mapagkukunan

- [Mga Paunang Pagsusuri Bago ang Pag-deploy](../chapter-06-pre-deployment/README.md)
- [Pag-troubleshoot](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->