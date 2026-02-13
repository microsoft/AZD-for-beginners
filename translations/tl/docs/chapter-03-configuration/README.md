# Kabanata 3: Konfigurasyon at Autentikasyon

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 45-60 minuto | **⭐ Antas ng Kahirapan**: Katamtaman

---

## Pangkalahatang-ideya

Ang kabanatang ito ay sumasaklaw sa konfigurasyon ng kapaligiran, mga pattern ng autentikasyon, at pinakamahuhusay na kasanayan sa seguridad para sa mga deployment gamit ang Azure Developer CLI.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, magagawa mong:
- Maging bihasa sa hierarkiya ng konfigurasyon ng AZD
- Pamahalaan ang maramihang kapaligiran (dev, staging, prod)
- Magpatupad ng ligtas na autentikasyon gamit ang mga pinamahalaang identidad
- I-configure ang mga setting na tiyak sa kapaligiran

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Gabay sa Konfigurasyon](configuration.md) | Pagsasaayos at pamamahala ng kapaligiran | 30 min |
| 2 | [Autentikasyon at Seguridad](authsecurity.md) | Mga pattern ng pinamahalaang identidad at RBAC | 30 min |

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

## 🔧 Hierarkiya ng Konfigurasyon

Ang AZD ay inaaplay ang mga setting sa pagkakasunod na ito (ang huli ay nagsasapawan sa nauna):

1. **Mga default na halaga** (nakapaloob sa mga template)
2. **azure.yaml** (konfigurasyon ng proyekto)
3. **Mga variable ng kapaligiran** (`azd env set`)
4. **Mga flag ng command-line** (`--location eastus`)

---

## 🔐 Pinakamahusay na Kasanayan sa Seguridad

```bash
# Gumamit ng pinamamahalaang identidad (inirerekomenda)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Suriin ang katayuan ng awtentikasyon
azd auth whoami
az account show

# Muling magpatunay ng pagkakakilanlan kung kinakailangan
azd auth login
az login
```

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 2: Pag-unlad ng AI](../chapter-02-ai-development/README.md) |
| **Susunod** | [Kabanata 4: Imprastruktura](../chapter-04-infrastructure/README.md) |

---

## 📖 Kaugnay na Mga Mapagkukunan

- [Pagsusuri Bago Pag-deploy](../chapter-06-pre-deployment/README.md)
- [Paglutas ng Problema](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Isinalin ang dokumentong ito gamit ang AI translation service na Co-op Translator (https://github.com/Azure/co-op-translator). Bagaman nagsisikap kami na maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o di-tumpak na bahagi. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pinakapinagkakatiwalaang sanggunian. Para sa mga kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasaling ng tao. Hindi kami mananagot para sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->