# Sura ya 4: Miundombinu kama Kanuni & Utekelezaji

**📚 Kozi**: [AZD Kwa Anuani](../../README.md) | **⏱️ Muda**: Saa 1-1.5 | **⭐ Ugumu**: Wastani

---

## Muhtasari

Sura hii inahusu mifumo ya Miundombinu kama Kanuni (IaC) kwa matumizi ya kiolezo cha Bicep, upangaji rasilimali, na mikakati ya utekelezaji kwa kutumia Azure Developer CLI.

> Imethibitishwa dhidi ya `azd 1.27.1` mwezi Julai 2026.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa na uwezo wa:
- Kuelewa muundo na sarufi ya kiolezo cha Bicep
- Kuandaa rasilimali za Azure kwa kutumia `azd provision`
- Kuweka programu moja kwa moja kwa kutumia `azd deploy`
- Kutekeleza mikakati ya utekelezaji ya blue-green na rolling

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Kuandaa Rasilimali](provisioning.md) | Usimamizi wa rasilimali za Azure kwa kutumia AZD | Dakika 45 |
| 2 | [Mwongozo wa Utekelezaji](deployment-guide.md) | Mikakati ya utekelezaji wa programu | Dakika 45 |
| 3 | [Kuandika Kiolezo Chako](custom-templates.md) | Jenga na chapisha violezo vinavyoweza kutumika tena vya azd | Dakika 30 |

---

## 🚀 Anza Haraka

```bash
# Anzisha kutoka kwa kiolezo
azd init --template azure-functions-python-v2-http

# Onyesha awali kile kitakachoundwa
azd provision --preview

# Toa huduma ya miundombinu pekee
azd provision

# Tekeleza msimbo pekee
azd deploy

# Au vyote viwili pamoja
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
| `azd provision` | Tengeneza rasilimali za Azure |
| `azd deploy` | Tekeleza msimbo wa programu |
| `azd up` | andaa + tekeleza |
| `azd down` | Futa rasilimali zote |

---

## 🔗 Urambazaji

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyotangulia** | [Sura 3: Usanidi](../chapter-03-configuration/README.md) |
| **Inayofuata** | [Sura 5: Suluhisho za Wakala Kadhaa](../chapter-05-multi-agent/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Uhakiki wa Kabla ya Utekelezaji](../chapter-06-pre-deployment/README.md)
- [Mifano ya Programu ya Kontena](../../examples/container-app/README.md)
- [Mfano wa Programu ya Hifadhidata](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->