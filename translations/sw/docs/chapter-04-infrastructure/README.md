# Sura 4: Miundombinu kama Msimbo & Utoaji

**📚 Kozi**: [AZD For Beginners](../../README.md) | **⏱️ Muda**: 1-1.5 saa | **⭐ Ugumu**: Kati

---

## Muhtasari

Sura hii inashughulikia mifano ya Miundombinu kama Msimbo (IaC) kwa templeti za Bicep, utayarishaji wa rasilimali, na mikakati ya utoaji kwa kutumia Azure Developer CLI.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa umeweza:
- Elewa muundo na msamiati wa templeti za Bicep
- Tayarisha rasilimali za Azure kwa `azd provision`
- Weka programu kwa `azd deploy`
- Tekeleza mikakati ya utoaji za blue-green na rolling

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | Usimamizi wa rasilimali za Azure kwa AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Mikakati ya utoaji wa programu | 45 min |

---

## 🚀 Anza Haraka

```bash
# Anzisha kutoka kwa kiolezo
azd init --template azure-functions-python-v2-http

# Tazama awali kile kitakachoundwa
azd provision --preview

# Tayarisha miundombinu tu
azd provision

# Sambaza msimbo tu
azd deploy

# Au zote mbili pamoja
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
| `azd deploy` | Weka msimbo wa programu |
| `azd up` | tayari + weka |
| `azd down` | Futa rasilimali zote |

---

## 🔗 Uvinjari

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura 3: Usanidi](../chapter-03-configuration/README.md) |
| **Ifuatayo** | [Sura 5: Suluhisho za Wakala Wengi](../chapter-05-multi-agent/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Ukaguzi kabla ya Utoaji](../chapter-06-pre-deployment/README.md)
- [Mifano ya Programu za Container](../../examples/container-app/README.md)
- [Mfano wa Programu ya Hifadhidata](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Taarifa ya kukanusha**:
Nyaraka hii imefasiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya awali kwa lugha yake ya asili inapaswa kuchukuliwa kama chanzo cha kuaminika. Kwa taarifa muhimu, inashauriwa kutumia tafsiri ya mtaalamu wa kibinadamu. Hatuwajibiki kwa uelewa usio sahihi au tafsiri potofu zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->