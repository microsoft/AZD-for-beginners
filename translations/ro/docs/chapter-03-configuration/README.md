# Capitolul 3: Configurare și Autentificare

**📚 Curs**: [AZD Pentru Începători](../../README.md) | **⏱️ Durată**: 90-150 minute inclusiv practică de integrare | **⭐ Complexitate**: Intermediar

---

## Prezentare generală

Acest capitol acoperă configurarea mediului, tiparele de autentificare și cele mai bune practici de securitate pentru implementările Azure Developer CLI.

> Ținta revizuirii comenzilor și configurării: `azd 1.37.2` (noiembrie 2026). Provisionarea live Azure nu a fost realizată în timpul revizuirii.

## Obiective de învățare

Finalizând acest capitol, vei putea:
- Stăpâni ierarhia de configurare AZD
- Gestiona mai multe medii (dezvoltare, pre-producție, producție)
- Implementa autentificare securizată cu identități gestionate
- Configura setări specifice mediului

---

## 📚 Lecții

| # | Lecție | Descriere | Timp |
|---|--------|-------------|------|
| 1 | [Ghid de Configurare](configuration.md) | Configurarea și gestionarea mediului | 30 min |
| 2 | [Autentificare și Securitate](authsecurity.md) | Tipare pentru identitate gestionată și RBAC | 30 min |

---

## 🚀 Pornire Rapidă

Rulează din rădăcina unei **aplicații azd deja inițializate**, nu din depozitul cursului. Folosește nume de medii neutilizate dacă acestea există deja.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` este ilustrativ: afectează infrastructura doar dacă șablonul tău îl consumă explicit. Valorile obișnuite `azd env set` sunt salvate local în clar; ele nu reprezintă stocare sigură a secretelor.

---

## 🔧 Ierarhia Configurării

Păstrează separate trei suprafețe diferite de configurare: preferințe globale (`azd config`), structura proiectului (`azure.yaml`) și valorile pe mediu (`azd env`). Flagurile suprascriu doar setările pe care le suportă efectiv; nu există o suprapunere universală a variabilelor de mediu arbitrare peste `azure.yaml` sau Bicep.

---

## 🔐 Cele mai bune practici de securitate

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 Navigare

| Direcție | Capitol |
|-----------|---------|
| **Anterior** | [Capitolul 2: Dezvoltare AI](../chapter-02-ai-development/README.md) |
| **Următor** | [Capitolul 4: Infrastructură](../chapter-04-infrastructure/README.md) |

---

## 📖 Resurse Relaționate

- [Verificări Pre-Implementare](../chapter-06-pre-deployment/README.md)
- [Depanare](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->