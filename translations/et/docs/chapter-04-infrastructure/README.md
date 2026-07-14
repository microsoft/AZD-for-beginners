# 4. peatükk: infrastruktuur kui kood & juurutamine

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 1-1,5 tundi | **⭐ Raskeusaste**: Kesktase

---

## Ülevaade

Selles peatükis käsitletakse infrastruktuuri kui koodi (IaC) mustreid Bicep mallide abil, ressursside loomist ja juurutamisstrateegiaid Azure Developer CLI kasutades.

> Kontrollitud versiooniga `azd 1.27.1` juulis 2026.

## Õpieesmärgid

Selle peatüki läbimisel:
- Mõistad Bicep malli struktuuri ja süntaksit
- Loome Azure ressursse käsuga `azd provision`
- Juurutame rakendusi käsuga `azd deploy`
- Rakendad sinine-roheline ja jooksva värskenduse juurutamisstrateegiaid

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Ressursside loomine](provisioning.md) | Azure ressursside haldus AZD-ga | 45 min |
| 2 | [Juurutamisjuhend](deployment-guide.md) | Rakenduse juurutamisstrateegiad | 45 min |
| 3 | [Oma malli loomine](custom-templates.md) | Taaskasutatavate azd mallide koostamine ja avaldamine | 30 min |

---

## 🚀 Kiire algus

```bash
# Initsialiseeri mallist
azd init --template azure-functions-python-v2-http

# Vaata eelvaadet, mida luuakse
azd provision --preview

# Rajada ainult infrastruktuur
azd provision

# Paigalda ainult kood
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
| `azd init` | Projekti initsialiseerimine |
| `azd provision` | Azure ressursside loomine |
| `azd deploy` | Rakenduse koodi juurutamine |
| `azd up` | juuruta + loo ressursid |
| `azd down` | Kõigi ressursside kustutamine |

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [3. peatükk: Konfiguratsioon](../chapter-03-configuration/README.md) |
| **Järgmine** | [5. peatükk: Mitmeagendi lahendused](../chapter-05-multi-agent/README.md) |

---

## 📖 Seotud ressursid

- [Eeljuurutamise kontrollid](../chapter-06-pre-deployment/README.md)
- [Container App näited](../../examples/container-app/README.md)
- [Andmebaasi rakenduse näide](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->