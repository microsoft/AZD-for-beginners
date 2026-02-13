# Peatükk 4: Infrastruktuur kui kood & Juurutamine

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Kestus**: 1-1.5 tundi | **⭐ Keerukus**: Keskmine

---

## Ülevaade

See peatükk käsitleb Infrastructure as Code (IaC) mustreid Bicep-mallide abil, ressursside provisioneerimist ja juurutamisstrateegiaid Azure Developer CLI kasutades.

## Õpieesmärgid

Selle peatüki lõpetamisel sa:
- Mõistad Bicep-mallide struktuuri ja süntaksit
- Lood Azure ressursid käsuga `azd provision`
- Juurutad rakendused käsuga `azd deploy`
- Rakendad blue-green ja rolling juurutamisstrateegiaid

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Ressursside provisioneerimine](provisioning.md) | Azure ressursihaldus koos AZD-ga | 45 min |
| 2 | [Juurutamisjuhend](deployment-guide.md) | Rakenduse juurutamisstrateegiad | 45 min |

---

## 🚀 Kiirjuhend

```bash
# Algata mallist
azd init --template azure-functions-python-v2-http

# Eelvaade sellest, mis luuakse
azd provision --preview

# Ainult infrastruktuuri ettevalmistamine
azd provision

# Ainult koodi juurutamine
azd deploy

# Või mõlemad koos
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

## 🔧 Olulised käsud

| Käsk | Kirjeldus |
|---------|-------------|
| `azd init` | Algata projekt |
| `azd provision` | Loo Azure ressursid |
| `azd deploy` | Juuruta rakenduse kood |
| `azd up` | provisioneerimine + juurutamine |
| `azd down` | Kustuta kõik ressursid |

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/README.md) |
| **Järgmine** | [Peatükk 5: Mitmeagendi lahendused](../chapter-05-multi-agent/README.md) |

---

## 📖 Seotud ressursid

- [Eeljuurutuse kontrollid](../chapter-06-pre-deployment/README.md)
- [Konteinerirakenduste näited](../../examples/container-app/README.md)
- [Andmebaasirakenduse näide](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastutusest loobumine:
See dokument on tõlgitud tehisintellekti tõlketeenuse Co‑op Translator (https://github.com/Azure/co-op-translator) abil. Kuigi me püüame tagada täpsuse, palun arvestage, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument tema algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste ega valede tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->