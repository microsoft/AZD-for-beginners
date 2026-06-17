# Kapitel 6: Eeltööde Plaanimine ja Kinnitus

**📚 Kursus**: [AZD Algajatele](../../README.md) | **⏱️ Kestus**: 1 tund | **⭐ Tase**: Kesktase

---

## Ülevaade

See peatükk käsitleb olulisi planeerimise ja kinnitamise samme enne rakenduse juurutamist. Õpi vältima kulukaid vigu õige mahutavuse planeerimise, SKU valiku ja eelkontrollide abil.

> Kinnitatud `azd 1.25.6` versiooniga juunis 2026.

## Õpieesmärgid

Selle peatüki lõpetades:
- Käivitad eelkontrollid enne juurutamist
- Planeerid mahutavust ja hindad ressursivajadusi
- Valid kulude optimeerimiseks sobivad SKU-d
- Konfigureerid Application Insightsi jälgimiseks
- Mõistad meeskonna koordineerimise mustreid

---

## 📚 Õppetunnid

| # | Õppetund | Kirjeldus | Aeg |
|---|----------|-----------|-----|
| 1 | [Eelkontrollid](preflight-checks.md) | Konfiguratsiooni kinnitamine enne juurutamist | 15 min |
| 2 | [Mahutavuse planeerimine](capacity-planning.md) | Ressursivajaduste hindamine | 20 min |
| 3 | [SKU valik](sku-selection.md) | Sobivate hinnaklasside valimine | 15 min |
| 4 | [Application Insights](application-insights.md) | Jälgimise seadistamine | 20 min |
| 5 | [Koordineerimise mustrid](coordination-patterns.md) | Meeskonna juurutustöövood | 15 min |

---

## 🚀 Kiire Start

```bash
# Kontrolli tellimuse piire
az vm list-usage --location eastus --output table

# Juhtseadistuse eelvaade (ressursse ei loodata)
azd provision --preview

# Kontrolli Bicep süntaksit
az bicep build --file infra/main.bicep

# Kontrolli keskkonna seadistust
azd env get-values
```

---

## ☑️ Eeltööde Kontrollnimekiri

### Enne `azd provision`

- [ ] Piirkonna kvotid kinnitatud
- [ ] SKU-d sobivalt valitud
- [ ] Kuluarvestus üle vaadatud
- [ ] Nimekonventsioon järjepidev
- [ ] Turve/RBAC seadistatud

### Enne `azd deploy`

- [ ] Keskkonnamuutujad määratud
- [ ] Saladused Key Vaults
- [ ] Ühendusstringid kontrollitud
- [ ] Tervisekontrollid konfigureeritud

---

## 💰 SKU Valikujuhend

| Koormus | Arendus | Tootmine |
|---------|---------|----------|
| Konteinerirakendused | Tarbimine | Pühendatud D4 |
| Rakenduse teenus | B1/B2 | P1v3+ |
| Microsoft Foundry mudelid | Standard | Standard + PTU |
| AI Otsing | Algeline | Standard S2+ |

---

## 🔗 Navigeerimine

| Suund | Peatükk |
|-------|---------|
| **Eelmine** | [5. peatükk: Mitmeagendi](../chapter-05-multi-agent/README.md) |
| **Järgmine** | [7. peatükk: Tõrkeotsing](../chapter-07-troubleshooting/README.md) |

---

## 📖 Seotud Ressursid

- [Konfiguratsiooni juhend](../chapter-03-configuration/configuration.md)
- [Juurutamisjuhend](../chapter-04-infrastructure/deployment-guide.md)
- [Levinumad probleemid](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->