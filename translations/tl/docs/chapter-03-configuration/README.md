# Kabanata 3: Konfigurasyon at Pagpapatunay

**📚 Kurso**: [AZD Para sa Mga Baguhan](../../README.md) | **⏱️ Tagal**: 45-60 minuto | **⭐ Antas ng Kahirapan**: Intermediate

---

## Pangkalahatang-ideya

Tinatalakay ng kabanatang ito ang konfigurasyon ng kapaligiran, mga pattern ng pagpapatunay, at mga pinakamahusay na kasanayan sa seguridad para sa mga deployment ng Azure Developer CLI.

> Napatunayan gamit ang `azd 1.27.1` noong Hulyo 2026.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, matututuhan mo:
- Mabisang makontrol ang AZD configuration hierarchy
- Pamahalaan ang maramihang mga kapaligiran (dev, staging, prod)
- Magpatupad ng ligtas na pagpapatunay gamit ang mga managed identities
- I-configure ang mga setting na partikular sa kapaligiran

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Gabay sa Konfigurasyon](configuration.md) | Pagsasaayos at pamamahala ng kapaligiran | 30 min |
| 2 | [Pagpapatunay at Seguridad](authsecurity.md) | Managed identity at mga pattern ng RBAC | 30 min |

---

## 🚀 Mabilisang Pagsisimula

```bash
# Gumawa ng maramihang mga kapaligiran
azd env new dev
azd env new staging
azd env new prod

# Lumipat ng mga kapaligiran
azd env select prod

# Itakda ang mga variable ng kapaligiran
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Tingnan ang konfigurasyon
azd env get-values
```

---

## 🔧 Hierarchy ng Konfigurasyon

Ipinapatupad ng AZD ang mga setting sa ganitong pagkakasunod (ang huli ay pumapalit sa nauna):

1. **Mga default na halaga** (nakapaloob sa mga template)
2. **azure.yaml** (konfigurasyon ng proyekto)
3. **Mga environment variable** (`azd env set`)
4. **Mga command-line flags** (`--location eastus`)

---

## 🔐 Pinakamahuhusay na Kasanayan sa Seguridad

```bash
# Gamitin ang pinamamahalaang pagkakakilanlan (inirerekomenda)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Suriin ang katayuan ng pagpapatunay ng AZD
azd auth status

# Opsyonal: tiyakin ang konteksto ng Azure CLI kung balak mong magpatakbo ng az commands
az account show

# Muling magpatunay kung kinakailangan
azd auth login

# Opsyonal: i-refresh ang pagpapatunay ng Azure CLI para sa az commands
az login
```

---

## 🔗 Navigation

| Direksyon | Kabanata |
|-----------|---------|
| **Nakahuli** | [Kabanata 2: AI Development](../chapter-02-ai-development/README.md) |
| **Susunod** | [Kabanata 4: Infrastrukturang](../chapter-04-infrastructure/README.md) |

---

## 📖 Kaugnay na Mga Sanggunian

- [Mga Paunang Pagsusuri bago ang Deployment](../chapter-06-pre-deployment/README.md)
- [Pag-aayos ng Problema](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->