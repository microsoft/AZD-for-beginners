# 4 skyrius: Infrastruktūra kaip kodas & Diegimas

**📚 Kursas**: [AZD Pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 1-1.5 valandos | **⭐ Sudėtingumas**: Vidutinis

---

## Apžvalga

Šiame skyriuje aptariami infrastruktūros kaip kodo (IaC) šablonai su Bicep, resursų parengimas ir diegimo strategijos naudojant Azure Developer CLI.

> Patikrinta su `azd 1.23.12` 2026 metų kovą.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Suprasite Bicep šablonų struktūrą ir sintaksę
- Parengsite Azure resursus su komanda `azd provision`
- Diegsite programas su komanda `azd deploy`
- Įgyvendinsite mėlynai-žalią ir slankiojančio diegimo strategijas

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-----------|--------|
| 1 | [Resursų parengimas](provisioning.md) | Azure resursų valdymas naudojant AZD | 45 min |
| 2 | [Diegimo vadovas](deployment-guide.md) | Programų diegimo strategijos | 45 min |

---

## 🚀 Greitas pradžia

```bash
# Inicializuoti iš šablono
azd init --template azure-functions-python-v2-http

# Peržiūrėti, kas bus sukurta
azd provision --preview

# Teikti tik infrastruktūrą
azd provision

# Diegti tik kodą
azd deploy

# Arba abu kartu
azd up
```

---

## 📁 AZD projekto struktūra

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

## 🔧 Pagrindinės komandos

| Komanda | Aprašymas |
|---------|-----------|
| `azd init` | Inicijuoti projektą |
| `azd provision` | Sukurti Azure resursus |
| `azd deploy` | Diegti programos kodą |
| `azd up` | parengti + diegti |
| `azd down` | Ištrinti visus resursus |

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|---------|---------|
| **Ankstesnis** | [3 skyrius: Konfigūracija](../chapter-03-configuration/README.md) |
| **Kitas** | [5 skyrius: Multi-agentų sprendimai](../chapter-05-multi-agent/README.md) |

---

## 📖 Susiję ištekliai

- [Patikrinimai prieš diegimą](../chapter-06-pre-deployment/README.md)
- [Container App pavyzdžiai](../../examples/container-app/README.md)
- [Database App pavyzdys](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritiniais atvejais rekomenduojamas profesionalus vertimas žmogaus. Mes neprisiimame atsakomybės už bet kokius nesusipratimus ar klaidingas interpretacijas, kilusias dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->