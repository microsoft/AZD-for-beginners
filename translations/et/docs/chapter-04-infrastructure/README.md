# 4. peatükk: Infrastruktuur kui kood ja juurutamine

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 2-3 tundi lugemist; varu juurutusharjutusteks lisaaega | **⭐ Keerukus**: Kesktase

---

## Ülevaade

Selles peatükis käsitletakse infrastruktuuri kui koodi (IaC) mustreid Bicep mallide, ressursside provisjoneerimise ja juurutusstrateegiate abil Azure Developer CLI-ga.

> Käsu- ja konfiguratsioonikontrolli siht: `azd 1.37.2` (november 2026). Azure’i live-provisjoneerimist kontrollimisel ei tehtud.

## Õpieesmärgid

Selle peatüki lõpuks:
- Mõistad Bicep malli struktuuri ja süntaksit
- Provisjoneerid Azure ressursse kasutades `azd provision`
- Juurutad rakendusi kasutades `azd deploy`
- Rakendad sinise-rohelise ja pöörleva juurutamise strateegiaid

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Ressursside provisjoneerimine](provisioning.md) | Azure ressursside haldus AZD-ga | 45 min |
| 2 | [Juurutamise juhend](deployment-guide.md) | Rakenduste juurutusstrateegiad | 45 min |
| 3 | [Oma malli koostamine](custom-templates.md) | Korduvkasutatavate azd mallide loomine ja avaldamine | 30 min |

---

## 🚀 Kiire algus

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

## 📁 AZD projekti struktuur

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

## 🔧 Põhikäsud

| Käsk | Kirjeldus |
|---------|-------------|
| `azd init` | Projekti algatamine |
| `azd provision` | Azure ressursside loomine |
| `azd deploy` | Rakenduse koodi juurutamine |
| `azd up` | provisjoneerimine + juurutamine |
| `azd down` | Kõikide ressursside kustutamine |

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [3. peatükk: Konfiguratsioon](../chapter-03-configuration/README.md) |
| **Järgmine** | [5. peatükk: Mitme agendi lahendused](../chapter-05-multi-agent/README.md) |

---

## 📖 Seotud materjalid

- [Enne juurutamist tehtavad kontrollid](../chapter-06-pre-deployment/README.md)
- [Container App näited](../../examples/container-app/README.md)
- [Andmebaasi rakenduse näide](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->