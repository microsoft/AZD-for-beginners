# 6. peatükk: ETTELAEVITUSPLANEERIMINE JA KINNITAMINE

**📚 Kursus**: [AZD algajatele](../../README.md) | **⏱️ Kestus**: 2-4 tundi lugemist; lisaks kohandatud laborid | **⭐ keerukus**: Kesktase–edasijõudnud

---

## Ülevaade

See peatükk käsitleb olulisi planeerimis- ja kinnitusetappe enne rakenduse juurutamist. Õpi vältima kulukaid vigu õige mahutavuse planeerimise, SKU-de valiku ja eelkontrollide abil.

> Käsuviidad kontrolliti vabastatud `azd 1.37.2` referentsi vastu. Pilvejuurutusi ei teostatud. Pikemad õppetunnid sisaldavad illustratiivseid fragmente, mitte täis kohalikke juurutusprojekte.

## Õpieesmärgid

Selle peatüki lõpetamisel:
- Teed eelkontrolle enne juurutamist
- Planeerid mahutavust ja hindad ressursside vajadust
- Valid kulude optimeerimiseks sobivad SKU-d
- Konfigureerid rakenduse jälgimiseks Application Insightsi
- Mõistad mitme agendi koordineerimise mustreid ja nende juurutamise nõudeid

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|--------|-------------|------|
| 1 | [Eelkontrollid](preflight-checks.md) | Kinnita konfiguratsioon enne juurutamist | 15 min |
| 2 | [Mahutavuse planeerimine](capacity-planning.md) | Hinda ressursside vajadust | 20 min |
| 3 | [SKU valik](sku-selection.md) | Vali sobivad hinnatasemed | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigureeri jälgimine | 20 min |
| 5 | [Koordineerimismustrid](coordination-patterns.md) | Edasijõudnud mitme agendi orkestreerimise disain | 60-75 min |

---

## 🚀 Kiirkäivitus

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ Kontrollnimekiri enne juurutamist

### Enne `azd provision`

- [ ] Piirangud piirkonnas kontrollitud
- [ ] SKU-d õigesti valitud
- [ ] Kuluarvestus üle vaadatud
- [ ] Nimekonventsioon järjepidev
- [ ] Turve/RBAC konfigureeritud

### Enne `azd deploy`

- [ ] Keskkonnamuutujad seatud
- [ ] Salajased võtmed Key Vaultis
- [ ] Ühendusread kontrollitud
- [ ] Tervisekontrollid konfigureeritud

---

## 💰 SKU valiku juhend

| Koormus | Arendus | Tootmine |
|----------|-------------|------------|
| Container Apps | Tarbimine | Tarbimine või pühendatud töökoormuse profiil, vastavalt mõõdetud koormusele |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI mudelid | Toetatud pay-as-you-go juurutustüüp | Pay-as-you-go või pühendatud läbilaskevõime; mudelipiirkonnast sõltuv |
| AI Search | Tasuta/Põhiline piirides | Põhiline või Standard tase, suurus sõltub indeksist, koopiatest ja päringukoormusest |

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-----------|---------|
| **Eelmine** | [5. peatükk: Mitme agendi](../chapter-05-multi-agent/README.md) |
| **Järgmine** | [7. peatükk: Tõrkeotsing](../chapter-07-troubleshooting/README.md) |

---

## 📖 Seotud ressursid

- [Konfiguratsioonijuhend](../chapter-03-configuration/configuration.md)
- [Juurutusjuhend](../chapter-04-infrastructure/deployment-guide.md)
- [Tavalised probleemid](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->