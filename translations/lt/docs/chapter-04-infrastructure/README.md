# Skyrius 4: Infrastruktūra kaip kodas ir diegimas

**📚 Kursas**: [AZD For Beginners](../../README.md) | **⏱️ Trukmė**: 1–1,5 val. | **⭐ Sudėtingumas**: Vidutinio sudėtingumo

---

## Apžvalga

Šis skyrius apima Infrastruktūrą kaip kodą (IaC) modelius su Bicep šablonais, išteklių teikimą ir diegimo strategijas, naudojant Azure Developer CLI.

> Patikrinta su `azd 1.25.6` 2026 m. birželį.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Suprasite Bicep šablonų struktūrą ir sintaksę
- Sukursite Azure išteklius naudodami `azd provision`
- Diegsite programas naudodami `azd deploy`
- Įgyvendinsite blue-green ir rolling diegimo strategijas

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-------------|------|
| 1 | [Resursų teikimas](provisioning.md) | Azure išteklių valdymas su AZD | 45 min |
| 2 | [Diegimo vadovas](deployment-guide.md) | Programų diegimo strategijos | 45 min |
| 3 | [Kurti savo šabloną](custom-templates.md) | Kurti ir publikuoti pakartotinai naudojamus azd šablonus | 30 min |

---

## 🚀 Greita pradžia

```bash
# Inicializuoti iš šablono
azd init --template azure-functions-python-v2-http

# Peržiūrėti, kas bus sukurta
azd provision --preview

# Tik paruošti infrastruktūrą
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
| `azd init` | Inicializuoti projektą |
| `azd provision` | Sukurti Azure išteklius |
| `azd deploy` | Diegti programos kodą |
| `azd up` | sukurti + diegti |
| `azd down` | Ištrinti visus išteklius |

---

## 🔗 Naršymas

| Kryptis | Skyrius |
|-----------|---------|
| **Ankstesnis** | [3 skyrius: Konfigūracija](../chapter-03-configuration/README.md) |
| **Kitas** | [5 skyrius: Daugiagentiniai sprendimai](../chapter-05-multi-agent/README.md) |

---

## 📖 Susiję ištekliai

- [Priešdiegimo patikrinimai](../chapter-06-pre-deployment/README.md)
- [Konteinerių programų pavyzdžiai](../../examples/container-app/README.md)
- [Duomenų bazės programos pavyzdys](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->