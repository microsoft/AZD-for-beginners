# Sura ya 3: Usanidi & Uthibitishaji

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: Dakika 90-150 ikijumuisha mazoezi ya kuunganisha | **⭐ Ugumu**: Wastani

---

## Muhtasari

Sura hii inashughulikia usanidi wa mazingira, mifumo ya uthibitishaji, na mbinu bora za usalama kwa usambazaji wa Azure Developer CLI.

> Lengo la mapitio ya amri na usanidi: `azd 1.37.2` (Novemba 2026). Utoaji halisi wa Azure haukufanyika wakati wa mapitio.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa umeweza:
- Kufahamu mlinganyo wa usanidi wa AZD
- Kudhibiti mazingira mbalimbali (dev, staging, prod)
- Kutekeleza uthibitishaji salama kwa kutumia utambulisho ulioendeshwa
- Kusanidi mipangilio maalum kwa mazingira

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Mwongozo wa Usanidi](configuration.md) | Usanidi na usimamizi wa mazingira | Dak 30 |
| 2 | [Uthibitishaji & Usalama](authsecurity.md) | Mfano wa utambulisho ulioendeshwa na RBAC | Dak 30 |

---

## 🚀 Anza Haraka

Endesha kutoka mzizi wa **programu ya azd tayari kusanidiwa**, sio hifadhi ya kozi. Tumia majina ya mazingira ambayo hayajatumika kama haya tayari yapo.

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

`SKU_NAME` ni mfano: huathiri miundombinu tu ikiwa templeti yako inaitumia waziwazi. Thamani za kawaida za `azd env set` huhifadhiwa mahali pa karibu wazi; si hifadhi salama ya siri.

---

## 🔧 Mlinganyo wa Usanidi

Hifadhi uso tatu tofauti wa usanidi kwa mbali: mapendeleo ya ulimwengu (`azd config`), muundo wa mradi (`azure.yaml`), na thamani kwa kila mazingira (`azd env`). Bendera huondoa mipangilio wanayoidhinisha tu; hakuna utupu wa ulimwengu wa vigezo vya mazingira chochote juu ya `azure.yaml` au Bicep.

---

## 🔐 Mbinu Bora za Usalama

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

## 🔗 Urambazaji

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura ya 2: Maendeleo ya AI](../chapter-02-ai-development/README.md) |
| **Ifuatayo** | [Sura ya 4: Miundombinu](../chapter-04-infrastructure/README.md) |

---

## 📖 Rasilimali Zilizohusiana

- [Ukaguzi Kabla ya Usambazaji](../chapter-06-pre-deployment/README.md)
- [Utatuzi wa Matatizo](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->