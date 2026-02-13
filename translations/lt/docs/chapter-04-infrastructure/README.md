# 4 skyrius: Infrastruktūra kaip kodas ir diegimas

**📚 Kursas**: [AZD For Beginners](../../README.md) | **⏱️ Trukmė**: 1–1,5 val. | **⭐ Sudėtingumas**: Vidutinio lygio

---

## Apžvalga

Šis skyrius apima Infrastruktūrą kaip kodą (IaC) su Bicep šablonais, išteklių suteikimą ir diegimo strategijas naudojant Azure Developer CLI.

## Mokymosi tikslai

Baigę šį skyrių, jūs:
- Suprasti Bicep šablono struktūrą ir sintaksę
- Sukurti Azure išteklius naudojant `azd provision`
- Diegti programas naudojant `azd deploy`
- Įgyvendinti blue-green ir rolling diegimo strategijas

---

## 📚 Pamokos

| # | Pamoka | Aprašymas | Laikas |
|---|--------|-------------|------|
| 1 | [Išteklių suteikimas](provisioning.md) | Azure išteklių valdymas su AZD | 45 min |
| 2 | [Diegimo vadovas](deployment-guide.md) | Programų diegimo strategijos | 45 min |

---

## 🚀 Greitas startas

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

## 🔧 Būtinos komandos

| Komanda | Aprašymas |
|---------|-------------|
| `azd init` | Inicializuoti projektą |
| `azd provision` | Sukurti Azure išteklius |
| `azd deploy` | Diegti programos kodą |
| `azd up` | sukurti išteklius + diegti |
| `azd down` | Ištrinti visus išteklius |

---

## 🔗 Navigacija

| Kryptis | Skyrius |
|-----------|---------|
| **Ankstesnis** | [3 skyrius: Konfigūracija](../chapter-03-configuration/README.md) |
| **Kitas** | [5 skyrius: Daugiaagentiniai sprendimai](../chapter-05-multi-agent/README.md) |

---

## 📖 Susiję ištekliai

- [Patikros prieš diegimą](../chapter-06-pre-deployment/README.md)
- [Container App pavyzdžiai](../../examples/container-app/README.md)
- [Duomenų bazės programos pavyzdys](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo pradinėje kalboje turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojamas profesionalus žmogaus atliktas vertimas. Mes neatsakome už bet kokius nesusipratimus ar neteisingus aiškinimus, kilusius naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->