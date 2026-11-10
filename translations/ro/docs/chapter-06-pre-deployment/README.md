# Capitolul 6: Planificarea și Validarea Pre-Implementare

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 2-4 ore de lectură; timp suplimentar pentru laboratoare adaptate | **⭐ Complexitate**: Intermediar–Avansat

---

## Prezentare generală

Acest capitol acoperă pașii esențiali de planificare și validare înainte de implementarea aplicației tale. Învață să eviți greșelile costisitoare prin planificarea corectă a capacității, selectarea SKU-urilor și verificările prealabile.

> Instrucțiunile de comandă au fost revizuite conform referinței `azd 1.37.2` lansate. Implementările în cloud nu au fost executate. Lecțiile mai lungi includ fragmente ilustrative, nu proiecte complete de implementare locală.

## Obiective de învățare

Parcurgând acest capitol, vei:
- Executa verificări prealabile înainte de implementare
- Planifica capacitatea și estima cerințele de resurse
- Selecta SKU-urile potrivite pentru optimizarea costurilor
- Configura Application Insights pentru monitorizare
- Înțelege modelele de coordonare multi-agent și cerințele lor de implementare

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Verificări Prealabile](preflight-checks.md) | Validarea configurării înainte de implementare | 15 min |
| 2 | [Planificarea Capacității](capacity-planning.md) | Estimarea cerințelor de resurse | 20 min |
| 3 | [Selectarea SKU](sku-selection.md) | Alegerea nivelurilor de preț potrivite | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurarea monitorizării | 20 min |
| 5 | [Modele de Coordonare](coordination-patterns.md) | Design avansat de orchestrare multi-agent | 60-75 min |

---

## 🚀 Pornire Rapidă

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

## ☑️ Lista de verificare pre-implementare

### Înainte de `azd provision`

- [ ] Cotă verificată pentru regiune
- [ ] SKU-uri selectate corespunzător
- [ ] Estimarea costurilor revizuită
- [ ] Convenția de denumire consecventă
- [ ] Securitate/RBAC configurate

### Înainte de `azd deploy`

- [ ] Variabile de mediu setate
- [ ] Secrete în Key Vault
- [ ] Șiruri de conexiune verificate
- [ ] Verificări de sănătate configurate

---

## 💰 Ghid pentru alegerea SKU

| Sarcină de lucru | Dezvoltare | Producție |
|----------|-------------|------------|
| Container Apps | Consum | Consum sau profil dedicat de sarcină de lucru, în funcție de încărcarea măsurată |
| App Service | B1/B2 | P1v3+ |
| Modele Azure OpenAI | Tip de implementare pay-as-you-go acceptat | Pay-as-you-go sau throughput aprovizionat; depinde de model/regiune |
| AI Search | Gratuit/Bază în limite | Nivel Basic sau Standard dimensionat pentru index, replici și încărcare de interogări |

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Următor** | [Capitolul 7: Depanare](../chapter-07-troubleshooting/README.md) |

---

## 📖 Resurse Asemănătoare

- [Ghid de Configurare](../chapter-03-configuration/configuration.md)
- [Ghid de Implementare](../chapter-04-infrastructure/deployment-guide.md)
- [Probleme Comune](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->