# Kapitel 4: Infrastruktuur kui Kood & Deployimine

**📚 Kursus**: [AZD Algajatele](../../README.md) | **⏱️ Kestus**: 1-1.5 tundi | **⭐ Kompleksus**: Kesktase

---

## Ülevaade

See peatükk käsitleb infrastruktuuri kui koodi (IaC) mustreid Bicep mallidega, ressursside loomist ja juurutamisstrateegiaid kasutades Azure Developer CLI-d.

> Kinnitatud `azd 1.23.12` vastu märtsis 2026.

## Õpieesmärgid

Selle peatüki läbimisel sa:
- Mõistad Bicep malli struktuuri ja süntaksit
- Loote Azure ressursse käsuga `azd provision`
- Juurutad rakendusi käsuga `azd deploy`
- Rakendad sinise-rohelise ja rataste kaupa juurutamise strateegiaid

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Ressursside loomine](provisioning.md) | Azure ressursihaldus AZD-ga | 45 min |
| 2 | [Deployimise juhend](deployment-guide.md) | Rakenduste juurutamisstrateegiad | 45 min |

---

## 🚀 Kiiralgus

```bash
# Initsialiseeri mallist
azd init --template azure-functions-python-v2-http

# Eelvaade, mis luuakse
azd provision --preview

# Looge ainult taristu
azd provision

# Paigalda ainult kood
azd deploy

# Või mõlemad koos
azd up
```

---

## 📁 AZD Projekti struktuur

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

## 🔧 Olulised käsud

| Käsk | Kirjeldus |
|---------|-------------|
| `azd init` | Projekti initsialiseerimine |
| `azd provision` | Azure ressursside loomine |
| `azd deploy` | Rakenduse koodi juurutamine |
| `azd up` | loomine + juurutamine |
| `azd down` | Kõigi ressursside kustutamine |

---

## 🔗 Navigatsioon

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [3. peatükk: Konfiguratsioon](../chapter-03-configuration/README.md) |
| **Järgmine** | [5. peatükk: Mitmeagendilised lahendused](../chapter-05-multi-agent/README.md) |

---

## 📖 Seotud ressursid

- [Eeldeployimise kontrollid](../chapter-06-pre-deployment/README.md)
- [Konteinerirakenduse näited](../../examples/container-app/README.md)
- [Andmebaasi rakenduse näide](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud kasutades tehisintellektil põhinevat tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüame täpsust, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle emakeeles tuleks pidada autoriteetseks allikaks. Kriitilise info puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta võimalike arusaamatuste või valesti mõistmiste eest, mis võivad tekkida selle tõlke kasutamisest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->