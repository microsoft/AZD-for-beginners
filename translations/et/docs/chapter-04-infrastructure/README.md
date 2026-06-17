# 4. peatükk: Taristu koodina & Juhtimine

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 1-1.5 tundi | **⭐ Kompleksus**: Kesktase

---

## Ülevaade

See peatükk käsitleb taristu koodina (IaC) mustreid Bicep mallidega, ressursside loomist ja juurutamisstrateegiaid Azure Developer CLI abil.

> Testitud versiooniga `azd 1.25.6` 2026. aasta juunis.

## Õpieesmärgid

Selle peatüki läbimisel:
- Saate aru Bicep malli struktuurist ja süntaksist
- Loote Azure ressursse käsuga `azd provision`
- Juurutate rakendusi käsuga `azd deploy`
- Rakendate sinine-roheline ja järkjärgulise juurutamise strateegiaid

---

## 📚 Tunnid

| # | Tund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Ressursside loomine](provisioning.md) | Azure ressursside haldus AZD abil | 45 min |
| 2 | [Juurutamisjuhend](deployment-guide.md) | Rakenduse juurutamisstrateegiad | 45 min |
| 3 | [Oma malli koostamine](custom-templates.md) | Taaskasutatavate azd mallide loomine ja avaldamine | 30 min |

---

## 🚀 Kiire käivitamine

```bash
# Algata mallist
azd init --template azure-functions-python-v2-http

# Vaata eelvaadet sellest, mis luuakse
azd provision --preview

# Hangi infrastruktuur vaid
azd provision

# Käivita kood vaid
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

| Käsu nimi | Kirjeldus |
|---------|-------------|
| `azd init` | Projekti initsialiseerimine |
| `azd provision` | Azure ressursside loomine |
| `azd deploy` | Rakenduskoodi juurutamine |
| `azd up` | loomine + juurutamine |
| `azd down` | Kõigi ressursside kustutamine |

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [3. peatükk: Konfiguratsioon](../chapter-03-configuration/README.md) |
| **Järgmine** | [5. peatükk: Mitmeagendi lahendused](../chapter-05-multi-agent/README.md) |

---

## 📖 Seotud ressursid

- [Eeljuhutus Kontrollid](../chapter-06-pre-deployment/README.md)
- [Konteinerirakenduste näited](../../examples/container-app/README.md)
- [Andmebaasirakenduse näide](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->