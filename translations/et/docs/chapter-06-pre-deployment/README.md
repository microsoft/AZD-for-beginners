# 6. peatükk: Eelkäivitamise planeerimine ja valideerimine

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 1 tund | **⭐ Tase**: Kesktase

---

## Ülevaade

Selles peatükis käsitletakse olulisi planeerimise ja valideerimise samme enne teie rakenduse juurutamist. Õppige vältima kulukaid vigu nõuetekohase suutlikkuse planeerimise, SKU valiku ja eelkontrollidega.

> Valideeritud `azd 1.27.1` vastu juulis 2026.

## Õpieesmärgid

Selle peatüki lõpetamise järel:
- Teete eelkontrolle enne juurutamist
- Planeerite suutlikkust ja hindate ressursinõudeid
- Valite sobivad SKU-d kulude optimeerimiseks
- Konfigureerite Application Insights'i jälgimiseks
- Mõistate meeskonna koordineerimise mustreid

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Eelkontrollid](preflight-checks.md) | Kinnitage konfiguratsioon enne juurutamist | 15 min |
| 2 | [Suutlikkuse planeerimine](capacity-planning.md) | Hinnake ressursinõudeid | 20 min |
| 3 | [SKU valik](sku-selection.md) | Valige sobivad hinnakategooriad | 15 min |
| 4 | [Application Insights](application-insights.md) | Jälgimise konfigureerimine | 20 min |
| 5 | [Koordineerimismustrid](coordination-patterns.md) | Meeskonna juurutuse töövood | 15 min |

---

## 🚀 Kiire algus

```bash
# Kontrolli tellimuse kvotasid
az vm list-usage --location eastus --output table

# Eelvaade juurutamisele (ressursse ei loodata)
azd provision --preview

# Kontrolli Bicep süntaksit
az bicep build --file infra/main.bicep

# Kontrolli keskkonna seadistust
azd env get-values
```

---

## ☑️ Eelkontrollide kontrollnimekiri

### Enne `azd provision`

- [ ] Piirmäära kontrollitud regioonis
- [ ] SKU-d asjakohaselt valitud
- [ ] Kulude hinnang üle vaadatud
- [ ] Nimekonventsioon ühtne
- [ ] Turvalisus/RBAC konfigureeritud

### Enne `azd deploy`

- [ ] Keskkonnamuutujad määratud
- [ ] Saladused Key Vault'is
- [ ] Ühendusstringid kontrollitud
- [ ] Tervisekontrollid konfigureeritud

---

## 💰 SKU valiku juhend

| Koormus | Arendus | Tootmine |
|----------|-------------|------------|
| Container Apps | Tarbimine | Pühendatud D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry mudelid | Standard | Standard + PTU |
| AI Search | Põhiline | Standard S2+ |

---

## 🔗 Navigatsioon

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [5. peatükk: Mitme agendi kasutus](../chapter-05-multi-agent/README.md) |
| **Järgmine** | [7. peatükk: Veaotsing](../chapter-07-troubleshooting/README.md) |

---

## 📖 Seotud ressursid

- [Konfiguratsioonijuhend](../chapter-03-configuration/configuration.md)
- [Juurutamisjuhend](../chapter-04-infrastructure/deployment-guide.md)
- [Tavalised probleemid](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->