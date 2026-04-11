# Capitolul 6: Planificare și Validare Prealabilă Implementării

**📚 Curs**: [AZD pentru Începători](../../README.md) | **⏱️ Durată**: 1 oră | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol acoperă pașii esențiali de planificare și validare înainte de a implementa aplicația. Învață cum să eviți greșelile costisitoare prin planificarea corectă a capacității, selecția SKU-urilor și verificări prealabile.

> Validat cu `azd 1.23.12` în martie 2026.

## Obiective de învățare

După finalizarea acestui capitol, vei:
- Rula verificări prealabile înainte de implementare
- Planifica capacitatea și estima cerințele de resurse
- Selecta SKU-urile potrivite pentru optimizarea costurilor
- Configura Application Insights pentru monitorizare
- Înțelege modelele de coordonare ale echipei

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Verificări prealabile](preflight-checks.md) | Validează configurația înainte de implementare | 15 min |
| 2 | [Planificarea capacității](capacity-planning.md) | Estimează cerințele de resurse | 20 min |
| 3 | [Selecția SKU-urilor](sku-selection.md) | Alege nivelurile de preț potrivite | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurează monitorizarea | 20 min |
| 5 | [Tipare de coordonare](coordination-patterns.md) | Fluxuri de lucru pentru implementarea în echipă | 15 min |

---

## 🚀 Pornire rapidă

```bash
# Verifică cotele abonamentului
az vm list-usage --location eastus --output table

# Previzualizează implementarea (nu sunt create resurse)
azd provision --preview

# Validează sintaxa Bicep
az bicep build --file infra/main.bicep

# Verifică configurația mediului
azd env get-values
```

---

## ☑️ Listă de verificare înainte de implementare

### Înainte de `azd provision`

- [ ] Cota verificată pentru regiune
- [ ] SKU-urile selectate corespunzător
- [ ] Estimarea costurilor revizuită
- [ ] Convenție de denumire consecventă
- [ ] Securitate/RBAC configurate

### Înainte de `azd deploy`

- [ ] Variabile de mediu setate
- [ ] Secrete în Key Vault
- [ ] Șiruri de conectare verificate
- [ ] Verificări de sănătate configurate

---

## 💰 Ghid de selecție SKU

| Sarcină | Dezvoltare | Producție |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Următor** | [Capitolul 7: Depanare](../chapter-07-troubleshooting/README.md) |

---

## 📖 Resurse conexe

- [Ghid de configurare](../chapter-03-configuration/configuration.md)
- [Ghid de implementare](../chapter-04-infrastructure/deployment-guide.md)
- [Probleme comune](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, ar trebui considerat sursa autorizată. Pentru informații critice, se recomandă traducerea de către un traducător uman profesionist. Nu suntem răspunzători pentru nicio neînțelegere sau interpretare greșită rezultată din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->