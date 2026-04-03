# Sura 3: Usanidi & Uthibitishaji

**📚 Kozi**: [AZD Kwa Waanzaaji](../../README.md) | **⏱️ Muda**: 45-60 dakika | **⭐ Ugumu**: Wastani

---

## Muhtasari

Sura hii inashughulikia usanidi wa mazingira, mifumo ya uthibitishaji, na mazowe bora ya usalama kwa upangaji wa Azure Developer CLI deployments.

> Ithibitishwa dhidi ya `azd 1.23.12` katika Machi 2026.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa na uwezo wa:
- Tawala mfuatano wa usanidi wa AZD
- Dhibiti mazingira mengi (dev, staging, prod)
- Tekeleza uthibitishaji salama kwa vitambulisho zinazosimamiwa
- Sanidi mipangilio maalum ya mazingira

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Mwongozo wa Usanidi](configuration.md) | Uundaji na usimamizi wa mazingira | 30 dakika |
| 2 | [Uthibitishaji & Usalama](authsecurity.md) | Vitambulisho vinazosimamiwa na mifumo ya RBAC | 30 dakika |

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

## 🔧 Mfuatano wa Usanidi

AZD inatumia mipangilio kwa mpangilio huu (ile ya baadaye inabadilisha ile ya awali):

1. **Thamani za chaguo-msingi** (imejengwa ndani ya templates)
2. **azure.yaml** (usanidi wa mradi)
3. **Vigezo vya mazingira** (`azd env set`)
4. **Bendera za amri** (`--location eastus`)

---

## 🔐 Mazoea Bora ya Usalama

```bash
# Tumia kitambulisho kilichosimamiwa (inayopendekezwa)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Angalia hali ya uthibitishaji ya AZD
azd auth status

# Hiari: thibitisha muktadha wa Azure CLI ikiwa unapanga kuendesha amri za az
az account show

# Thibitisha tena ikiwa inahitajika
azd auth login

# Hiari: fufua uthibitishaji wa Azure CLI kwa amri za az
az login
```

---

## 🔗 Uelekeo

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura 2: Maendeleo ya AI](../chapter-02-ai-development/README.md) |
| **Ifuatayo** | [Sura 4: Miundombinu](../chapter-04-infrastructure/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Ukaguzi Kabla ya Utekelezaji](../chapter-06-pre-deployment/README.md)
- [Kutatua Matatizo](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Taarifa ya kutowajibika**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Wakati tunajitahidi kufikia usahihi, tafadhali kumbuka kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya asili katika lugha yake inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inashauriwa. Hatutawajibika kwa kutoelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->