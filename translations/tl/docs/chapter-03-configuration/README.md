# Kabanata 3: Konfigurasyon at Pagpapatunay

**📚 Kurso**: [AZD For Beginners](../../README.md) | **⏱️ Tagal**: 45-60 minuto | **⭐ Antas ng Kahirapan**: Katamtaman

---

## Pangkalahatang-ideya

Tinutukoy ng kabanatang ito ang konfigurasyon ng environment, mga pattern ng pagpapatunay, at pinakamahusay na kasanayan sa seguridad para sa mga deployment gamit ang Azure Developer CLI.

> Na-validate gamit ang `azd 1.23.12` noong Marso 2026.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, makakaya mong:
- Makabisado ang hierarchy ng konfigurasyon ng AZD
- Pamahalaan ang maramihang mga environment (dev, staging, prod)
- Magpatupad ng ligtas na pagpapatunay gamit ang managed identities
- I-configure ang mga setting na partikular sa bawat environment

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Gabay sa Konfigurasyon](configuration.md) | Pagsasaayos at pamamahala ng environment | 30 min |
| 2 | [Pagpapatunay at Seguridad](authsecurity.md) | Managed identity at mga pattern ng RBAC | 30 min |

---

## 🚀 Mabilis na Pagsisimula

```bash
# Lumikha ng maraming kapaligiran
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

## 🔧 Herarkiya ng Konfigurasyon

Inilalapat ng AZD ang mga setting sa pagkakasunod na ito (ang mas huli ay ini-override ang mas mauna):

1. **Mga default na halaga** (nakapaloob sa mga template)
2. **azure.yaml** (konfigurasyon ng proyekto)
3. **Mga environment variable** (`azd env set`)
4. **Mga flag ng command-line** (`--location eastus`)

---

## 🔐 Pinakamahusay na Kasanayan sa Seguridad

```bash
# Gumamit ng managed identity (inirerekomenda)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Suriin ang katayuan ng autentikasyon ng AZD
azd auth status

# Opsyonal: suriin ang konteksto ng Azure CLI kung plano mong magpatakbo ng mga utos na az
az account show

# Muling mag-authenticate kung kinakailangan
azd auth login

# Opsyonal: i-refresh ang autentikasyon ng Azure CLI para sa mga utos na az
az login
```

---

## 🔗 Nabigasyon

| Direction | Chapter |
|-----------|---------|
| **Nakaraan** | [Kabanata 2: Pag-unlad ng AI](../chapter-02-ai-development/README.md) |
| **Susunod** | [Kabanata 4: Imprastruktura](../chapter-04-infrastructure/README.md) |

---

## 📖 Kaugnay na Mga Sanggunian

- [Pagsusuri bago mag-deploy](../chapter-06-pre-deployment/README.md)
- [Pag-troubleshoot](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ang dokumentong ito ay isinalin gamit ang AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa kawastuhan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na pinagmumulan ng awtoridad. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->