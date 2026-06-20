# Sura 3: Usanidi na Uthibitisho

**📚 Kozi**: [AZD Kwa Waanziaji](../../README.md) | **⏱️ Muda**: 45-60 dakika | **⭐ Ugumu**: Wastani

---

## Muhtasari

Sura hii inafunika usanidi wa mazingira, mifano ya uthibitisho, na mbinu bora za usalama kwa utoaji wa Azure Developer CLI.

> Imethibitishwa dhidi ya `azd 1.25.6` Juni 2026.

## Malengo ya Kujifunza

Baada ya kumaliza sura hii, utakuwa umejifunza:
- Kuwa mtaalamu wa hierarki ya usanidi ya AZD
- Kusimamia mazingira mengi (dev, staging, prod)
- Kutekeleza uthibitisho salama kwa kutumia vitambulisho vinavyosimamiwa
- Sanidi mipangilio maalum kwa mazingira

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Configuration Guide](configuration.md) | Usanidi na usimamizi wa mazingira | 30 dakika |
| 2 | [Authentication & Security](authsecurity.md) | Mifano ya vitambulisho vinavyosimamiwa na RBAC | 30 dakika |

---

## 🚀 Anza Haraka

```bash
# Unda mazingira mengi
azd env new dev
azd env new staging
azd env new prod

# Badilisha mazingira
azd env select prod

# Weka vigezo vya mazingira
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Tazama usanidi
azd env get-values
```

---

## 🔧 Hierarki ya Usanidi

AZD inatekeleza mipangilio kwa mpangilio huu (mipangilio ya baadaye inaondosha ile ya awali):

1. **Thamani za chaguo-msingi** (imejengwa ndani ya violezo)
2. **azure.yaml** (usanidi wa mradi)
3. **Vigezo vya mazingira** (`azd env set`)
4. **Bendera za mstari wa amri** (`--location eastus`)

---

## 🔐 Mbinu Bora za Usalama

```bash
# Tumia utambulisho uliosimamiwa (inapendekezwa)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Angalia hali ya uthibitisho ya AZD
azd auth status

# Hiari: hakikisha muktadha wa Azure CLI ikiwa unapanga kuendesha amri za az
az account show

# Thibitisha upya ikiwa inahitajika
azd auth login

# Hiari: sasisha uthibitisho wa Azure CLI kwa amri za az
az login
```

---

## 🔗 Uvinjari

| Direction | Chapter |
|-----------|---------|
| **Iliyopita** | [Sura 2: Maendeleo ya AI](../chapter-02-ai-development/README.md) |
| **Ifuatayo** | [Sura 4: Miundombinu](../chapter-04-infrastructure/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Ukaguzi kabla ya utoaji](../chapter-06-pre-deployment/README.md)
- [Utatuzi wa Matatizo](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->