# 6. peatükk: Eelseadistamise planeerimine ja valideerimine

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 1 tund | **⭐ Raskeaste**: Keskmine

---

## Ülevaade

See peatükk käsitleb olulisi planeerimis- ja valideerimisetappe enne rakenduse juurutamist. Õpi vältima kulukaid vigu õige mahukuse planeerimise, SKU valiku ja eelseisvate kontrollidega.

> Valideeritud `azd 1.23.12` vastu 2026. aasta märtsis.

## Õpieesmärgid

Selle peatüki läbimisel:
- Käivita juurutamiseelne kontroll
- Planeeri mahukust ja hinda ressursside vajadust
- Vali sobivad SKU-d kulude optimeerimiseks
- Konfigureeri Application Insights jälgimiseks
- Mõista meeskonna koordineerimise mustreid

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|----------|-----------|-----|
| 1 | [Juhtimiseelsed kontrollid](preflight-checks.md) | Kontrolli seadistust enne juurutamist | 15 min |
| 2 | [Mahukuse planeerimine](capacity-planning.md) | Hinda ressursside vajadusi | 20 min |
| 3 | [SKU valik](sku-selection.md) | Vali sobivad hinnatasemed | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigureeri jälgimine | 20 min |
| 5 | [Koordineerimismustrid](coordination-patterns.md) | Meeskonna juurutamise töövood | 15 min |

---

## 🚀 Kiire algus

```bash
# Kontrolli tellimuse kvotasid
az vm list-usage --location eastus --output table

# Vaata paigaldust eelvaates (ressursse ei looda)
azd provision --preview

# Kontrolli Bicep süntaksit
az bicep build --file infra/main.bicep

# Kontrolli keskkonna seadistust
azd env get-values
```

---

## ☑️ Eelseadistamise kontrollnimekiri

### Enne `azd provision` käsku

- [ ] Piirkonna limiit kontrollitud
- [ ] SKU-d valitud korrektselt
- [ ] Kuluarvestus üle vaadatud
- [ ] Nimekonventsioon järjepidev
- [ ] Turve/RBAC seadistatud

### Enne `azd deploy` käsku

- [ ] Keskkonnamuutujad määratud
- [ ] Saladused Key Vault'is
- [ ] Ühendustringid kontrollitud
- [ ] Tervisekontrollid seadistatud

---

## 💰 SKU valiku juhend

| Koormus | Arendus | Tootmine |
|----------|---------|----------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry mudelid | Standard | Standard + PTU |
| AI otsing | Basic | Standard S2+ |

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|--------|---------|
| **Eelmine** | [5. peatükk: Mitme agendi juhtimine](../chapter-05-multi-agent/README.md) |
| **Järgmine** | [7. peatükk: Vigade otsimine](../chapter-07-troubleshooting/README.md) |

---

## 📖 Seotud ressursid

- [Seadistamise juhend](../chapter-03-configuration/configuration.md)
- [Juurutamise juhend](../chapter-04-infrastructure/deployment-guide.md)
- [Levinud probleemid](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlemine**:
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame täpsust, olge teadlikud, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument oma emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta käesoleva tõlke kasutamisest tingitud arusaamatuste või valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->