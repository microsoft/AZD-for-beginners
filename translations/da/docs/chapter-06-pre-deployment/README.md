# Kapitel 6: Forud for Udrulning - Planlægning & Validering

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Varighed**: 2-4 timers læsning; yderligere tid til tilpassede øvelser | **⭐ Sværhedsgrad**: Mellem–Avanceret

---

## Oversigt

Dette kapitel dækker væsentlige planlægnings- og valideringstrin før implementering af din applikation. Lær at undgå dyre fejl med korrekt kapacitetsplanlægning, SKU-udvælgelse og forudgående kontrol.

> Kommandoanvisninger gennemgået i forhold til den udgivne `azd 1.37.2` reference. Cloud-udrulninger blev ikke udført. De længere lektioner indeholder illustrerende uddrag, ikke komplette lokale udrulningsprojekter.

## Læringsmål

Når du har gennemført dette kapitel, vil du:
- Køre forudgående kontroller før udrulning
- Planlægge kapacitet og estimere ressourcebehov
- Vælge passende SKU'er for omkostningsoptimering
- Konfigurere Application Insights til overvågning
- Forstå mønstre for multi-agent koordinering og deres udrulningskrav

---

## 📚 Lektioner

| # | Lektion | Beskrivelse | Tid |
|---|--------|-------------|------|
| 1 | [Forudgående Kontroller](preflight-checks.md) | Valider konfiguration før udrulning | 15 min |
| 2 | [Kapacitetsplanlægning](capacity-planning.md) | Estimer ressourcebehov | 20 min |
| 3 | [SKU-Valg](sku-selection.md) | Vælg passende prisniveau | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurer overvågning | 20 min |
| 5 | [Koordinationsmønstre](coordination-patterns.md) | Avanceret multi-agent orkestrering design | 60-75 min |

---

## 🚀 Kom hurtigt i gang

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

## ☑️ Tjekliste før udrulning

### Før `azd provision`

- [ ] Kvote bekræftet for region
- [ ] SKU'er valgt korrekt
- [ ] Omkostningsestimat gennemgået
- [ ] Navngivningskonvention konsekvent
- [ ] Sikkerhed/RBAC konfigureret

### Før `azd deploy`

- [ ] Miljøvariabler sat
- [ ] Hemmeligheder i Key Vault
- [ ] Forbindelsesstrenge verificeret
- [ ] Helbredskontroller konfigureret

---

## 💰 SKU-Valgsvejledning

| Arbejdsbyrde | Udvikling | Produktion |
|----------|-------------|------------|
| Container Apps | Forbrug | Forbrug eller dedikeret arbejdsbyrdeprofil, baseret på målt belastning |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI modeller | Understøttet pay-as-you-go udrulningstype | Pay-as-you-go eller provisioneret throughput; model/region afhængig |
| AI Search | Gratis/Basic inden for grænser | Basic eller Standard trin størrelsesanpasset til indeks, replikaer og forespørgselsbelastning |

---

## 🔗 Navigation

| Retning | Kapitel |
|-----------|---------|
| **Forrige** | [Kapitel 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Næste** | [Kapitel 7: Fejlfinding](../chapter-07-troubleshooting/README.md) |

---

## 📖 Relaterede Ressourcer

- [Konfigurationsvejledning](../chapter-03-configuration/configuration.md)
- [Udrulningsvejledning](../chapter-04-infrastructure/deployment-guide.md)
- [Almindelige Problemer](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->