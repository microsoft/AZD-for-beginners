# Sura 4: Miundombinu kama Msimbo na Utekelezaji

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: 1-1.5 saa | **⭐ Ugumu**: Wastani

---

## Muhtasari

Sura hii inashughulikia mifumo ya Miundombinu kama Msimbo (IaC) kwa violezo vya Bicep, utayarishaji wa rasilimali, na mikakati ya utekelezaji kwa kutumia Azure Developer CLI.

> Imethibitishwa kutumia `azd 1.23.12` mwezi Machi 2026.

## Malengo ya Kujifunza

Baada ya kumaliza sura hii, utakuwa umeweza:
- Kuelewa muundo na sintaksia ya violezo vya Bicep
- Kuunda rasilimali za Azure kwa kutumia `azd provision`
- Kusambaza programu kwa kutumia `azd deploy`
- Kutekeleza mikakati ya utoaji wa blue-green na rolling

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Utayarishaji wa Rasilimali](provisioning.md) | Usimamizi wa rasilimali za Azure kwa AZD | 45 min |
| 2 | [Mwongozo wa Utekelezaji](deployment-guide.md) | Mikakati ya utoaji wa programu | 45 min |

---

## 🚀 Anza Haraka

```bash
# Anzisha kutoka kwa kiolezo
azd init --template azure-functions-python-v2-http

# Angalia awali kile kitakachoundwa
azd provision --preview

# Sanidi miundombinu pekee
azd provision

# Weka msimbo pekee
azd deploy

# Au yote mawili pamoja
azd up
```

---

## 📁 Muundo wa Mradi wa AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Amri Muhimu

| Amri | Maelezo |
|---------|-------------|
| `azd init` | Anzisha mradi |
| `azd provision` | Unda rasilimali za Azure |
| `azd deploy` | Sambaza msimbo wa programu |
| `azd up` | kusanidi + kusambaza |
| `azd down` | Futa rasilimali zote |

---

## 🔗 Navigation

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura 3: Mipangilio](../chapter-03-configuration/README.md) |
| **Ifuatayo** | [Sura 5: Suluhisho za Multi-Agent](../chapter-05-multi-agent/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Ukaguzi Kabla ya Utoaji](../chapter-06-pre-deployment/README.md)
- [Mifano ya Programu za Container](../../examples/container-app/README.md)
- [Mfano wa Programu ya Hifadhidata](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Angalizo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Wakati tunajitahidi kwa usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya awali katika lugha yake ya asili inapaswa kutazamwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inashauriwa kutumia tafsiri ya mtaalamu wa kibinadamu. Hatuwajibiki kwa kutokuelewana au tafsiri potofu yoyote itakayojitokeza kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->