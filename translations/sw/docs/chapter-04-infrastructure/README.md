# Sura 4: Miundombinu kama Msimbo & Upelekaji

**📚 Kozi**: [AZD For Beginners](../../README.md) | **⏱️ Muda**: 1-1.5 saa | **⭐ Ugumu**: Kati

---

## Muhtasari

Sura hii inashughulikia mifumo ya Miundombinu kama Msimbo (IaC) kwa kutumia templeti za Bicep, upangaji rasilimali, na mikakati ya upelekaji kwa kutumia Azure Developer CLI.

> Imethibitishwa dhidi ya `azd 1.25.6` mnamo Juni 2026.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa unaweza:
- Kuelewa muundo na sintaksia ya templeti za Bicep
- Kuunda rasilimali za Azure kwa kutumia `azd provision`
- Kupeleka programu kwa `azd deploy`
- Kutekeleza mikakati za upelekaji za blue-green na rolling

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | Usimamizi wa rasilimali za Azure kwa AZD | 45 dakika |
| 2 | [Deployment Guide](deployment-guide.md) | Mikakati ya upelekaji wa programu | 45 dakika |
| 3 | [Authoring Your Own Template](custom-templates.md) | Jenga na chapisha templeti za azd zinazoweza kutumika tena | 30 dakika |

---

## 🚀 Anza Haraka

```bash
# Anzisha kutoka kwa kiolezo
azd init --template azure-functions-python-v2-http

# Tazama kile kitakachoundwa
azd provision --preview

# Sanidi miundombinu pekee
azd provision

# Sambaza msimbo tu
azd deploy

# Au vyote pamoja
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
| `azd deploy` | Peleka msimbo wa programu |
| `azd up` | kuunda + kupeleka |
| `azd down` | Futa rasilimali zote |

---

## 🔗 Uabiri

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyotangulia** | [Sura 3: Usanidi](../chapter-03-configuration/README.md) |
| **Ifuatayo** | [Sura 5: Suluhisho za Multi-Agent](../chapter-05-multi-agent/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Ukaguzi Kabla ya Upelekaji](../chapter-06-pre-deployment/README.md)
- [Mifano ya Programu za Container](../../examples/container-app/README.md)
- [Mfano wa Programu ya Hifadhidata](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->