# 4 skyrius: Infrastruktūra kaip kodas ir diegimas

**📚 Kursas**: [AZD pradedantiesiems](../../README.md) | **⏱️ Trukmė**: 2-3 valandos skaitymo; papildomam laikui skirtas diegimo pratimams | **⭐ Sudėtingumas**: Vidutinis

---

## Apžvalga

Šiame skyriuje apžvelgiami Infrastruktūros kaip kodo (IaC) modeliai su Bicep šablonais, išteklių suteikimas ir diegimo strategijos naudojant Azure Developer CLI.

> Komandos ir konfigūracijos peržiūros tikslas: `azd 1.37.2` (2026 m. lapkritis). Gyvas Azure išteklių suteikimas peržiūros metu nebuvo vykdomas.

## Mokymosi tikslai

Baigę šį skyrių jūs:
- Suprasite Bicep šablonų struktūrą ir sintaksę
- Suteiksite Azure išteklius naudodami `azd provision`
- Diegsite programas naudodami `azd deploy`
- Įgyvendinsite mėlyno-žalio ir laipsniško diegimo strategijas

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-------------|------|
| 1 | [Išteklių suteikimas](provisioning.md) | Azure išteklių valdymas su AZD | 45 min |
| 2 | [Diegimo vadovas](deployment-guide.md) | Programų diegimo strategijos | 45 min |
| 3 | [Sukurti savo šabloną](custom-templates.md) | Kurkite ir publikuokite pakartotinai naudojamus azd šablonus | 30 min |

---

## 🚀 Greitas pradžia

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
| `azd init` | Inicializuoti projektą |
| `azd provision` | Kurti Azure išteklius |
| `azd deploy` | Diegti programos kodą |
| `azd up` | suteikti + diegti |
| `azd down` | Ištrinti visus išteklius |

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|-----------|---------|
| **Ankstesnis** | [3 skyrius: Konfigūracija](../chapter-03-configuration/README.md) |
| **Kitas** | [5 skyrius: Daugiagentinės sprendimai](../chapter-05-multi-agent/README.md) |

---

## 📖 Susiję ištekliai

- [Prieš diegimą tikrinimai](../chapter-06-pre-deployment/README.md)
- [Konteinerių programų pavyzdžiai](../../examples/container-app/README.md)
- [Duomenų bazės programos pavyzdys](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->