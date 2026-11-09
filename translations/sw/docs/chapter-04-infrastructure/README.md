# Sura ya 4: Miundombinu kama Msimbo & Utekelezaji

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: masaa 2-3 ya kusoma; ruhusu muda wa ziada kwa mazoezi ya utekelezaji | **⭐ Ugumu**: Kiwiliwili

---

## Muhtasari

Sura hii inashughulikia mifumo ya Miundombinu kama Msimbo (IaC) kwa kutumia templeti za Bicep, utayarishaji wa rasilimali, na mikakati ya utekelezaji kwa kutumia Azure Developer CLI.

> Lengo la ukaguzi wa amri na usanidi: `azd 1.37.2` (Novemba 2026). Utoaji wa Azure wa moja kwa moja haukukamilishwa wakati wa ukaguzi.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utajua:
- Kuelewa muundo na sintaksia ya templeti za Bicep
- Kutayarisha rasilimali za Azure kwa kutumia `azd provision`
- Kuweka programu kwenye mtandao kwa kutumia `azd deploy`
- Kutekeleza mikakati ya utekelezaji ya blue-green na rolling

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Utayarishaji wa Rasilimali](provisioning.md) | Usimamizi wa rasilimali za Azure kwa kutumia AZD | Dakika 45 |
| 2 | [Mwongozo wa Utekelezaji](deployment-guide.md) | Mikakati ya kuweka programu mtandaoni | Dakika 45 |
| 3 | [Kuunda Templeti Yako](custom-templates.md) | Jenga na chapisha templeti za azd zinazoweza kutumika tena | Dakika 30 |

---

## 🚀 Mwanzo wa Haraka

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
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

## 🔗 Uvukeji

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura ya 3: Usanidi](../chapter-03-configuration/README.md) |
| **Inayofuata** | [Sura ya 5: Suluhisho za Wakala Wengi](../chapter-05-multi-agent/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Ukaguzi Kabla ya Utekelezaji](../chapter-06-pre-deployment/README.md)
- [Mifano ya Programu za Kontena](../../examples/container-app/README.md)
- [Mfano wa Programu ya Database](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->