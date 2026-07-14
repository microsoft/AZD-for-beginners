# 4 skyrius: Infrastruktūra kaip kodas ir diegimas

**📚 Kursas**: [AZD pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 1-1.5 valandos | **⭐ Sudėtingumas**: Vidutinis

---

## Apžvalga

Šiame skyriuje aptariami Infrastruktūros kaip kodo (IaC) modeliai su Bicep šablonais, išteklių paruošimas ir diegimo strategijos naudojant Azure Developer CLI.

> Patikrinta naudojant `azd 1.27.1` 2026 m. liepos mėn.

## Mokymosi tikslai

Baigę šį skyrių jūs:
- Suprasite Bicep šablonų struktūrą ir sintaksę
- Paruošite Azure išteklius naudodami `azd provision`
- Diegsite programas su `azd deploy`
- Įgyvendinsite mėlyno-žalio ir nuolatinio diegimo strategijas

---

## 📚 Pamokos

| Nr. | Pamoka | Aprašymas | Trukmė |
|---|--------|-------------|------|
| 1 | [Ištekliai paruošimas](provisioning.md) | Azure išteklių valdymas su AZD | 45 min |
| 2 | [Diegimo vadovas](deployment-guide.md) | Programų diegimo strategijos | 45 min |
| 3 | [Savo šablono kūrimas](custom-templates.md) | Kurkite ir publikuokite pakartotinai naudojamus azd šablonus | 30 min |

---

## 🚀 Greitas pradžia

```bash
# Inicializuoti iš šablono
azd init --template azure-functions-python-v2-http

# Peržiūrėti, kas bus sukurta
azd provision --preview

# Tik aprūpinti infrastruktūrą
azd provision

# Tik diegti kodą
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
|---------|-------------|
| `azd init` | Inicijuoti projektą |
| `azd provision` | Kurti Azure išteklius |
| `azd deploy` | Diegti programos kodą |
| `azd up` | paruošti + diegti |
| `azd down` | Ištrinti visus išteklius |

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|-----------|---------|
| **Ankstesnis** | [3 skyrius: Konfigūracija](../chapter-03-configuration/README.md) |
| **Kitas** | [5 skyrius: Daugiagentinės sprendimai](../chapter-05-multi-agent/README.md) |

---

## 📖 Susiję ištekliai

- [Patikrinimai prieš diegimą](../chapter-06-pre-deployment/README.md)
- [Konteinerių programų pavyzdžiai](../../examples/container-app/README.md)
- [Duomenų bazės programos pavyzdys](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->