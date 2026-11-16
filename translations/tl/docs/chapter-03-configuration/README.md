# Kabanata 3: Konfigurasyon at Pagpapatotoo

**📚 Kurso**: [AZD Para sa mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 90-150 minuto kasama na ang pagsasanay sa integrasyon | **⭐ Antas ng Kahirapan**: Intermediate

---

## Pangkalahatang-ideya

Sinasaklaw ng kabanatang ito ang konfigurasyon ng kapaligiran, mga pattern ng pagpapatotoo, at mga pinakamahusay na gawi sa seguridad para sa mga deployment ng Azure Developer CLI.

> Target ng pagsusuri sa utos at konfigurasyon: `azd 1.37.2` (Nobyembre 2026). Hindi isinagawa ang live na pag-provision ng Azure sa panahon ng pagsusuri.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, iyong:
- Masusugan ang antas ng konfigurasyon ng AZD
- Pamahalaan ang maraming kapaligiran (dev, staging, prod)
- Ipatupad ang ligtas na pagpapatotoo gamit ang managed identities
- I-configure ang mga settings na partikular sa kapaligiran

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Gabay sa Konfigurasyon](configuration.md) | Pagsasaayos at pamamahala ng kapaligiran | 30 min |
| 2 | [Pagpapatotoo at Seguridad](authsecurity.md) | Managed identity at mga pattern ng RBAC | 30 min |

---

## 🚀 Mabilisang Pagsisimula

Patakbuhin mula sa root ng **isang naunang na-initialized na azd application**, hindi mula sa repository ng kurso. Gumamit ng hindi pa nagagamit na mga pangalan ng kapaligiran kung meron nang umiiral.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

Ang `SKU_NAME` ay halimbawa lamang: ito ay nakakaapekto sa imprastraktura lamang kung ito ay tahasang kinokonsumo ng iyong template. Ang mga karaniwang halaga ng `azd env set` ay iniimbak nang lokal sa plaintext; hindi ito ligtas na imbakan ng mga sikreto.

---

## 🔧 Antas ng Konfigurasyon

Panatilihing hiwalay ang tatlong magkaibang bahagi ng konfigurasyon: mga global na kagustuhan (`azd config`), istruktura ng proyekto (`azure.yaml`), at mga halaga bawat kapaligiran (`azd env`). Ang mga flag ay nagtataas lamang ng mga settings na tunay nilang sinusuportahan; walang pangkalahatang pag-overlay ng nagbibadyang arbitraryong mga environment variable sa `azure.yaml` o Bicep.

---

## 🔐 Mga Pinakamahusay na Gawi sa Seguridad

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nauna** | [Kabanata 2: AI Development](../chapter-02-ai-development/README.md) |
| **Susunod** | [Kabanata 4: Infrastructure](../chapter-04-infrastructure/README.md) |

---

## 📖 Mga Kaugnay na Mapagkukunan

- [Mga Paunang Pagsusuri bago ang Deployment](../chapter-06-pre-deployment/README.md)
- [Pag-aayos ng Problema](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->